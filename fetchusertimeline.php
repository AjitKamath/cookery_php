<?php
  include 'application_context.php';

  $filename = "fetchuserdetails.php";

  infologger($filename, "I", "");
  infologger($filename, "I", "-------------'.$filename.'-------------");

  //request
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

  infologger($filename, "I", "REQUEST PARAM : user_id("$user_id")");
  //request

  try{
    //get timeline for $user_id
    $query = "SELECT TMLN_ID, TYPE, TYPE_ID, CREATE_DTM FROM `TIMELINES` WHERE USER_ID '$user_id'";
    $result = mysqli_query($db,$query);
    
    $result_array = array();
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['createdDateTime'] = $result_data->CREATE_DTM;
        
      array_push($result_array, $timeline_array);
    }
    //get timeline for $user_id
    
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