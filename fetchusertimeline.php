<?php
  include 'application_context.php';
  include_once('constants.php');

  $filename = "fetchusertimeline.php";

  logger($filename, "I", "");
  logger($filename, "I", "-------------".$filename."-------------");

  //request
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
  $index = isset($_POST['index']) ? $_POST['index'] : '';

  logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
  logger($filename, "I", "REQUEST PARAM : index(".$index.")");
  //request

  try{
    //get timeline performed by user or performed on his items
    $query = "SELECT TMLN_ID, TYPE, TYPE_ID, USER_ID, REF_USER_ID, CREATE_DTM FROM `TIMELINES` WHERE USER_ID = '$user_id' OR REF_USER_ID = '$user_id' LIMIT $index , ".TIMELINES_COUNT;
    $result = mysqli_query($db,$query);
    
    $result_array = array();
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;;
      $timeline_array['REF_USER_ID'] = $result_data->REF_USER_ID;;
        
      array_push($result_array, $timeline_array);
    }
    //get timeline performed by user or performed on his items
    
    //response
    echo json_encode($result_array);
    //response
  }
  catch(Exception $e){
    logger($filename, "E", 'Message: ' .$e->getMessage());
  }

  logger($filename, "I", "-------------".$filename."-------------");
?>