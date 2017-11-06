<?php
    include 'application_context.php';
    include('constants.php');

    $filename = "deletereview.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rev_id = isset($_POST['rev_id']) ? $_POST['rev_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rev_id(".$rev_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    try{
        //delete review
        $query = "UPDATE `REVIEWS` SET IS_DEL = 'Y' WHERE REV_ID = '".$rev_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($db, $query)){
            logger($filename, "I" , "Review('$rev_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";
            
            //register timeline
            include_once('registerusertimeline.php');
            register_timeline($user_id, $user_id, REVIEW_RECIPE_REMOVE, $rev_id);
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