<?php
	include_once("../util/ImportUtil.php");

	class Like{
		public static function submitLike($user_id, $type, $type_id){
			//request
			logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			logger(__CLASS__, "I", "REQUEST PARAM : type(".$type.")");
			logger(__CLASS__, "I", "REQUEST PARAM : type_id(".$type_id.")");
			//request

			//check for null/empty
			if(!check_for_null($user_id)){
				logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}

			if(!check_for_null($type)){
				logger(__CLASS__, "E", "Error ! null/empty type");
				return;
			}

			if(!check_for_null($type_id)){
				logger(__CLASS__, "E", "Error ! null/empty type id");
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
						logger(__CLASS__, "I", "The user(".$user_id.") has not liked the type(".$type.") with type id(".$type_id."). liking it.");

						$query = "UPDATE LIKES SET IS_DEL = 'N', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

						if(mysqli_query($con, $query)){
							logger(__CLASS__, "I", "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");

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
								logger(__CLASS__, "E", "Could not understand the like TYPE('".$type."')");
							}

							$result_temp = mysqli_query($con, $query);
							if($result_temp_data = $result_temp->fetch_object()){  
								register_timeline($con, $user_id, $result_temp_data->USER_ID, $timeline_type, $result_data->LIKE_ID);
							}
							//get user_id of the type
							//register timeline

						}
						else{
							logger(__CLASS__, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
						}
					}
					//if the user has unliked it, like it
					//if the user has liked it, unlike it
					else{
						infologger(__CLASS__, "I", "The user(".$user_id.") has already liked the type(".$type.") with type id(".$type_id."). unliking it.");

						$query = "UPDATE LIKES SET IS_DEL = 'Y', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

						if(mysqli_query($con, $query)){
							logger(__CLASS__, "I", "The user(".$user_id.") has unliked the type(".$type.") with type id(".$type_id.") successfully.");

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
								logger(__CLASS__, "E", "Could not understand the like TYPE('".$type."')");
							}

							$result_temp = mysqli_query($con, $query);
							if($result_temp_data = $result_temp->fetch_object()){  
								register_timeline($con, $user_id, $result_temp_data->USER_ID, $timeline_type, $result_data->LIKE_ID);
							}
							//get user_id of the type
							//register timeline
						}
						else{
							logger(__CLASS__, "E", "Failed !! The user(".$user_id.") could not unlike the type(".$type.") with type id(".$type_id.") successfully.");
						}
					}
					//if the user has liked it, unlike it
				}
				//if there is already an entry in LIKES table
				//if there is no entry in LIKES table
				else{
					logger(__CLASS__, "I", "The user(".$user_id.") has not yet liked the type(".$type.") with type id(".$type_id."). So liking it");

					$query = "INSERT INTO `LIKES` (`USER_ID`, `TYPE`, `TYPE_ID` , `CREATE_DTM`) VALUES ('$user_id', '$type', '$type_id',  CURRENT_TIMESTAMP)";

					if(mysqli_query($con, $query)){
						$like_id = mysqli_insert_id($con);

						logger(__CLASS__, "I" , "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");

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
							logger(__CLASS__, "E", "Could not understand the like TYPE('".$type."')");
						}

						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							register_timeline($con, $user_id, $result_data->USER_ID, $timeline_type, $like_id);
						}
						//get user_id of the type
						//register timeline
					}
					else{
						logger(__CLASS__, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
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

					logger(__CLASS__, "I" , "The user(".$user_id.") for the type(".$type.") with type id(".$type_id.") has liked ? ".$result_array['isLiked']);
				}
				//check the status (liked/unliked)

				//get total likes for the $type & $type_id
				$query = "SELECT COUNT(*) AS LIKES_COUNT FROM LIKES WHERE TYPE = '$type' AND TYPE_ID = '$type_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					$result_array['likes'] = $result_data->LIKES_COUNT;

					logger(__CLASS__, "I" , "The type(".$type.") with type id(".$type_id.") has been liked ".$result_array['likes']." times");
				}
				//get total likes for the $type & $type_id

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>