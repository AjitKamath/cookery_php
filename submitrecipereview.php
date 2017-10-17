<?php
  include 'application_context.php';

  $filename = "submitrecipereview.php";

  //request
  $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
  $review = isset($_POST['review']) ? $_POST['review'] : '';
  $rating = isset($_POST['rating']) ? $_POST['rating'] : '';
  //request

  try{
    //check if user already reviewed the $rcp_id
    $query = "SELECT REV_ID, IS_DEL FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
    $result = mysqli_query($db,$query);
    
    //user has already reviewed
    if($result_data = $result->fetch_object()){
      $query = "UPDATE REVIEWS SET IS_DEL = 'N',REVIEW = '$review',MOD_DTM = CURRENT_TIMESTAMP,RATING = '$rating' WHERE RCP_ID = $rcp_id AND USER_ID = $user_id";
      
      if(mysqli_query($db,$query)){
        infologger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
      }
      else{
        errlogger($filename, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
      }
    }
    //user is reviewing for the first time
    else{
      $query = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`, `MOD_DTM`) VALUES('$rcp_id', '$user_id', '$review', '$rating' , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
      
      if($mysqli->query($query)){
        infologger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
      }
      else{
         errlogger($filename, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
      } 
    }
    //check if user already reviewed the $rcp_id
    
    $result_array = array();
    
    //check users review status
    $query = "SELECT COUNT(*) AS REVIEW_COUNT FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
    $result = mysqli_query($db,$query);
    
    if($result_data = $result->fetch_object()){
      if($result_data->REVIEW_COUNT > 0){
        $result_array['isReviewed'] = true;
      }
      else{
        $result_array['isReviewed'] = false;
      }
    }
    //check users review status
    
    //get avg rating of the $rcp_id
    $query = "SELECT ROUND(AVG(RATING), 1) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
    $result = mysqli_query($db,$query);
    
    if($result_data = $result->fetch_object()){
      $result_array['rating'] = $result_data->RATING;
    }
    //get avg rating of the $rcp_id
    
    //response
    echo json_encode($result_array);
    //response
  }
  catch(Exception $e){
    errlogger($filename, "E", 'Message: ' .$e->getMessage());
  }
?>