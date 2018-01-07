<?php
	class User{
		public static function updateUserImage($user_id, $image){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			
			for ($i = 0; $i < count($image['tmp_name']); $i++) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : image[".$i."](".$image['tmp_name'][$i].")");
			} 
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(count($image) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty image");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//prepare directories
				if(!Util::prepare_directories($user_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Cannot submit the profile image as the file directories could not be created for the user($user_id).");  
					return;
				}
				//prepare directories

				//upload image
				$profile_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_PROFILE_DIRECTORY.APP_DATA_PROFILE_IMAGES_DIRECTORY;
				$new_image = $profile_images_dir.uniqid().".jpg";

				if (isset($image['tmp_name'][0])){
					$image = $image['tmp_name'][0];
					
					move_uploaded_file($image, $new_image);
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User Profile Image(".$new_image.") uploaded");
				}

				//update into USER table
				$query = "UPDATE `USER`
						SET IMG = '".Util::get_relative_path($new_image)."',
						MOD_DTM = CURRENT_TIMESTAMP
						WHERE USER_ID = '".$user_id."'";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Profile Image updated !");
					echo "{'err_code':0,'isError':false,'err_message':'Your profile photo has been updated !'}";
				}
				else{
					echo "{'err_code':1,'isError':true,'err_message':'Could not update your profile photo !'}";
				}
				//update into USER table
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserGender($user_id, $gender){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : gender(".$gender.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($gender)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty gender");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "UPDATE `USER`
							SET GENDER = '".$gender."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Gender updated !");
					echo "{'err_code':0,'isError':false,'err_message':'Your gender has been updated !'}";
				}
				else{
					echo "{'err_code':1,'isError':true,'err_message':'Could not update your gender !'}";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserPhone($user_id, $mobile){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : mobile(".$mobile.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($mobile)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty mobile");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "UPDATE `USER`
							SET MOBILE = '".$mobile."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Phone Number updated !");
					
					//TODO: mechanism to store OTP, OTP_DTM in database and send the same OTP for verifying the phone number to the new phone number.
					
					echo "{'err_code':0,'isError':false,'err_message':'Your phone number has been updated !'}";
				}
				else{
					echo "{'err_code':1,'isError':true,'err_message':'Could not update your phone number !'}";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserPassword($user_id, $password, $new_password){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : password(".$password.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : new password(".$new_password.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($password)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty password");
				return;
			}
			
			if(!Util::check_for_null($new_password)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty new password");
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
							SET PASSWORD = '".$new_password."',
							SALT = '".$salt."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
						
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Password updated !");
							echo "{'err_code':0,'isError':false,'err_message':'Your password has been updated !'}";
						}
						else{
							echo "{'err_code':1,'isError':true,'err_message':'Could not update your password !'}";
						}
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Incorrect password");
						echo "{'err_code':1,'isError':true,'err_message':'Your current password is wrong !'}";
					}
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserName($user_id, $name){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : name(".$name.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($name)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty name");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "UPDATE `USER`
							SET NAME = '".$name."',
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Name updated !");
					echo "{'err_code':0,'isError':false,'err_message':'Your name has been updated !'}";
				}
				else{
					echo "{'err_code':1,'isError':true,'err_message':'Could not update your name'}";
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserEmail($user_id, $email){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : email(".$email.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			
			if(!Util::check_for_null($email)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//update with new veri code
				$veri_code = Util::generateRandomNumber(8);
				$query = "UPDATE `USER`
							SET EMAIL = '".$email."',
							VERI_CODE = '".$veri_code."',
							VERI_CODE_DTM = CURRENT_TIMESTAMP,
							MOD_DTM = CURRENT_TIMESTAMP
							WHERE USER_ID = '".$user_id."'";
				
				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Email updated !");
					
					//TODO: verification email with veri_code has to be sent here
					
					echo "{'err_code':0,'isError':false,'err_message':'Your email has been updated !'}";
				}
				else{
					echo "{'err_code':1,'isError':true,'err_message':'Could not update your email'}";
				}
				//update with new veri code
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function verifyEmail($email, $veri_code){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : email(".$email.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : veri code(".$veri_code.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($email)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
				return;
			}
			
			if(!Util::check_for_null($veri_code)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty veri_code");
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
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Veri code has expired (".$result_obj->DAYS." days)");
						return VERIFY_EMAIL_VERICODE_EXPIRED;
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Veri code(".$veri_code.") & email(".$email.") are valid");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Veri code has not expired (".$result_obj->DAYS." days)");
						$user_id = $result_obj->USER_ID;
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Veri code(".$veri_code.") & email(".$email.") are not valid");
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
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Email verification completed !");
					return VERIFY_EMAIL_VERIFIED;
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Email verification failed !");
					return VERIFY_EMAIL_NOT_VERIFIED;
				}
				//update VERI_CODE & VERI_CODE_DTM
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function submitFollowUser($flwr_user_id, $flws_user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : flwr_user_id(".$flwr_user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : flws_user_id(".$flws_user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($flwr_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty flwr_user_id");
				return;
			}

			if(!Util::check_for_null($flws_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty flws_user_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

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
						$result_array['isFollowing'] = $flag == 'N';
						
						//register timeline
						if($result_array['isFollowing']){
							Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_FOLLOW, $result_data->RLT_ID);
						}
						else{
							Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_UNFOLLOW, $result_data->RLT_ID);
						}
						//register timeline
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! user(".$flwr_user_id.") could not follow/unfollow the user(".$flws_user_id.")");
						$result_array['isFollowing'] = false;
					}
				}
				//if the $flwr_user_id follows/followed $flws_user_id
				
				//if the $flwr_user_id has never followed $flws_user_id
				else{
					$query = "INSERT INTO `USER_RELATIONSHIP` (`FLWR_USER_ID`, `FLWS_USER_ID`, `CREATE_DTM`) 
								VALUES ('$flwr_user_id', '$flws_user_id', CURRENT_TIMESTAMP)";
					
					$result_array['isFollowing'] = mysqli_query($con, $query);
					$rlt_id = mysqli_insert_id($con);
					
					//register timeline
					Timeline::addTimeline($con, $flwr_user_id, $flws_user_id, USER_FOLLOW, $rlt_id);
					//register timeline
				}
				//if the $flwr_user_id has never followed $flws_user_id
				
				//get the followers count
				$result_array['followersCount'] = self::getFollowersCount($con, $flws_user_id);
				//get the followers count
				
				
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
		
		public static function fetchUser($user_id){
			//request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
                return;
            }
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USER_ID, EMAIL, MOBILE, IMG, NAME, GENDER FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['USER_ID'] = $result_data->USER_ID;
					$temp_array['EMAIL'] = $result_data->EMAIL;
					$temp_array['MOBILE'] = $result_data->MOBILE;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					$temp_array['GENDER'] = $result_data->GENDER;
					
					//get followers count
					$temp_array['followersCount'] = self::getFollowersCount($con, $user_id);
					//get followers count
					
					//get following count
					$temp_array['followingCount'] = self::getFollowingCount($con, $user_id);
					//get following count
					
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
		
		public static function getFollowersCount($con, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
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
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function getFollowingCount($con, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS FOLLOWING_COUNT
							FROM `USER_RELATIONSHIP` 
							WHERE FLWS_USER_ID = '".$user_id."'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->FOLLOWING_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function login($email, $password){
			//request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : email(".$email.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : password(".$password.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
                return;
            }

            if(!Util::check_for_null($password)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty password");
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
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "User Login Failed with email id as: ".$email);
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "User Login Failed with email id as: ".$email);
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
		
		public static function register($email, $password, $name){
			//request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : email(".$email.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : namegit a(".$name.")");
			//request

            //check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
                return;
            }

            if(!Util::check_for_null($name)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty name");
                return;
            }
			
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT EMAIL FROM `USER` WHERE EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					if($result_data->EMAIL == $email){
						$data['err_code']= 0;
						$data['isError']= true;
						$data['err_message']="Email id already exist";
					}
				}
				else{
					$ssid = Util::generateRandomString(); 		//TODO: this must be php session id and not a random string
					$salt = Util::generateSalt(); 

					$password = $password.$salt;
					$password = base64_encode($password);

					$salt = base64_encode($salt);
					
					$vericode = Util::generateRandomNumber(8);
					$query = "INSERT INTO `USER` 
								(EMAIL, VERI_CODE, VERI_CODE_DTM, PASSWORD, NAME, SSID, SALT, CREATE_DTM) 
								values('$email', '$vericode', CURRENT_TIMESTAMP, '$password', '$name', '$ssid', '$salt', CURRENT_TIMESTAMP)";
					
					if(mysqli_query($con, $query)){
						$user_id = mysqli_insert_id($con);
						
						$data['err_code']= 1;
						$data['isError']= false;
						$data['err_message']="User Registered Successfully";
						
						//register timeline
						Timeline::addTimeline($con, $user_id, $user_id, USER_ADD, $user_id);
						//register timeline
						
						//TODO: email verification link has to be sent
					}
				}
				
				echo json_encode($data);
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