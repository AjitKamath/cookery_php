<?php
  include 'application_context.php';

  $filename = "fetchrecipereview.php";

  //request
  $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
  //request

  try{
    //get review for $rcp_id & $user_id
    $query = "SELECT RATING, REVIEW, CREATE_DTM, MOD_DTM FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
    $result = mysqli_query($db,$query);
    
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
    errlogger($filename, "E", 'Message: ' .$e->getMessage());
  }
?>