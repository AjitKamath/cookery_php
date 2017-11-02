<?php
	$filename = "util_recipe.php";

	function getRecipeDetails($rcp_id, $user_id, $user_has_viewed){
		include_once('Logger.php');
		include_once('config.php');
		include_once('util.php');
		
		$filename = $GLOBALS['filename'];
		
		//validations
		if(!check_for_null($rcp_id)){
            logger($filename, "E", "Error ! null/empty recipe id");
            return;
        }
		
		if(!check_for_null($user_id)){
            logger($filename, "E", "Error ! null/empty user id");
            return;
        }
		
		if(!check_for_null($user_has_viewed)){
            logger($filename, "E", "Error ! null/empty user_has_viewed. Expecting true/false.");
            return;
        }
		//validations
		
		try{
			$query = "SELECT USR.NAME, RCP.RCP_ID, RCP.RCP_NAME, RCP.RCP_PROC, RCP.RCP_PLATING, RCP.RCP_NOTE, FDCSN.FOOD_CSN_NAME, 
								FDTYP.FOOD_TYP_NAME, FDCSN.FOOD_CSN_ID, FDTYP.FOOD_TYP_ID
								FROM `RECIPE` AS RCP 
								INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
								INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
								INNER JOIN `USER` AS USR ON RCP.USER_ID = USR.USER_ID 
								WHERE RCP.RCP_ID = '$rcp_id'
								AND RCP.IS_DEL = 'N'";
			
			$result = mysqli_query($db, $query);
			
			$result_array = array();
			if($result_data = $result->fetch_object()){
				$result_array['RCP_ID'] = $result_data->RCP_ID;
				$result_array['RCP_NAME'] = $result_data->RCP_NAME;
				$result_array['RCP_PROC'] = $result_data->RCP_PROC;
				$result_array['RCP_PLATING'] = $result_data->RCP_PLATING;
				$result_array['RCP_NOTE'] = $result_data->RCP_NOTE;
				$result_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
				$result_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
				$result_array['FOOD_CSN_ID'] = $result_data->FOOD_CSN_ID;
				$result_array['FOOD_TYP_ID'] = $result_data->FOOD_TYP_ID;
				$result_array['NAME'] = $result_data->NAME;
				
				//recipe images
				$images_query = "SELECT RCP_IMG_ID, RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$rcp_id'";
				$images_result = mysqli_query($db, $images_query);
				
				$images_result_array = array();
				while($images_result_data = $images_result->fetch_object()){
					array_push($images_result_array, $images_result_data->RCP_IMG);  
				}
				$result_array['RCP_IMGS'] = $images_result_array;
				//recipe images
				
				//recipe ingredients
				$ing_query = "SELECT ING.ING_ID, ING.ING_NAME, QTY.QTY_NAME, DSH.ING_QTY FROM `DISH` AS DSH 
							INNER JOIN `RECIPE` AS RCP ON DSH.RCP_ID = RCP.RCP_ID
							INNER JOIN  `INGREDIENT` AS ING ON ING.ING_ID = DSH.ING_OR_AKA_ID
							INNER JOIN  `QTY` AS QTY ON QTY.QTY_ID = DSH.QTY_ID
							WHERE RCP.RCP_ID = '$rcp_id' ";
				$ing_result = mysqli_query($db, $ing_query);
				
				$ing_result_array = array();
				while($ing_result_data = $ing_result->fetch_object()){
					$temparr['ING_ID'] = $ing_result_data->ING_ID;
					$temparr['ING_NAME'] = $ing_result_data->ING_NAME;
					$temparr['QTY_NAME'] = $ing_result_data->QTY_NAME;
					$temparr['ING_QTY'] = $ing_result_data->ING_QTY;

					array_push($ing_result_array, $temparr);  
				}
				$result_array['ingredients'] = $ing_result_array;
				//recipe ingredients
				
				//recipe likes count
				$likes_count_query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE = 'RECIPE' AND TYPE_ID = '$rcp_id'";
				$likes_count_result = mysqli_query($db, $likes_count_query);
				
				if($likes_count_result_data = $likes_count_result->fetch_object()){
					$result_array['likes'] = $likes_count_result_data->LIKES_COUNT;
				}
				//recipe likes count
				
				//if the user has liked recipe
				$user_has_liked_query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE = 'RECIPE' AND TYPE_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$user_has_liked_result = mysqli_query($db, $user_has_liked_query);
				
				if($user_has_liked_result_data = $user_has_liked_result->fetch_object()){
					$result_array['isLiked'] = $user_has_liked_result_data->LIKES_COUNT > 0;
				}
				//if the user has liked recipe
				
				//recipe views count
				$views_count_query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$rcp_id'";
				$views_count_result = mysqli_query($db, $views_count_query);
				
				if($views_count_result_data = $views_count_result->fetch_object()){
					$result_array['views'] = $views_count_result_data->VIEWS_COUNT;
				}
				//recipe views count
				
				//check if the user has viewed this recipe. if not, register it. This must be done only if $user_has_viewed == true
				if($user_has_viewed){
					$user_has_viewed_query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
					$user_has_viewed_result = mysqli_query($db, $user_has_viewed_query);

					if($user_has_viewed_result_data = $user_has_viewed_result->fetch_object()) {
						if($user_has_viewed_result_data->VIEWS_COUNT == 0){
							$register_user_view_query = "INSERT INTO `VIEWS`(`USER_ID`, `RCP_ID`, `CREATE_DTM`) VALUES('$user_id', '$rcp_id', CURRENT_TIMESTAMP)";
							$mysqli->query($register_user_view_query);
						}
					}
				}
				//check if the user has viewed this recipe. if not, register it. This must be done only if $user_has_viewed == true
				
				//recipe average rating
				$avg_rating_query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
				$avg_rating_result = mysqli_query($db, $avg_rating_query);
				
				if($avg_rating_result_data = $avg_rating_result->fetch_object()){
					$result_array['rating'] = $avg_rating_result_data->RATING;
				}
				//recipe average rating
				
				//check if the user has reviewed this recipe
				$user_has_reviewed_query = "SELECT COUNT(*) AS REVIEW_COUNT FROM `REVIEWS` WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$user_has_reviewed_result = mysqli_query($db, $user_has_reviewed_query);
				
				if($user_has_reviewed_result_data = $user_has_reviewed_result->fetch_object()){
					$result_array['isReviewed'] = $user_has_reviewed_result_data->REVIEW_COUNT > 0;
				}
				//check if the user has reviewed this recipe
				
				$response_array = array();
				array_push($response_array, $result_array);
				
				//response
				return json_encode($response_array);
				//response
			}
		}
		catch(Exception $e){
	  		logger($filename, "E", 'Error ! Could not fetch recipe');
			logger($filename, "E", $e->getMessage());
		}	
	}
?>
