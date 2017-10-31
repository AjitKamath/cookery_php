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

  $result_array = array();

  try{
    //get user performed actions in timeline
    $query = "SELECT TMLN_ID, TYPE, TYPE_ID, CREATE_DTM FROM `TIMELINES` WHERE USER_ID = '$user_id' LIMIT $index , ".TIMELINES_COUNT;
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $user_id;
        
      array_push($result_array, $timeline_array);
    }
    //get user performed actions in timeline
    
    //get others performed actions in timeline
    //get others comment on users recipe
    $query = "SELECT TMLN_ID, TMLN.TYPE, TMLN.TYPE_ID, TMLN.CREATE_DTM, TMLN.USER_ID 
              FROM `TIMELINES` AS TMLN 
              INNER JOIN `COMMENTS` AS COM ON COM.COM_ID = TMLN.TYPE_ID
              INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = COM.RCP_ID
              WHERE COM.USER_ID = '$user_id'";
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;
        
      array_push($result_array, $timeline_array);
    }
    //get others comment on users recipe
    
    //get others like on users recipe
    $query = "SELECT TMLN_ID, TMLN.TYPE, TMLN.TYPE_ID, TMLN.CREATE_DTM, TMLN.USER_ID 
              FROM `TIMELINES` AS TMLN 
              INNER JOIN `LIKES` AS LIK ON LIK.LIKE_ID = TMLN.TYPE_ID
              INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = LIK.TYPE_ID
              WHERE LIK.USER_ID = '$user_id'
              AND LIK.TYPE = 'RECIPE'";
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;
        
      array_push($result_array, $timeline_array);
    }
    //get others like on users recipe
    
    //get others like on users comment
    $query = "SELECT TMLN_ID, TMLN.TYPE, TMLN.TYPE_ID, TMLN.CREATE_DTM, TMLN.USER_ID 
              FROM `TIMELINES` AS TMLN 
              INNER JOIN `LIKES` AS LIK ON LIK.LIKE_ID = TMLN.TYPE_ID
              INNER JOIN `COMMENTS` AS COM ON COM.RCP_ID = LIK.TYPE_ID
              WHERE LIK.USER_ID = '$user_id'
              AND LIK.TYPE = 'COMMENT'";
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;
        
      array_push($result_array, $timeline_array);
    }
    //get others like on users comment
    
    //get others like on users review
    $query = "SELECT TMLN_ID, TMLN.TYPE, TMLN.TYPE_ID, TMLN.CREATE_DTM, TMLN.USER_ID 
              FROM `TIMELINES` AS TMLN 
              INNER JOIN `LIKES` AS LIK ON LIK.LIKE_ID = TMLN.TYPE_ID
              INNER JOIN `REVIEWS` AS REV ON REV.RCP_ID = LIK.TYPE_ID
              WHERE LIK.USER_ID = '$user_id'
              AND LIK.TYPE = 'REVIEW'";
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;
        
      array_push($result_array, $timeline_array);
    }
    //get others like on users review
    
    //get others reviews on users recipe
    $query = "SELECT TMLN_ID, TMLN.TYPE, TMLN.TYPE_ID, TMLN.CREATE_DTM, TMLN.USER_ID 
              FROM `TIMELINES` AS TMLN 
              INNER JOIN `REVIEWS` AS REV ON REV.REV_ID = TMLN.TYPE_ID
              INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
              WHERE REV.USER_ID = '$user_id'";
    $result = mysqli_query($db,$query);
    
    while($result_data = $result->fetch_object()){
      $timeline_array = array();
        
      $timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
      $timeline_array['TYPE'] = $result_data->TYPE;
      $timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
      $timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
      $timeline_array['USER_ID'] = $result_data->USER_ID;
        
      array_push($result_array, $timeline_array);
    }
    //get others reviews on users recipe
    //get others performed actions in timeline
    
    //response
    echo json_encode($result_array);
    //response
  }
  catch(Exception $e){
    logger($filename, "E", 'Message: ' .$e->getMessage());
  }

  logger($filename, "I", "-------------".$filename."-------------");
?>