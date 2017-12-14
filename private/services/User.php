<?php
	class User{
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