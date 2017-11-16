<?php
	include_once("../util/ImportUtil.php");

	class User{
		public static function login($email, $password){
			//request
            logger(__CLASS__, "I", "REQUEST PARAM : email(".$email.")");
            logger(__CLASS__, "I", "REQUEST PARAM : password(".$password.")");
            //request

            //check for null/empty
            if(!check_for_null($email)){
                logger(__CLASS__, "E", "Error ! null/empty email");
                return;
            }

            if(!check_for_null($password)){
                logger(__CLASS__, "E", "Error ! null/empty password");
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
						logger(__CLASS__, "I", "User Logged in with email id as: ".$email);
						$data["err_code"]="SUCCESS";
						$data["err_message"]="login success";
					}
					else{
						logger(__CLASS__, "I", "User Login Failed with email id as: ".$email);
						$data["err_code"]="FAILURE";
						$data["err_message"]="login failed";
					}
				}
				else{
					logger(__CLASS__, "I", "User Login Failed with email id as: ".$email);
					$data["err_code"]="FAILURE";
					$data["err_message"]="login failed";
				}
				
				echo json_encode($data);
			}
			catch(Exception $e){
				logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function register($email, $mobile, $password, $name, $gender){
			//request
            logger(__CLASS__, "I", "REQUEST PARAM : email(".$email.")");
            logger(__CLASS__, "I", "REQUEST PARAM : mobile(".$mobile.")");
			logger(__CLASS__, "I", "REQUEST PARAM : mobile(".$name.")");
			logger(__CLASS__, "I", "REQUEST PARAM : gender(".$gender.")");
            //request

            //check for null/empty
            if(!check_for_null($email)){
                logger(__CLASS__, "E", "Error ! null/empty email");
                return;
            }

            if(!check_for_null($mobile)){
                logger(__CLASS__, "E", "Error ! null/empty mobile");
                return;
            }
			
			if(!check_for_null($name)){
                logger(__CLASS__, "E", "Error ! null/empty name");
                return;
            }
			
			if(!check_for_null($gender)){
                logger(__CLASS__, "E", "Error ! null/empty gender");
                return;
            }
            //check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT MOBILE,EMAIL FROM USER WHERE MOBILE = '$mobile' OR EMAIL = '$email'";
				$result = mysqli_query($con, $query);
				
				if($result_data = $result->fetch_object()){
					if($result_data->MOBILE == $mobile){
						$data['err_code']= $MOBILE_EXISTS;
						$data['err_message']="Mobile no already exist";
						echo json_encode($data);
					}
					else if($result_data->EMAIL == $email){
						$data['err_code']= $EMAIL_EXISTS;
						$data['err_message']="Email id already exist";
						echo json_encode($data);
					}
				}
				else{
					$veri_code = generateRandomString(); 
					$salt = generateSalt(); 

					$password = $password.$salt;
					$password = base64_encode($password);

					$salt = base64_encode($salt);
					
					// VERI_CODE is just changed to SSID for the fix but later need to have both the columns.
					$query = "INSERT INTO USER (EMAIL,MOBILE,PASSWORD,NAME,GENDER,SSID,SALT,CREATE_DTM) values('$email','$mobile','$password','$name','$gender','$veri_code','$salt',CURRENT_TIMESTAMP)";
					
					if(mysqli_query($con, $query)){
						$user_id = mysqli_insert_id($con);
						mailTrigger($email, $veri_code);
						
						$data['err_code']= $SUCCESS;
						$data['err_message']="User Registered Successfully";
						echo json_encode($data);
						
						//register timeline
						register_timeline($con, $user_id, $user_id, USER_ADD, $user_id);
						//register timeline
					}
				}
				
				echo json_encode($data);
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