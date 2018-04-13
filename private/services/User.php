<?php
	class User{
		public static function searchUsers($search_query, $logged_in_user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($search_query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."search_query");
					return;
			}
			
			if(!Util::check_for_null($logged_in_user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."logged_in_user_id");
					return;
			}
			
			if(!Util::check_for_null($index)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
					return;
			}
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USR.USER_ID, USR.IMG, USR.NAME, USR.EMAIL, SCP.SCOPE_NAME AS EMAIL_SCOPE_NAME
							FROM `USER` AS USR
							INNER JOIN `SCOPE` AS SCP ON SCP.SCOPE_Id = USR.EMAIL_SCOPE_ID
							WHERE USR.NAME LIKE '%".$search_query."%'
							OR (USR.EMAIL LIKE '%".$search_query."%' AND SCOPE_NAME = 'PUBLIC')
							OR (USR.EMAIL LIKE '%".$search_query."%' AND SCOPE_NAME = 'FOLLOWERS' 
							AND (SELECT COUNT(*) 
							FROM `USER_RELATIONSHIP` 
							WHERE FLWR_USER_ID = '".$logged_in_user_id."' 
							AND FLWS_USER_ID = USR.USER_ID 
							AND IS_DEL = 'N') = 1)
							LIMIT ".$index." , ".USERS_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					$temp_array['EMAIL'] = $result_data->EMAIL;
					
					//check if the logged in user is following $result_data->USER_ID
					$temp_array['following'] = self::getIsUserFollowing($con, $logged_in_user_id, $result_data->USER_ID);
					
					array_push($result_array, $temp_array);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUserFollowers($user_id, $logged_in_user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
					return;
			}
			
			if(!Util::check_for_null($logged_in_user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."logged_in_user_id");
					return;
			}
			
			if(!Util::check_for_null($index)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
					return;
			}
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USR.USER_ID, USR.IMG, USR.NAME, USR_RLT.CREATE_DTM, USR_RLT.MOD_DTM
							FROM `USER` AS USR
							INNER JOIN `USER_RELATIONSHIP` USR_RLT ON USR.USER_ID = USR_RLT.FLWR_USER_ID
							WHERE USR_RLT.FLWS_USER_ID = '".$user_id."'
							AND USR_RLT.IS_DEL = 'N'
							LIMIT ".$index." , ".USERS_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					//check if the logged in user is following $result_data->USER_ID
					$temp_array['following'] = self::getIsUserFollowing($con, $logged_in_user_id, $result_data->USER_ID);
					$temp_array['followed'] = self::getIsUserFollowing($con, $result_data->USER_ID, $logged_in_user_id);
					
					array_push($result_array, $temp_array);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUserFollowings($user_id, $logged_in_user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
					return;
			}
			
			if(!Util::check_for_null($logged_in_user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."logged_in_user_id");
					return;
			}
			
			if(!Util::check_for_null($index)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
					return;
			}
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USR.USER_ID, USR.IMG, USR.NAME, USR_RLT.CREATE_DTM, USR_RLT.MOD_DTM
							FROM `USER` AS USR
							INNER JOIN `USER_RELATIONSHIP` USR_RLT ON USR.USER_ID = USR_RLT.FLWS_USER_ID
							WHERE USR_RLT.FLWR_USER_ID = '".$user_id."'
							AND USR_RLT.IS_DEL = 'N'
							LIMIT ".$index." , ".USERS_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$temp_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					//check if the logged in user is following $result_data->USER_ID
					$temp_array['following'] = self::getIsUserFollowing($con, $logged_in_user_id, $result_data->USER_ID);
					$temp_array['followed'] = self::getIsUserFollowing($con, $result_data->USER_ID, $logged_in_user_id);
					
					array_push($result_array, $temp_array);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUser($user_id, $flwr_user_id, $forWhom){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
					return;
			}
			
			if(!Util::check_for_null($forWhom)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."forWhom");
					return;
			}
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USER_ID, USR.RANK_ID, RANK_NAME, EMAIL_SCOPE_ID, EMAIL, MOBILE_SCOPE_ID, MOBILE, 
							IMG, NAME, GENDER_SCOPE_ID, GENDER, USR.CREATE_DTM 
							FROM `USER` AS USR
							INNER JOIN `RANK` AS RNK ON RNK.RANK_ID = USR.RANK_ID
							WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()) {
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					$temp_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					
					$temp_array['EMAIL_SCOPE_ID'] = $result_data->EMAIL_SCOPE_ID;
					$temp_array['MOBILE_SCOPE_ID'] = $result_data->MOBILE_SCOPE_ID;
					$temp_array['GENDER_SCOPE_ID'] = $result_data->GENDER_SCOPE_ID;
					
					$temp_array['emailScopeName'] = User::getScopeName($con, $result_data->EMAIL_SCOPE_ID);
					$temp_array['genderScopeName'] = User::getScopeName($con, $result_data->MOBILE_SCOPE_ID);
					$temp_array['mobileScopeName'] = User::getScopeName($con, $result_data->GENDER_SCOPE_ID);
					
					$temp_array['currentRank'] = $result_data->RANK_NAME;
					
					//get followers count
					$temp_array['followersCount'] = self::getFollowersCount($con, $user_id);
					//get followers count
					
					//get following count
					$temp_array['followingCount'] = self::getFollowingCount($con, $user_id);
					//get following count
					
					//likes count
					$temp_array['likesCount'] = Like::getLikeCount($con, "USER", $user_id);
					
					//email, phone & gender must be only fetched if the user has permitted it to be shown to public 
					if(USER_FETCH_PUBLIC == $forWhom){
						if('1' == $result_data->EMAIL_SCOPE_ID){
							$temp_array['EMAIL'] = $result_data->EMAIL;
						}

						if('1' == $result_data->MOBILE_SCOPE_ID){
							$temp_array['MOBILE'] = $result_data->MOBILE;
						}

						if('1' == $result_data->GENDER_SCOPE_ID){
							$temp_array['GENDER'] = $result_data->GENDER;
						}
						
						//fetch no. of recipes posted by the user
						$temp_array['recipesCount'] = Recipe::getRecipesCount($con, $user_id);
						
						//check if logged in user is following the user
						if(!Util::check_for_null($flwr_user_id)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."flwr_user_id");
							return;
						}
						
						$temp_array['following'] = self::getIsUserFollowing($con, $flwr_user_id, $user_id);
						//check if logged in user is following the user
						
						//if the user has liked recipe
						$temp_array['userLiked'] = Like::isUserLiked($con, $flwr_user_id, "USER", $user_id);
					}
					else if(USER_FETCH_SELF == $forWhom){
						$temp_array['EMAIL'] = $result_data->EMAIL;
						$temp_array['MOBILE'] = $result_data->MOBILE;
						$temp_array['GENDER'] = $result_data->GENDER;
						
						//fetch current achieved rank & milestone
						$temp_array['currentRankAndMilestone'] = Milestone::getRankAndMilestone($con, $result_data->RANK_ID, $user_id);	
						//fetch current achieved rank & milestone
						
						//fetch next rank & milestone
						$temp_array['nextRankAndMilestone'] = Milestone::getRankAndMilestone($con, $result_data->RANK_ID+1, null);	
						//fetch next rank & milestone
						
						//if the user has liked recipe
						$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, "USER", $user_id);
					}
					
					array_push($result_array, $temp_array);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getScopeName($con, $scope_id){
			//check for null/empty
			if(!Util::check_for_null($scope_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."scope_id");
				return;
			}
			//check for null/empty
			
			try{
				//fetch scope name
				$query = "SELECT SCOPE_NAME FROM `SCOPE` WHERE SCOPE_ID = '".$scope_id."'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
						return $result_data->SCOPE_NAME;
				}
				//fetch scope name
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getIsUserFollowing($con, $flwr_user_id, $flws_user_id){
			//check for null/empty
			if(!Util::check_for_null($flwr_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."flwr_user_id");
				return;
			}
			
			if(!Util::check_for_null($flws_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."flws_user_id");
				return;
			}
			//check for null/empty
			
			try{
				$query = "SELECT COUNT(*) AS COUNT 
							FROM `USER_RELATIONSHIP` 
							WHERE FLWR_USER_ID = '$flwr_user_id'
							AND FLWS_USER_ID = '$flws_user_id'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->COUNT > 0; 
				}
				
				return false;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function updateUserImage($user_id, $image){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(count($image) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."image");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
				//prepare directories
				if(!Util::prepare_directories($user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Cannot submit the profile image as the file directories could not be created for the user($user_id).");  
					return;
				}
				//prepare directories

				//upload image
				$profile_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_PROFILE_DIRECTORY.APP_DATA_PROFILE_IMAGES_DIRECTORY;
				$new_image = $profile_images_dir.uniqid().".jpg";

				if (isset($image['tmp_name'][0])){
					$image = $image['tmp_name'][0];
					
					move_uploaded_file($image, $new_image);
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "User Profile Image(".$new_image.") uploaded");
				}

				//update into USER table
				$query = "UPDATE `USER`
						SET IMG = '".Util::get_relative_path($new_image)."',
						MOD_DTM = CURRENT_TIMESTAMP
						WHERE USER_ID = '".$user_id."'";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Profile Image updated !");
					
					//register timeline
					Timeline::addTimeline($con, $user_id, $user_id, USER_PHOTO_MODIFY, $user_id);
					//register timeline
					
					//update IS_DEL as 'Y' of all the entries in LIKES table whose TYPE is 'USER' & TYPE_ID is $user_id
					$query = "UPDATE `LIKES`
						SET IS_DEL = 'Y',
						MOD_DTM = CURRENT_TIMESTAMP
						WHERE TYPE = 'USER'
						AND TYPE_ID = '".$user_id."'";
					
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Removed all the likes for USER(".$user_id.") in LIKES table");
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to remove all the likes for USER(".$user_id.") in LIKES table");
						
						throw new Exception("Failed to remove all the likes");
					}
					
					return "{'err_code':0,'isError':false,'err_message':'Your profile photo has been updated !'}";
				}
				else{
					return "{'err_code':1,'isError':true,'err_message':'Could not update your profile photo !'}";
					throw new Exception("Failed to update profile photo");
				}
				//update into USER table
				
				//transaction end
				DatabaseUtil::endTransaction($con);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Something went wrong !");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				return "{'err_code':1,'isError':true,'err_message':'Could not update your profile photo !'}";
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserGender($user_id, $gender, $gender_scope_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($gender)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."gender");
				return;
			}
			
			if(!Util::check_for_null($gender_scope_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."gender_scope_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//get old gender
				$query = "SELECT GENDER FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);
				
				if($result_obj = $result->fetch_object()){
					$old_gender = $result_obj->GENDER;
				}
				//get old gender
				
				//if old and new gender are not same
				if($old_gender != $gender){
					$query = "UPDATE `USER`
							SET GENDER = '".$gender."',
							GENDER_SCOPE_ID = '".$gender_scope_id."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Gender & scope updated !");
						return "{'err_code':0,'isError':false,'err_message':'Your gender & its privacy has been updated !'}";
					}
					else{
						return "{'err_code':1,'isError':true,'err_message':'Could not update your gender !'}";
					}
				}
				//if old and new gender are same
				else{
					$query = "UPDATE `USER`
							SET GENDER_SCOPE_ID = '".$gender_scope_id."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Gender scope updated !");
						return "{'err_code':0,'isError':false,'err_message':'Your gender privacy has been updated !'}";
					}
					else{
						return "{'err_code':1,'isError':true,'err_message':'Could not update your gender privacy !'}";
					}
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserPhone($user_id, $mobile, $mobile_scope_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($mobile)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."mobile");
				return;
			}
			
			if(!Util::check_for_null($mobile_scope_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."mobile_scope_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//get old phone
				$query = "SELECT MOBILE FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);
				
				if($result_obj = $result->fetch_object()){
					$old_mobile = $result_obj->MOBILE;
				}
				//get old phone
				
				//if old mobile and new mobile are not same
				if($old_mobile != $mobile){
					$query = "UPDATE `USER`
							SET MOBILE = '".$mobile."',
							MOBILE_SCOPE_ID = '".$mobile_scope_id."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Phone Number updated !");

						//TODO: mechanism to store OTP, OTP_DTM in database and send the same OTP for verifying the phone number to the new phone number.
						//this must be done only if the user has modified the phone number which can be verified by comparing before and after the mobile number update

						return "{'err_code':0,'isError':false,'err_message':'Your phone number & its privacy has been updated !'}";
					}
					else{
						return "{'err_code':1,'isError':true,'err_message':'Could not update your phone number !'}";
					}
				}
				//if old and new mobile are not same
				else{
					$query = "UPDATE `USER`
							SET MOBILE_SCOPE_ID = '".$mobile_scope_id."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Phone Number scope updated !");
							return "{'err_code':0,'isError':false,'err_message':'Your phone number privacy has been updated !'}";
						}
						else{
							return "{'err_code':1,'isError':true,'err_message':'Could not update your phone number privacy !'}";
						}
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserPassword($user_id, $password, $new_password){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($password)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."password");
				return;
			}
			
			if(!Util::check_for_null($new_password)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."new password");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "SELECT PASSWORD, SALT FROM `USER` WHERE USER_ID = '$user_id'";
				$result = mysqli_query($con, $query);
				
				if($result_obj = $result->fetch_object()){
					$salt = $result_obj->SALT;
					$salt = base64_decode($salt);
					$password = $password.$salt;
					$password = base64_encode($password);
					
					if($result_obj->PASSWORD == $password){
						$salt = Util::generateSalt(); 

						$new_password = $new_password.$salt;
						$new_password = base64_encode($new_password);

						$salt = base64_encode($salt);
						
						$query = "UPDATE `USER`
							SET PASSWORD = '".DatabaseUtil::cleanUpString($con, $new_password)."',
							SALT = '".$salt."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
						
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Password updated !");
							return "{'err_code':0,'isError':false,'err_message':'Your password has been updated !'}";
						}
						else{
							return "{'err_code':1,'isError':true,'err_message':'Could not update your password !'}";
						}
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Incorrect password");
						return "{'err_code':1,'isError':true,'err_message':'Your current password is wrong !'}";
					}
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserName($user_id, $name){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($name)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."name");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "UPDATE `USER`
							SET NAME = '".DatabaseUtil::cleanUpString($con, $name)."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Name updated !");
					return "{'err_code':0,'isError':false,'err_message':'Your name has been updated !'}";
				}
				else{
					return "{'err_code':1,'isError':true,'err_message':'Could not update your name'}";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserEmail($user_id, $email, $email_scope_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($email)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email");
				return;
			}
			
			if(!Util::check_for_null($email_scope_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email_scope_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//get old email
				$query = "SELECT EMAIL FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);
				
				if($result_obj = $result->fetch_object()){
					$old_email = $result_obj->EMAIL;
				}
				//get old email
				
				//if the email was changed
				if($old_email != $email){
					//update with new veri code
					$veri_code = Util::generateRandomNumber(8);
					$query = "UPDATE `USER`
								SET EMAIL = '".DatabaseUtil::cleanUpString($con, $email)."',
								EMAIL_SCOPE_ID = '".$email_scope_id."',
								VERI_CODE = '".$veri_code."',
								VERI_CODE_DTM = CURRENT_TIMESTAMP,
								MOD_DTM = CURRENT_TIMESTAMP
								WHERE USER_ID = '".$user_id."'";

					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Email updated !");

						//TODO: verification email with veri_code has to be sent here only if the email has been changed(check the email before and after the update)

						return "{'err_code':0,'isError':false,'err_message':'Your email & its privacy has been updated !'}";
					}
					else{
						return "{'err_code':1,'isError':true,'err_message':'Could not update your email'}";
					}
					//update with new veri code
				}
				//if email is not changed but scope of email is changed
				else{
					$query = "UPDATE `USER`
								SET EMAIL_SCOPE_ID = '".$email_scope_id."',
								MOD_DTM = CURRENT_TIMESTAMP
								WHERE USER_ID = '".$user_id."'";

					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Email scope updated !");
						return "{'err_code':0,'isError':false,'err_message':'Your email privacy has been updated !'}";
					}
					else{
						return "{'err_code':1,'isError':true,'err_message':'Could not update your email privacy !'}";
					}
					//update with new veri code
				}
				
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function verifyEmail($email, $veri_code){
			//check for null/empty
			if(!Util::check_for_null($email)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email");
				return;
			}
			
			if(!Util::check_for_null($veri_code)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."veri_code");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//check if the veri code is expired or vericode & email are valid
				$query = "SELECT 
							TIMESTAMPDIFF(DAY, VERI_CODE_DTM, CURRENT_TIMESTAMP) AS DAYS,
							USER_ID
							FROM `USER`
							WHERE EMAIL = '".$email."' 
							AND VERI_CODE = '".$veri_code."'";
				$result = mysqli_query($con, $query);
				
				if($result_obj = $result->fetch_object()){
					if($result_obj->DAYS > 0){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Veri code has expired (".$result_obj->DAYS." days)");
						return VERIFY_EMAIL_VERICODE_EXPIRED;
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Veri code(".$veri_code.") & email(".$email.") are valid");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Veri code has not expired (".$result_obj->DAYS." days)");
						$user_id = $result_obj->USER_ID;
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Veri code(".$veri_code.") & email(".$email.") are not valid");
					return VERIFY_EMAIL_INVALID_URL;
				}
				//check if the veri code is expired or vericode & email are valid
				
				//update VERI_CODE & VERI_CODE_DTM
				$query = "UPDATE `USER` 
							SET VERI_CODE = '0' 
							AND VERI_CODE_DTM = CURRENT_TIMESTAMP
							AND MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Email verification completed !");
					return VERIFY_EMAIL_VERIFIED;
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Email verification failed !");
					return VERIFY_EMAIL_NOT_VERIFIED;
				}
				//update VERI_CODE & VERI_CODE_DTM
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		
		public static function submitFollowUser($flwr_user_id, $flws_user_id){
			//check for null/empty
			if(!Util::check_for_null($flwr_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."flwr_user_id");
				return;
			}

			if(!Util::check_for_null($flws_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."flws_user_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
				$result_array = array();
				
				//check if the $flwr_user_id follows/followed $flws_user_id
				$query = "SELECT IS_DEL, RLT_ID 
							FROM `USER_RELATIONSHIP` 
							WHERE FLWR_USER_ID = '".$flwr_user_id."' 
							AND FLWS_USER_ID = '".$flws_user_id."'";
				
				$result = mysqli_query($con, $query);
				//check if the $flwr_user_id follows/followed $flws_user_id
				
				//if the $flwr_user_id follows/followed $flws_user_id
				if($result_data = $result->fetch_object()){
					$flag = 'N';
					if('N' == $result_data->IS_DEL){
						$flag = 'Y';
					}
					
					$query = "UPDATE `USER_RELATIONSHIP`
								SET IS_DEL = '".$flag."', 
								MOD_DTM = CURRENT_TIMESTAMP
								WHERE FLWR_USER_ID = '".$flwr_user_id."' 
								AND FLWS_USER_ID = '".$flws_user_id."'";
					
					if(mysqli_query($con, $query)){
						$result_array['following'] = $flag == 'N';
						
						//register timeline
						if($result_array['following']){
							Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_FOLLOW, $result_data->RLT_ID);
						}
						else{
							Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_UNFOLLOW, $result_data->RLT_ID);
						}
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! user(".$flwr_user_id.") could not follow/unfollow the user(".$flws_user_id.")");
						$result_array['following'] = false;
						throw new Exception("Failed to follow the user");
					}
				}
				//if the $flwr_user_id follows/followed $flws_user_id
				
				//if the $flwr_user_id has never followed $flws_user_id
				else{
					$query = "INSERT INTO `USER_RELATIONSHIP` (`FLWR_USER_ID`, `FLWS_USER_ID`, `CREATE_DTM`) 
								VALUES ('$flwr_user_id', '$flws_user_id', CURRENT_TIMESTAMP)";
					
					$result_array['following'] = mysqli_query($con, $query);
					$rlt_id = mysqli_insert_id($con);
					
					//register timeline
					Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_FOLLOW, $rlt_id);
					//register timeline
				}
				//if the $flwr_user_id has never followed $flws_user_id
				
				//get the followers count
				$result_array['followersCount'] = self::getFollowersCount($con, $flws_user_id);
				//get the followers count
				
				$temp_array = array();
				array_push($temp_array, $result_array);
			
				//transaction end
				DatabaseUtil::endTransaction($con);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Something went wrong !");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
				
				//response
				return json_encode($temp_array);
			}
		}
		
		public static function getFollowersCount($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS FOLLOWERS_COUNT
							FROM `USER_RELATIONSHIP` 
							WHERE FLWS_USER_ID = '".$user_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->FOLLOWERS_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getFollowingCount($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS FOLLOWING_COUNT
							FROM `USER_RELATIONSHIP` 
							WHERE FLWR_USER_ID = '".$user_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->FOLLOWING_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function login($email, $password){
			//check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email");
                return;
            }

            if(!Util::check_for_null($password)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."password");
                return;
            }
            //check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USER_ID, EMAIL, NAME, PASSWORD, SALT FROM USER WHERE EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				$result_array = array();
				if($result_obj = $result->fetch_object()){
					$salt = $result_obj->SALT;
					$salt = base64_decode($salt);
					$password = $password.$salt;
					$password = base64_encode($password);
					
					if($result_obj->EMAIL == $email && $result_obj->PASSWORD == $password){
						$temp["USER_ID"] = $result_obj->USER_ID;
						$temp["EMAIL"] = $result_obj->EMAIL;
						$temp["NAME"] = $result_obj->NAME;
						
						array_push($result_array, $temp);
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "User Login Failed with email id as: ".$email);
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "User Login Failed with email id as: ".$email);
				}
				
				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function userRegisterCheck($email){
			//check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email");
                return;
            }
			//check for null/empty
				try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USER_ID,EMAIL FROM `USER` WHERE EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				$result_array = array();
				if($result_data = $result->fetch_object()){
					if($result_data->EMAIL == $email){
						$data['USER_ID']= $result_data->USER_ID;
						array_push($result_array, $data);
					}
				}
					else{
						$data['EMAIL']= $email;
						array_push($result_array, $data);
					}
					return json_encode($result_array);
				}
				catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		
		}
		
		public static function register($email, $password, $name){
			//check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."email");
                return;
            }

            if(!Util::check_for_null($name)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."name");
                return;
            }
			
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
				$query = "SELECT USER_ID,EMAIL FROM `USER` WHERE EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					if($result_data->EMAIL == $email){
						$data['err_code']= 0;
						$data['isError']= true;
						$data['user_id']= $result_data->USER_ID;
						$data['err_message']="Email id already exist";
					}
				}
				else{
					$ssid = Util::generateRandomString(); 		//TODO: this must be php session id and not a random string
					$salt = Util::generateSalt(); 

					if($password == "DEFAULT_SOCIAL_PASSWORD"){
						$password = "cookery";
					}
					$password = $password.$salt;
					$password = base64_encode($password);

					$salt = base64_encode($salt);
					
					$vericode = Util::generateRandomNumber(8);
					$query = "INSERT INTO `USER` 
								(EMAIL, VERI_CODE, VERI_CODE_DTM, PASSWORD, NAME, SSID, SALT, CREATE_DTM) 
								values('".DatabaseUtil::cleanUpString($con, $email)."', '$vericode', CURRENT_TIMESTAMP, 
								'".DatabaseUtil::cleanUpString($con, $password)."', '".DatabaseUtil::cleanUpString($con, $name)."', 
								'$ssid', '$salt', CURRENT_TIMESTAMP)";
					
					if(mysqli_query($con, $query)){
						$user_id = mysqli_insert_id($con);
						
						$data['err_code']= 1;
						$data['isError']= false;
						$data['user_id']= $user_id;
						$data['err_message']="User Registered Successfully";
						
						//register timeline
						Timeline::addTimeline($con, $user_id, $user_id, USER_ADD, $user_id);
						//register timeline
						
						//email
						MailUtil::userEmail(USER_REGISTER, $email, "There", "Welcome Aboard");
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed to register the user with email : ".$email);
						throw new Exception("Failed to register the user");
					}
				}
				
				//transaction end
				DatabaseUtil::endTransaction($con);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Something went wrong !");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
				
				return json_encode($data);
			}
		}
		
		public static function getUsername($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT NAME FROM 	`USER` WHERE USER_ID = '".$user_id."'";
				
				$result = mysqli_query($con, $query);
				if($result_data = $result->fetch_object()){
					return $result_data->NAME;
				}
				else{
					return "USER";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getEmail($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT EMAIL FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					return $result_data->EMAIL;
				}
				else{
					return "";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
	}
?>