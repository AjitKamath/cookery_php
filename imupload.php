<?php

// Path to move uploaded files
$target_path = "/opt/lampp/htdocs/bmb/bookim/";

$isError;
$errorMessage;
$exception;
$userMessage;
$filename = "imupload.php";
 
// array for final json response
$response = array();
  
if (isset($_FILES['image']['name'])) {
    
    $title = isset($_POST['title']) ? $_POST['title'] : '';

    $temp = explode(".", $_FILES["image"]["name"]);
    $newfilename = $title;
    $target_path = $target_path . $newfilename;
    $response['file_name'] = basename($_FILES['image']['name']);
 
    $category_id = isset($_POST['category_id']) ? $_POST['category_id'] : '';
    $author = isset($_POST['author']) ? $_POST['author'] : '';
    $publication = isset($_POST['publication']) ? $_POST['publication'] : '';
    $description = isset($_POST['description']) ? $_POST['description'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $rent = isset($_POST['rent']) ? $_POST['rent'] : '';
    $min_duration = isset($_POST['min_duration']) ? $_POST['min_duration'] : '';
    $max_duration = isset($_POST['max_duration']) ? $_POST['max_duration'] : '';
    
    try {
        include 'config_roll.php';
        include 'config.php';
        include 'Logger.php';
       
        $mysqli->query("START TRANSACTION");

        $q1_ok=true;
        $q2_ok=true;


        $SQL1 = "INSERT INTO `BOOK` (`TITLE`, `COUNT`, `CTGRY_ID`, `AUTHOR`, `PUBLICATION`, `DESCRIPTION`, `IMAGE`, `CREATE_DTM`)   VALUES ('$title',2,'$category_id', '$author', '$publication', '$description', '$target_path', CURRENT_TIMESTAMP)";

        
        try{
            $mysqli->query($SQL1) ? null : $q1_ok=false;

            if(!$q1_ok){
                logger($filename, "E", "Query failure : ".$SQL1);
                throw new Exception("Query failure : ".$SQL1);
            }

            $book_id = $mysqli->insert_id;  
        
            $SQL2 = "INSERT INTO `USER_BOOK_SHARE` (`USER_ID`, `BOOK_ID`, `RENT`, `MIN_DURATION`, `MAX_DURATION`, `ACTIVE`) VALUES ('$user_id', '$book_id', '$rent', '$min_duration', '$max_duration', 'Y')";

            $mysqli->query($SQL2) ? null:$q2_ok=false;

            if(!$q2_ok){
                logger($filename, "E", "Query failure : ".$SQL2);
                throw new Exception("Query failure : ".$SQL2);
            }

            if (move_uploaded_file($_FILES['image']['tmp_name'], $target_path)) {
                $isError = false;
                $errorMessage = 'No Errors';
                $exception = 'No Exceptions';
                $userMessage = 'Your book has been shared sucessfully';
                logger($filename, "I", $userMessage);

                $mysqli->commit();  
            }
            else{
                $isError = true;
                $errorMessage = 'Book image upload failed';
                $exception = 'Cannot capture exception';
                $userMessage = 'Could not share the book. Please try again.';
                logger($filename, "E", $userMessage);

                $mysqli->rollback();
            }             
        }
        catch(Exception $e){
            $isError = true;
            $errorMessage = 'Query Failed';
            $exception = $e."~~~MYSQL ERROR:".$mysqli->error;
            $userMessage = 'Could not share the book. Please try again.';
            logger($filename, "E", $userMessage);

            $mysqli->rollback();
        }
    } catch (Exception $e) {
        $isError = true;
        $errorMessage = 'Something went wrong';
        $exception = $e;
        $userMessage = 'Could not share the book. Please try again.';
    }
} else {
    $isError = true;
    $errorMessage = 'Book image not recieved';
    $exception = 'cannot capture exception';
    $userMessage = 'Could not share the book. Please try again.';
}

$response['PHP'] = "imupload";
$response['IS_ERROR'] = $isError;
$response['ERROR_MESSAGE'] = $errorMessage;
$response['EXCEPTION'] = $exception;
$response['USER_MESSAGE'] = $userMessage;
 
// Echo final json response to client
echo json_encode($response);
?>