<?php
	include_once('import_util.php');

	$filename = "fetchuserrecipesreviews.php";

	logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

	//request
	$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

	logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
	//request

	//check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }
	//check for null/empty

	try{
		$con = open_connection();
		
		//get all recipes & its reviews for $user_id
		$query = "SELECT RCP.RCP_ID, RW.REV_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME, USR.NAME
				FROM `RECIPE` AS RCP 
				INNER JOIN `USER` USR ON USR.USER_ID = RCP.USER_ID
				INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
				INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
				INNER JOIN `REVIEWS` AS RW ON RW.RCP_ID = RCP.RCP_ID
				WHERE RW.USER_ID = '$user_id'
				AND RCP.IS_DEL = 'N'
				AND RW.IS_DEL = 'N'";

		$result = mysqli_query($con, $query);

		$result_array = array();
		while($result_data = $result->fetch_object()){
			$recipe_array = array();

			$recipe_array['RCP_ID'] = $result_data->RCP_ID;
			$recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
			$recipe_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
			$recipe_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
			$recipe_array['NAME'] = $result_data->NAME;

			//fetch review for the particular recipe
			$query = "SELECT REVIEW, RATING, CREATE_DTM, MOD_DTM FROM `REVIEWS` WHERE REV_ID = '$result_data->REV_ID' AND IS_DEL = 'N'";
			$review_result = mysqli_query($con, $query);

			$review_result_array = array();
			if($review_result_data = $review_result->fetch_object()){
				$temp_array['REVIEW'] = $review_result_data->REVIEW;
				$temp_array['RATING'] = $review_result_data->RATING;
				$temp_array['CREATE_DTM'] = $review_result_data->CREATE_DTM;
				$temp_array['MOD_DTM'] = $review_result_data->MOD_DTM;

				//fetch likes count for this particular review
				$query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE_ID = '$result_data->REV_ID' AND TYPE = 'REVIEW' AND IS_DEL = 'N'";
				$like_result = mysqli_query($con, $query);

				if($like_result_data = $like_result->fetch_object()){
					$temp_array['likeCount'] = $like_result_data->LIKES_COUNT;
				}
				//fetch likes count for this particular review

				array_push($review_result_array, $temp_array); 
			}

			//fetch images for the recipe
			$query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$result_data->RCP_ID' LIMIT 1";
			$img_result = mysqli_query($con, $query);

			$img_result_array = array();
			if($img_result_data = $img_result->fetch_object()){
				array_push($img_result_array, $img_result_data->RCP_IMG); 
			}
			$recipe_array['RCP_IMGS'] = $img_result_array;
			//fetch images for the recipe

			$recipe_array['reviews'] = $review_result_array;
			//fetch review for the particular recipe

			array_push($result_array, $recipe_array); 
		}
		//get all recipes & its reviews for $user_id

		logger($filename, "I", "Total Recipes Reviews fetched : ".sizeof($result_array));

		//response
		echo json_encode($result_array);
		//response
	}
	catch(Exception $e){
		logger($filename, "E", 'Message: ' .$e->getMessage());
	}
	finally{
		close_connection($con);
	}

	logger($filename, "I", "-------------".$filename."-------------");
?>