<?php
    include 'application_context.php';
    include('constants.php');

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

    try{
        $commentsql = "INSERT INTO `COMMENTS` (`RCP_ID`, `USER_ID`, `COMMENT` , `CREATE_DTM`) VALUES 
                    ('$rcp_id', '$user_id', '$comment',  CURRENT_TIMESTAMP)";                         

        $q0_ok = true;
        $comment_id = $mysqli->query($commentsql);
        $comment_id ? null : $q0_ok=false;

        if(!$q0_ok){
            logger($filename, "E", "Query failure : ".$commentsql);
            throw new Exception("Query failure : ".$commentsql);
        }
        else{
            logger($filename, "I" , "Comment added successfully as ".$comment);
            $success = "Comment Added Successfully";
            echo $success;
            
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
    }
    catch(Exception $e){
        $isError = true;
        $errorMessage = 'Query Failed';
        $exception = $e."MYSQL ERROR:";
        $userMessage = 'Could not add comment. Please try again.';
        logger($filename, "E", $userMessage." Error ".$exception);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>