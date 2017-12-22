<?php
	class Like{
		public static function fetchLikedUsers($type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$result_array = self::getLikedUsers($con, $type, $type_id);
				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getLikedUsers($con, $type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT LIK.USER_ID, LIK.MOD_DTM, LIK.CREATE_DTM, USR.NAME, USR.IMG
							FROM `LIKES` AS LIK
							INNER JOIN USER AS USR ON USR.USER_ID = LIK.USER_ID
							WHERE TYPE = '".$type."' 
							AND TYPE_ID = '".$type_id."'
							AND LIK.IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_obj = $result->fetch_object()){
					$temp_array['USER_ID'] = $result_obj->USER_ID; 
					$temp_array['MOD_DTM'] = $result_obj->MOD_DTM;
					$temp_array['CREATE_DTM'] = $result_obj->CREATE_DTM;
					$temp_array['NAME'] = $result_obj->NAME;
					$temp_array['IMG'] = $result_obj->IMG;
					
					array_push($result_array, $temp_array); 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function isUserLiked($con, $user_id, $type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS LIKES_COUNT 
							FROM `LIKES` 
							WHERE TYPE = '".$type."' 
							AND TYPE_ID = '".$type_id."' 
							AND USER_ID = '".$user_id."' 
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					return $result_data->LIKES_COUNT > 0;
				}
				
				return false;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function getUserLikeCount($con, $user_id, $type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS LIKES_COUNT 
							FROM `LIKES` 
							WHERE TYPE = '".$type."' 
							AND TYPE_ID = '".$type_id."'
							AND USER_ID = '".$user_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->LIKES_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function getLikeCount($con, $type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS LIKES_COUNT 
							FROM `LIKES` 
							WHERE TYPE = '".$type."' 
							AND TYPE_ID = '".$type_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->LIKES_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function submitLike($user_id, $type, $type_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$type.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//check if $user_id has already liked $type & $type_id
				$query = "SELECT LIKE_ID, IS_DEL FROM LIKES WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";
				$result = mysqli_query($con, $query);

				//if there is already an entry in LIKES table
				if($result_data = $result->fetch_object()){
					//if the user has unliked it, like it
					if('Y' == $result_data->IS_DEL){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has not liked the type(".$type.") with type id(".$type_id."). liking it.");

						$query = "UPDATE LIKES SET IS_DEL = 'N', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");

							//register timeline
							//get user_id of the type
							$query = "";
							$timeline_type = "UNKNOWN";
							if("COMMENT" == $type){
								$query = "SELECT USER_ID FROM `COMMENTS` WHERE COM_ID = '$type_id'";
								$timeline_type = LIKE_COMMENT_ADD;
							}
							else if("RECIPE" == $type){
								$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$type_id'";
								$timeline_type = LIKE_RECIPE_ADD;
							}
							else if("REVIEW" == $type){
								$query = "SELECT USER_ID FROM `REVIEWS` WHERE REV_ID = '$type_id'";
								$timeline_type = LIKE_REVIEW_ADD;
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not understand the like TYPE('".$type."')");
							}

							$result_temp = mysqli_query($con, $query);
							if($result_temp_data = $result_temp->fetch_object()){  
								Timeline::addTimeline($con, $user_id, $result_temp_data->USER_ID, $timeline_type, $result_data->LIKE_ID);
							}
							//get user_id of the type
							//register timeline

						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
						}
					}
					//if the user has unliked it, like it
					//if the user has liked it, unlike it
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has already liked the type(".$type.") with type id(".$type_id."). unliking it.");

						$query = "UPDATE LIKES SET IS_DEL = 'Y', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has unliked the type(".$type.") with type id(".$type_id.") successfully.");

							//register timeline
							//get user_id of the type
							$query = "";
							$timeline_type = "UNKNOWN";
							if("COMMENT" == $type){
								$query = "SELECT USER_ID FROM `COMMENTS` WHERE COM_ID = '$type_id'";
								$timeline_type = LIKE_COMMENT_REMOVE;
							}
							else if("RECIPE" == $type){
								$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$type_id'";
								$timeline_type = LIKE_RECIPE_REMOVE;
							}
							else if("REVIEW" == $type){
								$query = "SELECT USER_ID FROM `REVIEWS` WHERE REV_ID = '$type_id'";
								$timeline_type = LIKE_REVIEW_REMOVE;
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not understand the like TYPE('".$type."')");
							}

							$result_temp = mysqli_query($con, $query);
							if($result_temp_data = $result_temp->fetch_object()){  
								Timeline::addTimeline($con, $user_id, $result_temp_data->USER_ID, $timeline_type, $result_data->LIKE_ID);
							}
							//get user_id of the type
							//register timeline
						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not unlike the type(".$type.") with type id(".$type_id.") successfully.");
						}
					}
					//if the user has liked it, unlike it
				}
				//if there is already an entry in LIKES table
				//if there is no entry in LIKES table
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has not yet liked the type(".$type.") with type id(".$type_id."). So liking it");

					$query = "INSERT INTO `LIKES` (`USER_ID`, `TYPE`, `TYPE_ID` , `CREATE_DTM`) VALUES ('$user_id', '$type', '$type_id',  CURRENT_TIMESTAMP)";

					if(mysqli_query($con, $query)){
						$like_id = mysqli_insert_id($con);

						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");

						//register timeline
						//get user_id of the type
						$query = "";
						$timeline_type = "UNKNOWN";
						if("COMMENT" == $type){
							$query = "SELECT USER_ID FROM `COMMENTS` WHERE COM_ID = '$type_id'";
							$timeline_type = LIKE_COMMENT_ADD;
						}
						else if("RECIPE" == $type){
							$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$type_id'";
							$timeline_type = LIKE_RECIPE_ADD;
						}
						else if("REVIEW" == $type){
							$query = "SELECT USER_ID FROM `REVIEWS` WHERE REV_ID = '$type_id'";
							$timeline_type = LIKE_REVIEW_ADD;
						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not understand the like TYPE('".$type."')");
						}

						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							Timeline::addTimeline($con, $user_id, $result_data->USER_ID, $timeline_type, $like_id);
						}
						//get user_id of the type
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
					} 
				}
				//if there is no entry in LIKES table
				//check if $user_id has already liked $type & $type_id

				$result_array = array();

				//check the status (liked/unliked)
				$query = "SELECT COUNT(*) AS LIKES_COUNT FROM LIKES WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					if($result_data->LIKES_COUNT != 0){
						$result_array['isLiked'] = true;
					}
					else{
						$result_array['isLiked'] = false;
					}

					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "The user(".$user_id.") for the type(".$type.") with type id(".$type_id.") has liked ? ".$result_array['isLiked']);
				}
				//check the status (liked/unliked)

				//get total likes for the $type & $type_id
				$query = "SELECT COUNT(*) AS LIKES_COUNT FROM LIKES WHERE TYPE = '$type' AND TYPE_ID = '$type_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					$result_array['likes'] = $result_data->LIKES_COUNT;

					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "The type(".$type.") with type id(".$type_id.") has been liked ".$result_array['likes']." times");
				}
				//get total likes for the $type & $type_id

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
	}
?>