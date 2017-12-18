<?php
	class Review{
		public static function fetchAverageRecipeRating($rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp id");
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
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function deleteReview($rev_id, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rev_id(".$rev_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($rev_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rev id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//delete review
				$query = "UPDATE `REVIEWS` SET IS_DEL = 'Y' WHERE REV_ID = '".$rev_id."' AND USER_ID = '".$user_id."'";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "Review('$rev_id') successfully deleted by the user('$user_id')");
					
					$result_arr["err_code"]="0";
					$result_arr["isError"]=false;
					$result_arr["err_message"]="Review deleted !";

					//register timeline
					Timeline::addTimeline($con, $user_id, $user_id, REVIEW_RECIPE_REMOVE, $rev_id);
					//register timeline
				}
				else{
					$result_arr["err_code"]="1";
					$result_arr["isError"]=true;
					$result_arr["err_message"]="Review delete failed !";
					
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! Review('$rev_id') could not be deleted by the user('$user_id')");
				} 
				
				echo json_encode($result_arr);
				//delete review
			}
			catch(Exception $e){
				$result_arr["err_code"]="1";
				$result_arr["isError"]=true;
				$result_arr["err_message"]="Review delete failed !";
				
				echo json_encode($result_arr);
				
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function submitReview($rcp_id, $user_id, $review, $rating){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : review(".$review.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rating(".$rating.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp id");
				return;
			}

			if(!Util::check_for_null($review)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty review");
				return;
			}

			if(!Util::check_for_null($rating)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rating");
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
					$rev_id = $result_data->REV_ID;
					
					$query = "UPDATE REVIEWS SET IS_DEL = 'N', REVIEW = '$review', MOD_DTM = CURRENT_TIMESTAMP, RATING = '$rating' WHERE RCP_ID = $rcp_id AND USER_ID = $user_id";

					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");

						//register timeline
						//get user_id of the recipe
						$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							Timeline::addTimeline($con, $user_id, $result_data->USER_ID, REVIEW_RECIPE_MODIFY, $rev_id);
						}
						//get user_id of the recipe
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
					}
				}
				//user is reviewing for the first time
				else{
					$query = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`) VALUES('$rcp_id', '$user_id', '$review', '$rating' , CURRENT_TIMESTAMP)";

					if(mysqli_query($con, $query)){
						$rev_id = mysqli_insert_id($con);

						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");

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
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
					} 
				}
				//check if user already reviewed the $rcp_id

				$result_array = array();

				//check users review status
				$query = "SELECT COUNT(*) AS REVIEW_COUNT FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					if($result_data->REVIEW_COUNT > 0){
						$temp_array['isReviewed'] = true;
					}
					else{
						$temp_array['isReviewed'] = false;
					}
				}
				//check users review status

				//get avg rating of the $rcp_id
				$query = "SELECT ROUND(AVG(RATING), 1) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					$temp_array['RATING'] = $result_data->RATING;
				}
				//get avg rating of the $rcp_id

				array_push($result_array, $temp_array); 
				
				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUserRecipeReview($user_id, $rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				echo json_encode(self::getUserRecipeReview($con, $user_id, $rcp_id));
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getUserRecipeReview($con, $user_id, $rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp_id");
				return;
			}
			//check for null/empty

			try{
				//get recipe review by the logged in user
				$query = "SELECT REV_ID, REVIEW, RATING, RVS.CREATE_DTM, RVS.MOD_DTM
							FROM REVIEWS AS RVS
							WHERE RVS.RCP_ID = '".$rcp_id."'
							AND RVS.USER_ID = '".$user_id."'
							AND RVS.IS_DEL = 'N'";

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$temp_array['REV_ID'] = $result_data->REV_ID;
					$temp_array['REVIEW'] = $result_data->REVIEW;
					$temp_array['RATING'] = $result_data->RATING;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					//fetch like count for the review
					$temp_array['likeCount'] = Like::getLikeCount($con, "REVIEW", $result_data->REV_ID);
					//fetch like count for the review
					
					//check if user has liked the review
					if($temp_array['likeCount'] > 0){
						if(Like::getUserLikeCount($con, $user_id, "REVIEW", $result_data->REV_ID) > 0){
							$temp_array['userLiked'] = true;
						}
					}
					//check if user has liked the review
					
					array_push($result_array, $temp_array); 
					//get recipe review by the logged in user 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function fetchUsersReviews($user_id, $rcp_id, $index){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : index(".$index.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp_id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get all recipes & its reviews for $user_id
				$query = "SELECT REV_ID, REVIEW, RATING, USR.IMG, USR.USER_ID, USR.NAME, RVS.CREATE_DTM, RVS.MOD_DTM
							FROM REVIEWS AS RVS
							INNER JOIN USER AS USR ON USR.USER_ID = RVS.USER_ID
							WHERE RVS.RCP_ID = '".$rcp_id."'
							AND RVS.IS_DEL = 'N'
							LIMIT ".$index." , ".REVIEWS_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$temp_array['REV_ID'] = $result_data->REV_ID;
					$temp_array['REVIEW'] = $result_data->REVIEW;
					$temp_array['RATING'] = $result_data->RATING;
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['name'] = $result_data->NAME;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					//fetch like count for the review
					$temp_array['likeCount'] = Like::getLikeCount($con, "REVIEW", $result_data->REV_ID);
					//fetch like count for the review
					
					//check if user has liked the review
					if($temp_array['likeCount'] > 0){
						if(Like::getUserLikeCount($con, $user_id, "REVIEW", $result_data->REV_ID) > 0){
							$temp_array['userLiked'] = true;
						}
					}
					//check if user has liked the review
										
					array_push($result_array, $temp_array); 
				}
				
				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
    }
?>