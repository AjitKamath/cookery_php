<?php
	class Comment{
		public static function getCommentsCount($con, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type");
				return;
			}
			
			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS COMMENTS_COUNT 
							FROM `COMMENTS` 
							WHERE TYPE = '".$type."'
							AND TYPE_ID = '".$type_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->COMMENTS_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function deleteComment($com_id, $user_id){
			//check for null/empty
            if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
                return;
            }

            if(!Util::check_for_null($com_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."com id");
                return;
            }
            //check for null/empty

			$response = array();
            try{
                $con = DatabaseUtil::getInstance()->open_connection();

				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
				//get comment type
				$query = "SELECT TYPE FROM `COMMENTS` WHERE COM_ID = '".$com_id."'";
				$result = mysqli_query($con ,$query);

				$timeline_type = "";
				if($result_data = $result->fetch_object()){
					$type = $result_data->TYPE;
					
					if("RECIPE" == $type){
						$timeline_type = COMMENT_RECIPE_REMOVE;
					}
					else if("RECIPE_IMG" == $type){
						$timeline_type = COMMENT_RECIPE_IMG_REMOVE;
					}
					else if("USER" == $type){
						$timeline_type = COMMENT_USER_REMOVE;
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR , "Could not identify the comment type : ".$type);
					}
				}
				
                //delete comment
                $query = "UPDATE `COMMENTS` SET IS_DEL = 'Y' WHERE COM_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

                if(mysqli_query($con,  $query)){
                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO , "Comment('$com_id') successfully deleted by the user('$user_id')");
                    
					$result_arr["err_code"] = "0";
					$result_arr["isError"] = false;
					$result_arr["err_message"] = "Comment deleted !";
				
					//register timeline
                    Timeline::addTimeline($con, $user_id, $user_id, $timeline_type, $com_id, DEFAULT_SCOPE_ID);
                    //register timeline
                }
                else{
					$result_arr["err_code"] = "1";
					$result_arr["isError"] = true;
					$result_arr["err_message"] = "Comment delete failed !";
					
                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed !! Comment('$com_id') could not be deleted by the user('$user_id')");
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
					
					throw new Exception("Failed to update COMMENTS table");
                } 
				//delete comment
				
				$response = $result_arr;
				
				//transaction end
				DatabaseUtil::endTransaction($con);
            }
            catch(Exception $e){
				$result_arr["err_code"] = "1";
				$result_arr["isError"] = true;
				$result_arr["err_message"] = "Comment delete failed !";
				
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
				return json_encode($response);
            }
        }
		
		public static function getComments($con, $user_id, $type, $type_id, $index = 0){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
                return;
            }
			
            if(!Util::check_for_null($type)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type");
                return;
            }
			
			if(!Util::check_for_null($type_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type_id");
                return;
            }
			//check for null/empty
			
			try{
                $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, COM_ID, COM.COMMENT, COM.CREATE_DTM, COM.MOD_DTM 
						FROM COMMENTS COM 
                        INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID 
						WHERE COM.TYPE = '".$type."'
						AND TYPE_ID = '$type_id' 
						AND COM.IS_DEL = 'N'
						LIMIT ".$index." , ".COMMENTS_COUNT;
				
                $result = mysqli_query($con ,$query);

                $result_array = array();
                while($result_data = $result->fetch_object()){
					$temp_arr['COM_ID'] = $result_data->COM_ID;
					$temp_arr['USER_ID'] = $result_data->USER_ID;
					$temp_arr['COMMENT'] = $result_data->COMMENT;
					$temp_arr['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_arr['MOD_DTM'] = $result_data->MOD_DTM;
					
					$temp_arr['userName'] = $result_data->NAME;
					$temp_arr['userImage'] = $result_data->IMG;
					
					//likes count
					$temp_arr['likesCount'] = Like::getLikeCount($con, "COMMENT", $result_data->COM_ID);
					//likes count
					
					//if the user has liked comment
					$temp_arr['userLiked'] = Like::isUserLiked($con, $user_id, "COMMENT", $result_data->COM_ID);
					//if the user has liked comment
					
                    array_push($result_array, $temp_arr);
                }

                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Total comments fetched : ".sizeof($result_array));

                //response
                return json_encode($result_array);
                //response
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
            }
		}
		
		public static function getComment($con, $user_id, $com_id){
			//check for null/empty
			if(!Util::check_for_null($com_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."com_id id");
                return;
            }
			//check for null/empty
			
			try{
                $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, COM_ID, COM.COMMENT, COM.CREATE_DTM, COM.MOD_DTM 
						FROM COMMENTS COM 
                        INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID 
						WHERE COM.COM_ID = '".$com_id."'
						AND COM.IS_DEL = 'N'";
				
                $result = mysqli_query($con ,$query);

                $result_array = array();
                if($result_data = $result->fetch_object()){
					$temp_arr['COM_ID'] = $result_data->COM_ID;
					$temp_arr['USER_ID'] = $result_data->USER_ID;
					$temp_arr['COMMENT'] = $result_data->COMMENT;
					$temp_arr['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_arr['MOD_DTM'] = $result_data->MOD_DTM;
					
					$temp_arr['userName'] = $result_data->NAME;
					$temp_arr['userImage'] = $result_data->IMG;
					
					//likes count
					$temp_arr['likesCount'] = Like::getLikeCount($con, "COMMENT", $result_data->COM_ID);
					//likes count
					
					//if the user has liked comment
					$temp_arr['userLiked'] = Like::isUserLiked($con, $user_id, "COMMENT", $result_data->COM_ID);
					//if the user has liked comment
					
                    array_push($result_array, $temp_arr);
                }

                //response
                return $result_array;
                //response
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
            }
		}
        
        public static function fetchComments($user_id, $type, $type_id, $index = 0){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
                return;
            }
			
            if(!Util::check_for_null($type)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type");
                return;
            }
			
			if(!Util::check_for_null($type_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type_id");
                return;
            }
			
			if(!Util::check_for_null($index)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
                return;
            }
            //check for null/empty

			$response = array();
            try{
                $con = DatabaseUtil::getInstance()->open_connection();
				$response = self::getComments($con, $user_id, $type, $type_id, $index);
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
				return json_encode($response);
            }
        }
		
		public static function submitComment($user_id, $type, $type_id, $comment){
			//check for null/empty
            if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
                return;
            }
			
			if(!Util::check_for_null($type)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type");
                return;
            }

            if(!Util::check_for_null($type_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."type id");
                return;
            }

            if(!Util::check_for_null($comment)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."comment");
                return;
            }
            //check for null/empty

			$response = array();
            try{
                $con = DatabaseUtil::getInstance()->open_connection();

				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
                //insert comment
                $query = "INSERT INTO `COMMENTS`(`TYPE`, `TYPE_ID`, `USER_ID`, `COMMENT`, `CREATE_DTM`) 
				VALUES('$type', '$type_id', '$user_id', '".DatabaseUtil::cleanUpString($con, $comment)."', CURRENT_TIMESTAMP)";

                if(mysqli_query($con, $query)){
                    $com_id = mysqli_insert_id($con);

                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO , "Comment('$comment') successfully submitted by the user('$user_id') for the type('$type')");

                    //register timeline
					$query = "";
					$timeline_type = "";
					if('RECIPE' == $type){
						$query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$type_id'";
						$timeline_type = COMMENT_RECIPE_ADD;
						
					}
					else if('RECIPE_IMG' == $type){
						$query = "SELECT DISTINCT USER_ID FROM `RECIPE_IMG` AS RCP_IMG
									INNER JOIN `RECIPE`AS RCP ON RCP.RCP_ID = RCP_IMG.RCP_ID
									WHERE RCP_IMG_ID = '$type_id'";
						$timeline_type = COMMENT_RECIPE_IMG_ADD;
					}
					else if('USER' == $type){
						$timeline_type = COMMENT_RECIPE_ADD;
						$ref_user_id = $type_id;
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR , "Could not identify the type : "+$type);
					}
					
					if("USER" != $type){
						$result = mysqli_query($con, $query);
						if($result_data = $result->fetch_object()){  
							$ref_user_id = $result_data->USER_ID;
						}
					}
					
					if(!Util::check_for_null($ref_user_id)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."ref_user_id");
						throw new Exception("Failed to submit comment");
					}
					
					Timeline::addTimeline($con, $user_id, $ref_user_id, $timeline_type, $com_id, DEFAULT_SCOPE_ID);
					//register timeline
					
					//get latest comments
					$response = self::getComment($con, $user_id, $com_id);
					
					//transaction end
					DatabaseUtil::endTransaction($con);
                }
                else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed !! Comment('$comment') could not be submitted by the user('$user_id') for the type('$type')");
					throw new Exception("Failed to submit comment");
                } 
				//insert comment
            }
            catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
                
				//roll back
				DatabaseUtil::rollbackTransaction($con);
            }
            finally{
				DatabaseUtil::getInstance()->close_connection($con);
				return json_encode($response);
            }
        }
    }
?>