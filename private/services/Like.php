<?php
	class Like{
		public static function fetchLikedUsers($loggedInUserId, $type, $type_id, $index){
			//check for null/empty
			if(!Util::check_for_null($loggedInUserId)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."loggedInUserId");
				return;
			}
			
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$result_array = self::getLikedUsers($con, $loggedInUserId, $type, $type_id, $index);
				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getLikedUsers($con, $loggedInUserId, $type, $type_id, $index){
			//check for null/empty
			if(!Util::check_for_null($loggedInUserId)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."loggedInUserId");
				return;
			}
			
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT LIK.USER_ID, LIK.MOD_DTM, LIK.CREATE_DTM, USR.NAME, USR.IMG
							FROM `LIKES` AS LIK
							INNER JOIN USER AS USR ON USR.USER_ID = LIK.USER_ID
							WHERE TYPE = '".$type."' 
							AND TYPE_ID = '".$type_id."'
							AND LIK.IS_DEL = 'N'
							LIMIT ".$index." , ".USERS_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_obj = $result->fetch_object()){
					$temp_array['USER_ID'] = $result_obj->USER_ID; 
					$temp_array['MOD_DTM'] = $result_obj->MOD_DTM;
					$temp_array['CREATE_DTM'] = $result_obj->CREATE_DTM;
					$temp_array['NAME'] = $result_obj->NAME;
					$temp_array['IMG'] = $result_obj->IMG;
					
					$temp_array['following'] = User::getIsUserFollowing($con, $loggedInUserId, $result_obj->USER_ID);
					$temp_array['followed'] = User::getIsUserFollowing($con, $result_obj->USER_ID, $loggedInUserId);
					
					array_push($result_array, $temp_array); 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function isUserLiked($con, $user_id, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
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
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getUserLikeCount($con, $user_id, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."user id");
				return;
			}

			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
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
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getUsersRecipesLikesCount($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."user id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS LIKES_COUNT 
							FROM `LIKES` 
							WHERE TYPE = 'RECIPE' 
							AND USER_ID = '".$user_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->LIKES_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getLikeCount($con, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
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
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function submitLike($user_id, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."user id");
				return;
			}

			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."type id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//transaction begin
				DatabaseUtil::beginTransaction($con);

				//check if $user_id has already liked $type & $type_id
				$query = "SELECT LIKE_ID, IS_DEL FROM LIKES WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";
				$result = mysqli_query($con, $query);

				//if there is already an entry in LIKES table
				if($result_data = $result->fetch_object()){
					$like_id = $result_data->LIKE_ID;
					
					//if the user has unliked it, like it
					$is_add = false;
					if('Y' == $result_data->IS_DEL){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has not liked the type(".$type.") with type id(".$type_id."). liking it.");

						$query = "UPDATE LIKES SET IS_DEL = 'N', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");
							$is_add = true;
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
							$is_add = false;
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
						$is_add = true;
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
					} 
				}
				//if there is no entry in LIKES table
				//check if $user_id has already liked $type & $type_id
				
				//register timeline
				if("COMMENT" == $type){
					$query = "SELECT USER_ID FROM `COMMENTS` WHERE COM_ID = '$type_id'";
					
					if($is_add){
						$timeline_type = LIKE_COMMENT_ADD;
					}
					else{
						$timeline_type = LIKE_COMMENT_REMOVE;
					}
				}
				else if("RECIPE" == $type){
					$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$type_id'";
					
					if($is_add){
						$timeline_type = LIKE_RECIPE_ADD;
					}
					else{
						$timeline_type = LIKE_RECIPE_REMOVE;
					}
				}
				else if("RECIPE_IMG" == $type){
					$query = "SELECT DISTINCT USER_ID FROM `RECIPE_IMG` AS RCP_IMG
								INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = RCP_IMG.RCP_ID 
								WHERE RCP_IMG_ID = '$type_id'";
					
					if($is_add){
						$timeline_type = LIKE_RECIPE_IMG_ADD;
					}
					else{
						$timeline_type = LIKE_RECIPE_IMG_REMOVE;
					}
				}
				else if("REVIEW" == $type){
					$query = "SELECT USER_ID FROM `REVIEWS` WHERE REV_ID = '$type_id'";
					if($is_add){
						$timeline_type = LIKE_REVIEW_ADD;
					}
					else{
						$timeline_type = LIKE_REVIEW_REMOVE;
					}
				}
				else if("USER" == $type){
					$ref_user_id = $type_id;
					
					if($is_add){
						$timeline_type = LIKE_USER_ADD;
					}
					else{
						$timeline_type = LIKE_USER_REMOVE;
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not understand the like TYPE('".$type."')");
					return;
				}
				
				if("USER" != $type){
					$result_temp = mysqli_query($con, $query);
					if($result_temp_data = $result_temp->fetch_object()){  
						$ref_user_id = $result_temp_data->USER_ID;
					}
				}

				if(!Util::check_for_null($ref_user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", NULL_OR_EMPTY."ref_user_id");
					return;
				}

				Timeline::addTimeline($con, $user_id, $ref_user_id, $timeline_type, $like_id, DEFAULT_SCOPE_ID);
				//register timeline

				$result_array['TYPE_ID'] = $type_id;
				$result_array['TYPE'] = $type;
				
				//check the status (liked/unliked)
				$result_array['isUserLiked'] = self::isUserLiked($con, $user_id, $type, $type_id);
				
				//get total likes for the $type & $type_id
				$result_array['likesCount'] = self::getLikeCount($con, $type, $type_id);

				//transaction end
				DatabaseUtil::endTransaction($con);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Something went wrong !");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
				
				//response
				echo json_encode($result_array);
				//response
			}
		}
	}
?>