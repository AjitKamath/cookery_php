<?php
	class Review{
		public static function isUserReviewed($con, $user_id, $rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS REVIEW_COUNT 
							FROM `REVIEWS` 
							WHERE RCP_ID = '".$rcp_id."' 
							AND USER_ID = '".$user_id."' 
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					return $result_data->REVIEW_COUNT == 1;
				}
				
				return false;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function getReviewsCount($con, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS REVIEWS_COUNT 
							FROM `REVIEWS` AS REV
							INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
							WHERE RCP.USER_ID = '".$user_id."'
							AND REV.IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->REVIEWS_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
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
				$result_array = array();
				$result_array['RATING'] = self::getAverageRecipeRating($con, $rcp_id);
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
		
		public static function getAverageRecipeRating($con, $rcp_id){
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
				//get average rating for $rcp_id
				$query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					return $result_data->RATING;
				}
				//get average rating for $rcp_id

				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
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
					Timeline::addTimeline($con, $user_id, $user_id, REVIEW_RECIPE_REMOVE, $rev_id, DEFAULT_SCOPE_ID);
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
							Timeline::addTimeline($con, $user_id, $result_data->USER_ID, REVIEW_RECIPE_ADD, $rev_id, DEFAULT_SCOPE_ID);
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
							Timeline::addTimeline($con, $user_id, $result_data->USER_ID, REVIEW_RECIPE_ADD, $rev_id, DEFAULT_SCOPE_ID);
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

				//if user reviewed tje recipe
				$temp_array['userReviewed'] = self::isUserReviewed($con, $user_id, $rcp_id);
				//if user reviewed tje recipe
				
				//get avg rating of the $rcp_id
				$temp_array['avgRating'] = self::getAverageRecipeRating($con, $rcp_id);
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
					$temp_array['likesCount'] = Like::getLikeCount($con, "REVIEW", $result_data->REV_ID);
					//fetch like count for the review
					
					//if user liked the review
					$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, "REVIEW", $result_data->REV_ID);
					//if user liked the review
					
					array_push($result_array, $temp_array); 
					//get recipe review by the logged in user 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function fetchUsersReviews($user_id, $index){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : index(".$index.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
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
				$query = "SELECT REV_ID, RCP.RCP_ID, RCP_NAME, FOOD_TYP_NAME, FOOD_CSN_NAME, REVIEW, RATING, USR.IMG, USR.USER_ID, USR.NAME, RVS.CREATE_DTM, RVS.MOD_DTM
							FROM `REVIEWS` AS RVS
							INNER JOIN `USER` AS USR ON USR.USER_ID = RVS.USER_ID 
							INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = RVS.RCP_ID
							INNER JOIN `FOOD_TYPE` AS FOOD_TYP ON FOOD_TYP.FOOD_TYP_ID = RCP.FOOD_TYP_ID
							INNER JOIN `FOOD_CUISINE` AS FOOD_CSN ON FOOD_CSN.FOOD_CSN_ID = RCP.FOOD_CSN_ID
							WHERE RVS.USER_ID = '".$user_id."'
							AND RVS.IS_DEL = 'N'
							AND RCP.IS_DEL = 'N'
							LIMIT ".$index." , ".REVIEWS_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$temp_array['REV_ID'] = $result_data->REV_ID;
					$temp_array['RCP_ID'] = $result_data->RCP_ID;
					$temp_array['REVIEW'] = $result_data->REVIEW;
					$temp_array['RATING'] = $result_data->RATING;
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					$temp_array['recipeName'] = $result_data->RCP_NAME;
					$temp_array['foodTypeName'] = $result_data->FOOD_TYP_NAME;
					$temp_array['foodCuisineName'] = $result_data->FOOD_CSN_NAME;
					$temp_array['recipeOwnerName'] = $result_data->NAME;
					
					//fetch like count for the review
					$temp_array['likesCount'] = Like::getLikeCount($con, "REVIEW", $result_data->REV_ID);
					//fetch like count for the review
					
					//if user liked the review
					$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, "REVIEW", $result_data->REV_ID);
					//if user liked the review
					
					//fetch primary image for the recipe
					$temp_array['recipeImages'] = Recipe::getRecipePrimaryImage($con, $user_id, $result_data->RCP_ID);
					//fetch primary image for the recipe
										
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
		
		public static function fetchRecipeReviews($user_id, $rcp_id, $index){
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
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					$temp_array['userName'] = $result_data->NAME;
					$temp_array['userImage'] = $result_data->IMG;
					
					//get users who have liked the review
					//$temp_array['likes'] = Like::getLikedUsers($con, "REVIEW", $result_data->REV_ID);
					//get users who have liked the review
					
					//likes count
					$temp_array['likesCount'] = Like::getLikeCount($con, "REVIEW", $result_data->REV_ID);
					//likes count
					
					//if the user has liked review
					$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, "REVIEW", $result_data->REV_ID);
					//if the user has liked review
										
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