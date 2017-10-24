<?php
    include 'application_context.php';

    $filename = "fetchviewsdetails.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';

    infologger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    //request

    try{
        //get views details for $rcp_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG FROM VIEWS VW INNER JOIN USER USR ON USR.USER_ID = VW.USER_ID WHERE RCP_ID = '$rcp_id'";
        $result = mysqli_query($db,$query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
            array_push($result_array, $result_data);
        }
        //get views details for $rcp_id

        infologger($filename, "I", "Total views fetched for rcp_id('.$rcp_id.') : ".sizeof($result_array));
        
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