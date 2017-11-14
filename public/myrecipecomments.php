<?php
    include_once('import_util.php');

    $filename = "myrecipecomments.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //response
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $comment = isset($_POST['comment']) ? $_POST['comment'] : '';

    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : comment(".$comment.")");
    //response

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty com id");
        return;
    }

    if(!check_for_null($comment)){
        logger($filename, "E", "Error ! null/empty comment");
        return;
    }
    //check for null/empty

    try{
        $con = DatabaseUtil::getInstance()->open_connection();
        
        $query = "INSERT INTO `COMMENTS` (`RCP_ID`, `USER_ID`, `COMMENT` , `CREATE_DTM`) VALUES 
                    ('$rcp_id', '$user_id', '$comment',  CURRENT_TIMESTAMP)";                         

        if(! mysqli_query($con, $query)){
            logger($filename, "E", "Query failure : ".$query);
            throw new Exception("Query failure : ".$query);
        }
        else{
            $comment_id = mysqli_insert_id($con);
            
            logger($filename, "I" , "Comment added successfully as ".$comment);
            $success = "Comment Added Successfully";
            echo $success;
            
            //register timeline
            //get user_id of the recipe
            $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
            $result = mysqli_query($con, $query);
            if($result_data = $result->fetch_object()){  
                register_timeline($con, $user_id, $result_data->USER_ID, COMMENT_RECIPE_ADD, $comment_id);
            }
            //get user_id of the recipe
            //register timeline
        }
    }
    catch(Exception $e){
        $isError = true;
        $errorMessage = 'Query Failed';
        $exception = $e."MYSQL ERROR:";
        $userMessage = 'Could not add comment. Please try again.';
        logger($filename, "E", $userMessage." Error ".$exception);
    }
    finally{
        DatabaseUtil::getInstance()->close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>