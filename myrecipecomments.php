<?php
    include 'application_context.php';
    include('constants.php');

    $filename = "myrecipecomments.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------"$filename"-------------");

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
            session_start();
            $_SESSION["user_id"] = $user_id;
            $_SESSION["type"] = COMMENT_RECIPE_ADD;
            $_SESSION["type_id"] = $comment_id;
            header('Location: registerusertimeline.php'); 
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

    logger($filename, "I", "-------------"$filename"-------------");
?>