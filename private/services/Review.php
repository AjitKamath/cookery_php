<?php
	class Review{
		public static function fetchAverageRecipeRating($rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty rcp id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get average rating for $rcp_id
				$query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()){
					$result_array['RATING'] = $result_data->RATING;
				}
				//get average rating for $rcp_id

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function deleteReview($rev_id, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : rev_id(".$rev_id.")");
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($rev_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty rev id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//delete review
				$query = "UPDATE `REVIEWS` SET IS_DEL = 'Y' WHERE REV_ID = '".$rev_id."' AND USER_ID = '".$user_id."'";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, "I" , "Review('$rev_id') successfully deleted by the user('$user_id')");
					echo "SUCCESS";

					//register timeline
					Timeline::addTimeline($con, $user_id, $user_id, REVIEW_RECIPE_REMOVE, $rev_id);
					//register timeline
				}
				else{
					LoggerUtil::logger(__CLASS__, "E", "Failed !! Review('$rev_id') could not be deleted by the user('$user_id')");
					echo "FAIL";
				} 
				//delete review
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
				echo "FAIL";
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function submitReview($rcp_id, $user_id, $review, $rating){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : review(".$review.")");
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : rating(".$rating.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty rcp id");
				return;
			}

			if(!Util::check_for_null($review)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty review");
				return;
			}

			if(!Util::check_for_null($rating)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty rating");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//check if user already reviewed the $rcp_id
				$query = "SELECT REV_ID, IS_DEL FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
				$result = mysqli_query($con, $query);

				//user has already reviewed
				if($result_data = $result->fetch_object()){
					$query = "UPDATE REVIEWS SET IS_DEL = 'N', REVIEW = '$review', MOD_DTM = CURRENT_TIMESTAMP, RATING = '$rating' WHERE RCP_ID = $rcp_id AND USER_ID = $user_id";

					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");

						//register timeline
						//get user_id of the recipe
						$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							Timeline::addTimeline($user_id, $result_data->USER_ID, REVIEW_RECIPE_MODIFY, $result->REV_ID);
						}
						//get user_id of the recipe
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
					}
				}
				//user is reviewing for the first time
				else{
					$query = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`) VALUES('$rcp_id', '$user_id', '$review', '$rating' , CURRENT_TIMESTAMP)";

					if(mysqli_query($con, $query)){
						$rev_id = mysqli_insert_id($con);

						LoggerUtil::logger(__CLASS__, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");

						//register timeline
						//get user_id of the recipe
						$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							Timeline::addTimeline($con, $user_id, $result_data->USER_ID, REVIEW_RECIPE_ADD, $rev_id);
						}
						//get user_id of the recipe
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
					} 
				}
				//check if user already reviewed the $rcp_id

				$result_array = array();

				//check users review status
				$query = "SELECT COUNT(*) AS REVIEW_COUNT FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

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
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					$result_array['rating'] = $result_data->RATING;
				}
				//get avg rating of the $rcp_id

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
        public static function fetchUsersReviews($user_id){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

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
					$recipe_array['FOOD_CSN_NAME'] = $result_data->FOODl_CSN_NAME;
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

				LoggerUtil::logger(__CLASS__, "I", "Total Recipes Reviews fetched : ".sizeof($result_array));

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
    }
?>