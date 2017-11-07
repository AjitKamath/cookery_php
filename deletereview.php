<?php
    include_once('import_util.php');

    $filename = "deletereview.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rev_id = isset($_POST['rev_id']) ? $_POST['rev_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rev_id(".$rev_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($rev_id)){
        logger($filename, "E", "Error ! null/empty rev id");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //delete review
        $query = "UPDATE `REVIEWS` SET IS_DEL = 'Y' WHERE REV_ID = '".$rev_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($con, $query)){
            logger($filename, "I" , "Review('$rev_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";
            
            //register timeline
            register_timeline($con, $user_id, $user_id, REVIEW_RECIPE_REMOVE, $rev_id);
            //register timeline
        }
        else{
            logger($filename, "E", "Failed !! Review('$rev_id') could not be deleted by the user('$user_id')");
            echo "FAIL";
        } 
        //delete review
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
        echo "FAIL";
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>