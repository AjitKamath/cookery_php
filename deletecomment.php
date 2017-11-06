<?php
    include 'application_context.php';
    include('constants.php');

    $filename = "deletecomment.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $com_id = isset($_POST['com_id']) ? $_POST['com_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : com_id(".$com_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    try{
        //delete comment
        $query = "UPDATE `COMMENTS` SET IS_DEL = 'Y' WHERE COM_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($db, $query)){
            logger($filename, "I" , "Comment('$com_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";
            
            //register timeline
            include_once('registerusertimeline.php');
            register_timeline($user_id, $user_id, COMMENT_RECIPE_REMOVE, $com_id);
            //register timeline
        }
        else{
            logger($filename, "E", "Failed !! Comment('$com_id') could not be deleted by the user('$user_id')");
            echo "FAIL";
        } 
        //delete comment
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
        echo "FAIL";
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>