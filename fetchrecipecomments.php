<?php
    include_once('import_util.php');

    $filename = "fetchrecipecomments.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '6';

    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
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
        $query = "SELECT COM_ID, COMMENT, COM.CREATE_DTM, USR.IMG, USR.USER_ID 
                FROM COMMENTS COM 
                INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID 
                WHERE RCP_ID = '$rcp_id'
                AND COM.IS_DEL = 'N'";
        $result = mysqli_query($con, $query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
            $temp_array['COM_ID'] = $result_data->COM_ID;
            $temp_array['COMMENT'] = $result_data->COMMENT;
            $temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
            $temp_array['IMG'] = $result_data->IMG;
            $temp_array['USER_ID'] = $result_data->USER_ID;
            
            array_push($result_array, $temp_array);
        }
        //get comments for $rcp_id

        logger($filename, "I", "Total comments fetched for rcp_id('.$rcp_id.') : ".sizeof($result_array));
        
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