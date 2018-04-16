<?php
	class User{
		
    public static function authenticateUser($username, $password){
		  //check for null/empty
			if(!Utility::check_for_null($username)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty username");
					return;
			}
			
			if(!Utility::check_for_null($password)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty password");
					return;
			}
			
			try{
							$enc_password = base64_encode(md5($password));
							$connection = DatabaseUtil::getInstance()->open_connection();
							$query = "SELECT USER_ID, EMAIL, NAME, PASSWORD, SALT FROM USER WHERE EMAIL = '$username'";
							$result = mysqli_query($connection, $query);

							$result_array = array();
							if($result_obj = $result->fetch_object()){
								$salt = $result_obj->SALT;
								$salt = base64_decode($salt);
								$password = $password.$salt;
								$password = base64_encode($password);

							if($result_obj->EMAIL == $username && $result_obj->PASSWORD == $password){
								session_start();
								$_SESSION['sid']=session_id();
								header("Location:/private/web/admincontrolpanel/web/pages/dashboard.php");
							}else{
								$error = "INVALID CREDENTIALS";
								header("Location:/private/web/admincontrolpanel/web/pages/index.php?msg=".$error);
							}
					}
					else{
								$error = "USER DOES NOT EXISTS";
								header("Location:/private/web/admincontrolpanel/web/pages/index.php?msg=".$error);
							}
				}
					catch(Exception $e){
							Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
							DatabaseUtil::getInstance()->close_connection($connection);
					}
	}
		
		
		public static function logout()
		{
			session_start();
			session_destroy();
			header("Location:/private/web/admincontrolpanel/web/pages/index.php");		
		}
		
		
	}
?>