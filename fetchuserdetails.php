<?php
  include 'application_context.php';

  $filename = "fetchuserdetails.php";

  logger($filename, "I", "");
  logger($filename, "I", "-------------".$filename."-------------");

  //request
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

  logger($filename, "I", "REQUEST PARAM : user_id("$user_id")");
  //request

  try{
    //get user details for the $user_id
    $query = "SELECT USER_ID, NAME, EMAIL, IMG FROM `USER` WHERE USER_ID '$user_id'";
    $result = mysqli_query($db,$query);
    
    $result_array = array();
    if($result_data = $result->fetch_object()){
      $result_array['USER_ID'] = $result_data->USER_ID;
      $result_array['NAME'] = $result_data->NAME;
      $result_array['EMAIL'] = $result_data->EMAIL;
      $result_array['IMG'] = $result_data->IMG;
    }
    //get user details for the $user_id
    
    //response
    echo json_encode($result_array);
    //response
  }
  catch(Exception $e){
    logger($filename, "E", 'Message: ' .$e->getMessage());
  }

  logger($filename, "I", "-------------".$filename."-------------");
?>