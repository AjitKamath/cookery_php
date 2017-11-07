<?php
    include_once('import_util.php');

    $filename = "fetchcommentsdetails.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rcp_id("$rcp_id")");
    //request

    //check for null/empty
    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty rcp id");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //get comments for $rcp_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, COM.COMMENT, COM.CREATE_DTM, COM.MOD_DTM FROM COMMENTS COM 
                  INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID WHERE RCP_ID = '$rcp_id' AND COM.IS_DEL = 'N'";
        $result = mysqli_query($db,$query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
            array_push($result_array, $result_data);
        }
        //get comments for $rcp_id

        logger($filename, "I", "Total comments fetched : ".sizeof($result_array));
        
        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
    finally{
        close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>