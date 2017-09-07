<?php

    include 'application_context.php';
    $filename = "testforlogger.php";

 /*       $temp = explode(".", $_FILES["image"]["name"]);
    $newfilename = $title;
    $target_path = $target_path . $newfilename;
    $response['file_name'] = basename($_FILES['image']['name']);
 */


 try {

        //echo "entered in try".$filename; 
        logger($filename, "E", "Query failure : ");
        throw new Exception("Query failure : ");
    }
      catch(Exception $e)
      {
            $isError = true;
            $errorMessage = 'Query Failed';
            $exception = $e."~~~MYSQL ERROR:";
            $userMessage = 'Could not share the . Please try again.';
            logger($filename, "E", $userMessage);
        }


?>