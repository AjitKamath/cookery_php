<?php
    include 'application_context.php';

    $filename = "fetchreviewsdetails.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    //request

    try{
        //get reviews for $rcp_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, REV.RATING, REV.REVIEW, REV.CREATE_DTM, REV.MOD_DTM FROM REVIEWS REV 
                  INNER JOIN USER USR ON USR.USER_ID = REV.USER_ID WHERE RCP_ID = '$rcp_id' AND REV.IS_DEL = 'N'";
        $result = mysqli_query($db,$query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
          array_push($result_array, $result_data);
        }
        //get reviews for $rcp_id

        logger($filename, "I", "Total reviews fetched for rcp_id('.$rcp_id.') : ".sizeof($result_array));
        
        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>