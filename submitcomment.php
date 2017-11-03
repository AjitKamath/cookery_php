<?php
    include 'application_context.php';
    include('constants.php');

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

    try{
        //insert comment
        $query = "INSERT INTO COMMENTS('RCP_ID', 'USER_ID', 'COMMENT', 'CREAT_DTM') VALUES('$rcp_id', '$user_id', '$comment', CURRENT_TIMESTAMP)";

        if($comment_id = $mysqli->query($query)){
            logger($filename, "I" , "Comment('$comment') successfully submitted by the user('$user_id') for the recipe('$rcp_id')");
            
            echo "SUCCESS";
            
            //register timeline
            //get user_id of the recipe
            $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
            $result = mysqli_query($db,$query);
            if($result_data = $result->fetch_object()){  
                include_once('registerusertimeline.php');
                register_timeline($user_id, $result_data->USER_ID, COMMENT_RECIPE_ADD, $comment_id);
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

    logger($filename, "I", "-------------".$filename."-------------");
?>