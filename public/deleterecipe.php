<?php
    include_once('../util/import_util.php');

    $filename = "deleterecipe.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty rcp id");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //delete recipe
        $query = "UPDATE `RECIPE` SET IS_DEL = 'Y' WHERE RCP_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

        if(mysqli_query($con, $query)){
            logger($filename, "I" , "Recipe('$rcp_id') successfully deleted by the user('$user_id')");
            echo "SUCCESS";
            
            //register timeline
            register_timeline($con, $user_id, $user_id, RECIPE_REMOVE, $rcp_id);
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
    finally{
        close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>