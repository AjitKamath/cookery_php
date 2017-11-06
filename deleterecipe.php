<?php
    include 'application_context.php';
    include('constants.php');

    $filename = "deleterecipe.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    try{
        //delete recipe
        $query = "UPDATE `RECIPE` SET IS_DEL = 'Y' WHERE RCP_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($db, $query)){
            logger($filename, "I" , "Recipe('$rcp_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";
            
            //register timeline
            include_once('registerusertimeline.php');
            register_timeline($user_id, $user_id, RECIPE_REMOVE, $rcp_id);
            //register timeline
        }
        else{
            logger($filename, "E", "Failed !! Recipe('$rcp_id') could not be deleted by the user('$user_id')");
            echo "FAIL";
        } 
        //delete recipe
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
        echo "FAIL";
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>