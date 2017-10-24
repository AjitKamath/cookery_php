<?php
    include 'application_context.php';

    $filename = "fetchratingavg.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $rcp_id = isset($_POST['$rcp_id']) ? $_POST['$rcp_id'] : '';

    infologger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    //request

    try{
    //get average rating for $rcp_id
    $query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
    $result = mysqli_query($db,$query);

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
    errlogger($filename, "E", 'Message: ' .$e->getMessage());
    }

    infologger($filename, "I", "-------------'.$filename.'-------------");
    infologger($filename, "I", "");
?>