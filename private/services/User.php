<?php
	class User{
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

				$query = "SELECT EMAIL, MOBILE, IMG, NAME FROM `USER` WHERE USER_ID = '".$user_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['EMAIL'] = $result_data->EMAIL;
					$temp_array['MOBILE'] = $result_data->MOBILE;
					$temp_array['IMG'] = $result_data->IMG;
					$temp_array['NAME'] = $result_data->NAME;
					
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

				$query = "SELECT EMAIL,PASSWORD,SALT FROM USER WHERE EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					$salt = $result_data->SALT;
					$salt = base64_decode($salt);
					$password = $password.$salt;
					$password = base64_encode($password);
					
					if($result_data->EMAIL == $email && $result_data->PASSWORD == $password){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User Logged in with email id as: ".$email);
						$data["err_code"]="SUCCESS";
						$data["isError"]=false;
						$data["err_message"]="login success";
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User Login Failed with email id as: ".$email);
						$data["err_code"]="FAILURE";
						$data["isError"]=true;
						$data["err_message"]="login failed";
					}
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User Login Failed with email id as: ".$email);
					$data["err_code"]="FAILURE";
					$data["isError"]=true;
					$data["err_message"]="login failed";
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
		
		public static function register($email, $mobile, $password, $name, $gender){
			//request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : email(".$email.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : mobile(".$mobile.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : namegit a(".$name.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : gender(".$gender.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($email)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
                return;
            }

            if(!Util::check_for_null($mobile)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty mobile");
                return;
            }
			
			if(!Util::check_for_null($name)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty name");
                return;
            }
			
			if(!Util::check_for_null($gender)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty gender");
                return;
            }
            //check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT MOBILE,EMAIL FROM USER WHERE MOBILE = '$mobile' OR EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					if($result_data->MOBILE == $mobile){
						$data['err_code']= 0;
						$data['isError']= true;
						$data['err_message']="Mobile no already exist";
					}
					else if($result_data->EMAIL == $email){
						$data['err_code']= 0;
						$data['isError']= true;
						$data['err_message']="Email id already exist";
					}
				}
				else{
					$veri_code = Util::generateRandomString(); 
					$salt = Util::generateSalt(); 

					$password = $password.$salt;
					$password = base64_encode($password);

					$salt = base64_encode($salt);
					
					// VERI_CODE is just changed to SSID for the fix but later need to have both the columns.
					$query = "INSERT INTO USER (EMAIL,MOBILE,PASSWORD,NAME,GENDER,SSID,SALT,CREATE_DTM) values('$email','$mobile','$password','$name','$gender','$veri_code','$salt',CURRENT_TIMESTAMP)";
					
					if(mysqli_query($con, $query)){
						$user_id = mysqli_insert_id($con);
						Util::mailTrigger($email, $veri_code);
						
						$data['err_code']= 1;
						$data['isError']= false;
						$data['err_message']="User Registered Successfully";
						
						//register timeline
						Timeline::addTimeline($con, $user_id, $user_id, USER_ADD, $user_id);
						//register timeline
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