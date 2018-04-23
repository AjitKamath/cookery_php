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
							$connection = DatabaseUtil::getInstance()->open_connection();
							$query = "SELECT * FROM ADMIN_USER WHERE ADMIN_USER_NAME = '$username'";
							$result = mysqli_query($connection, $query);

							$result_array = array();
							if($result_obj = $result->fetch_object()){
								/*$salt = $result_obj->SALT;
								$salt = base64_decode($salt);
								$password = $password.$salt;
								$password = base64_encode($password);
                */
                $password = base64_encode($password);
							if($result_obj->ADMIN_USER_NAME == $username && $result_obj->ADMIN_USER_PASSWORD == $password){
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
		
		public static function adminSaveUser($username, $passkey, $role, $mobile, $email){
		   //check for null/empty
			if(!Utility::check_for_null($username)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty username");
					return;
			}
      if(!Utility::check_for_null($passkey)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty password");
					return;
			}
      if(!Utility::check_for_null($role)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty role");
					return;
			}
      if(!Utility::check_for_null($mobile)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty mobile");
					return;
			}
      if(!Utility::check_for_null($email)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty email");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					// Check if category already exists
					$sql = "SELECT ADMIN_USER_NAME from `ADMIN_USER` WHERE `ADMIN_USER_NAME` = '$username'";
        	$checkresult = mysqli_query($connection, $sql);
					$row_cnt = $checkresult->num_rows;
          $obj = $checkresult->fetch_object();
          if($row_cnt == 1)
          {
            if($obj->ADMIN_USER_NAME == $username){
							$data['message'] = "exists";
            }
          }
          else
          {
              $passkey = base64_encode($passkey);
              $query = "INSERT INTO `ADMIN_USER` (`ADMIN_USER_ID`,`ADMIN_USER_NAME`,`ADMIN_USER_PASSWORD`,`ADMIN_USER_ROLE`,`ADMIN_USER_MOBILE`,`ADMIN_USER_EMAIL`,`IS_DEL`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$username','$passkey','$role', '$mobile', '$email', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
              $result = mysqli_query($connection,$query);
              if($result){
              $data['message'] = "success";
              }
              else{
              $data['message'] = "failed";
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
            }
          }
          echo json_encode($data);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function updateAdminUserRole($userid, $role)
			{
				 //check for null/empty
				if(!Utility::check_for_null($userid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
						return;
				}
        if(!Utility::check_for_null($role)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty role");
						return;
				}
				try{
						$connection = DatabaseUtil::getInstance()->open_connection();
						$result = mysqli_query($connection,"UPDATE `ADMIN_USER` SET `ADMIN_USER_ROLE` = '$role',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `ADMIN_USER_ID` = '$userid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
						echo json_encode($data);
					}catch(Exception $e){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
						DatabaseUtil::getInstance()->close_connection($connection);
					}
		}
    
	}
?>