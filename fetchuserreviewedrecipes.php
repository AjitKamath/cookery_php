<?php
  include 'application_context.php';

  $filename = "fetchuserreviewedrecipes.php";

  infologger($filename, "I", "");
  infologger($filename, "I", "-------------fetchuserreviewedrecipes.php-------------");

  //request
  $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

  infologger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
  //request

  try{
    //get all recipes for $user_id
    $query = "SELECT RCP.RCP_ID, RCP.RCP_NAME, RCP.RCP_PLATING, RCP.RCP_NOTE, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME,
              FDCSN.FOOD_CSN_ID, FDTYP.FOOD_TYP_ID, RCP.CREATE_DTM, RCP.MOD_DTM, USR.NAME
              FROM `RECIPE` AS RCP 
							INNER JOIN `USER` USR ON USR.USER_ID = RCP.USER_ID
              INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
              INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
							INNER JOIN `REVIEWS` AS RW ON RW.USER_ID = RCP.USER_ID AND RW.RCP_ID = RCP.RCP_ID
							WHERE RCP.USER_ID = '$user_id'
							AND RW.IS_DEL = 'N'";
    
    $result = mysqli_query($db,$query);
    
    $result_array = array();
    while($result_data = $result->fetch_object()){
      $recipe_array = array();
      
      $recipe_array['RCP_ID'] = $result_data->RCP_ID;
      $recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
      $recipe_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
      $recipe_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
			$recipe_array['createDateTime'] = $result_data->CREATE_DTM;
			$recipe_array['modifiedDateTime'] = $result_data->MOD_DTM;
			$recipe_array['NAME'] = $result_data->NAME;
      
      //fetch likes for the recipe
      $query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE_ID = '$result_data->RCP_ID' AND TYPE = 'RECIPE' AND IS_DEL = 'N'";
      $likes_result = mysqli_query($db,$query);
    
      if($likes_result_data = $likes_result->fetch_object()){
         $recipe_array['likes'] = $likes_result_data->LIKES_COUNT;
      }
      //fetch likes for the recipe
      
      //fetch views for the recipe
      $query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$result_data->RCP_ID'";
      $views_result = mysqli_query($db,$query);
			
      if($views_result_data = $views_result->fetch_object()){
         $recipe_array['views'] = $views_result_data->VIEWS_COUNT;
      }
      //fetch views for the recipe
      
      //fetch avg rating for the recipe
      $query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$result_data->RCP_ID'";
      $review_result = mysqli_query($db,$query);
    
      if($review_result_data = $review_result->fetch_object()){
         $recipe_array['rating'] = $review_result_data->RATING;
      }
      //fetch avg rating for the recipe
      
      //fetch images for the recipe
      $query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$result_data->RCP_ID' LIMIT 1";
      $img_result = mysqli_query($db,$query);
    
      $img_result_array = array();
      if($img_result_data = $img_result->fetch_object()){
        array_push($img_result_array, $img_result_data->RCP_IMG); 
      }
      $recipe_array['RCP_IMGS'] = $img_result_array;
      //fetch images for the recipe
      
      array_push($result_array, $recipe_array); 
    }
    //get all recipes for $user_id
    
    infologger($filename, "I", "Total Recipes fetched : ".sizeof($result_array));
    
    infologger($filename, "I", "-------------fetchuserreviewedrecipes.php-------------");
    infologger($filename, "I", "");
    
    //response
    echo json_encode($result_array);
    //response
  }
  catch(Exception $e){
    errlogger($filename, "E", 'Message: ' .$e->getMessage());
  }

  infologger($filename, "I", "-------------fetchuserreviewedrecipes.php-------------");
  infologger($filename, "I", "");
?>