<?php
    include_once('import_util.php');

    $filename = "fetchrecipereview.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    //request

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty rcp id");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //get review for $rcp_id & $user_id
        $query = "SELECT RATING, REVIEW, CREATE_DTM, MOD_DTM FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
        $result = mysqli_query($con, $query);

        $result_array = array();
        if($result_data = $result->fetch_object()){
          $result_array['RATING'] = $result_data->RATING;
          $result_array['REVIEW'] = $result_data->REVIEW;
        }
        else{
          $result_array['RATING'] = "0";
          $result_array['REVIEW'] = "";
        }
        //get review for $rcp_id & $user_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
    finally{
        close_connection();
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>