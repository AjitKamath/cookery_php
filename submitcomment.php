<?php
    include_once('import_util.php');

    $filename = "submitcomment.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $comment = isset($_POST['comment']) ? $_POST['comment'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    logger($filename, "I", "REQUEST PARAM : comment(".$comment.")");
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

    if(!check_for_null($comment)){
        logger($filename, "E", "Error ! null/empty comment");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //insert comment
        $query = "INSERT INTO COMMENTS('RCP_ID', 'USER_ID', 'COMMENT', 'CREAT_DTM') VALUES('$rcp_id', '$user_id', '$comment', CURRENT_TIMESTAMP)";

        if(mysqli_query($con, $query)){
            $com_id = mysqli_insert_id($con);
            
            logger($filename, "I" , "Comment('$comment') successfully submitted by the user('$user_id') for the recipe('$rcp_id')");
            
            echo "SUCCESS";
            
            //register timeline
            //get user_id of the recipe
            $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
            $result = mysqli_query($con, $query);
            if($result_data = $result->fetch_object()){  
                register_timeline($con, $user_id, $result_data->USER_ID, COMMENT_RECIPE_ADD, $com_id);
            }
            //get user_id of the recipe
            //register timeline
        }
        else{
            logger($filename, "E", "Failed !! Comment('$comment') could not be submitted by the user('$user_id') for the recipe('$rcp_id')");
            echo "FAIL";
        } 
        //insert comment
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