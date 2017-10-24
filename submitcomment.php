<?php
    include 'application_context.php';

    $filename = "submitcomment.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $comment = isset($_POST['comment']) ? $_POST['comment'] : '';

    infologger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    infologger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    infologger($filename, "I", "REQUEST PARAM : comment(".$comment.")");
    //request

    try{
        //insert comment
        $query = "INSERT INTO COMMENTS('RCP_ID', 'USER_ID', 'COMMENT', 'CREAT_DTM', 'MOD_DTM') VALUES('$rcp_id', '$user_id', '$comment', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

        if($mysqli->query($query)){
            infologger($filename, "I" , "Comment('$comment') successfully submitted by the user('$user_id') for the recipe('$rcp_id')");
        }
        else{
            errlogger($filename, "E", "Failed !! Comment('$comment') could not be submitted by the user('$user_id') for the recipe('$rcp_id')");
        } 
        //insert comment

        //get all the comments data for $rcp_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, COM.COMMENT, COM.CREAT_DTM, COM.MOD_DTM FROM COMMENTS COM 
                INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID WHERE COM.RCP_ID = '$rcp_id' AND COM.IS_DEL = 'N'";
        $result = mysqli_query($db,$query);

        $result_array = array();
        if($result_data = $result->fetch_object()){
            array_push($result_array, $result_data);
        }
        //get all the comments data for $rcp_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        errlogger($filename, "E", 'Message: ' .$e->getMessage());
    }

    infologger($filename, "I", "-------------'.$filename.'-------------");
    infologger($filename, "I", "");
?>