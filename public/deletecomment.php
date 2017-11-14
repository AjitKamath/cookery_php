<?php
    include_once('../util/import_util.php');

    $filename = "deletecomment.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $com_id = isset($_POST['com_id']) ? $_POST['com_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

    logger($filename, "I", "REQUEST PARAM : com_id(".$com_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($com_id)){
        logger($filename, "E", "Error ! null/empty com id");
        return;
    }
    //check for null/empty

    try{
        $con = DatabaseUtil::getInstance()->open_connection();

        //delete comment
        $query = "UPDATE `COMMENTS` SET IS_DEL = 'Y' WHERE COM_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($con,  $query)){
            logger($filename, "I" , "Comment('$com_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";

            //register timeline
            register_timeline($con, $user_id, $user_id, COMMENT_RECIPE_REMOVE, $com_id);
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
    finally{
        DatabaseUtil::getInstance()->close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>