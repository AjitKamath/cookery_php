<?php
    include_once('../util/import_util.php');

    $filename = "fetchratingavg.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['$rcp_id']) ? $_POST['$rcp_id'] : '';

    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    //request

    //check for null/empty
    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty rcp id");
        return;
    }
    //check for null/empty

    try{
        $con = DatabaseUtil::getInstance()->open_connection();
        
        //get average rating for $rcp_id
        $query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
        $result = mysqli_query($con, $query);

        $result_array = array();
        if($result_data = $result->fetch_object()){
            $result_array['RATING'] = $result_data->RATING;
        }
        //get average rating for $rcp_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
    finally{
        DatabaseUtil::getInstance()->close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>