<?php
	class Util{
		public static function mailTrigger($mailto, $vrfctn_code){
			//$to = $mailto;
			$to = "dial2vishal@gmail.com";
			$subject = "COOKERY EMAIL VERIFICATION EMAIL";

			$message = "
			<html>
			<head>
			<title>Email Verification</title>
			</head>
			<body>
			Hi,<br>
			<p>This is auto-generated email,Do not reply to this mail.</p>
			CLICK ON THE LINK TO CONFIRM YOUR EMAIL AND STAY CONNECTED
							<br><br><br><br>
			<b>Thanks,<br>
			Cookery Team</b>
			</body>
			</html>";

			// Always set content-type when sending HTML email
			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

			mail($to, $subject, $message, $headers);
		}

		public static function generateRandomString($length = 10) {
			$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
			$charactersLength = strlen($characters);
			$randomString = '';
			for ($i = 0; $i < $length; $i++) {
				$randomString .= $characters[rand(0, $charactersLength - 1)];
			}
			return $randomString;
		}
		
		public static function generateRandomNumber($length) {
			$characters = '0123456789';
			$charactersLength = strlen($characters);
			$randomString = '';
			for ($i = 0; $i < $length; $i++) {
				$randomString .= $characters[rand(0, $charactersLength - 1)];
			}
			return $randomString;
		}

		public static function generateSalt($length = 5) {
			$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
			$charactersLength = strlen($characters);
			$randomString = '';
			for ($i = 0; $i < $length; $i++) {
				$randomString .= $characters[rand(0, $charactersLength - 1)];
			}
			return $randomString;
		}

		public static function check_for_null($value) {
			if (is_array($value)) {
				if (count($value) > 0) {
					return TRUE;
				} else {
					return FALSE;
				}
			} else {
				if (($value != '') && ($value !== NULL) && (strlen(trim($value)) > 0)) {
					return TRUE;
				} else {
					return FALSE;
				}
			}
		}

		public static function starts_with($haystack, $needle){
			return strpos($haystack, $needle) === 0;
		}

		public static function ends_with($haystack, $needle){
			return strrpos($haystack, $needle) + strlen($needle) === strlen($haystack);
		}

		public static function create_directory($path){
			if(!file_exists($path)){
				$result = mkdir($path, 0777, true);
				chmod($path, 0777);

				return $result;
			}

			return true;
		}

		public static function prepare_directories($user_id){
			$filename = "util.php";

			if(!file_exists(APP_DATA_DIRECTORY)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".APP_DATA_DIRECTORY.") does not exist ! Create it manually with 0777 permission !");
				return false;
			}

			if(!file_exists(APP_DATA_USERS_DIRECTORY)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Directory(".APP_DATA_USERS_DIRECTORY.") does not exist. Creating it.");
				if(!self::create_directory(APP_DATA_USERS_DIRECTORY)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".APP_DATA_USERS_DIRECTORY.") could not be created !");
					return false;
				}
			}

			$directory = APP_DATA_USERS_DIRECTORY.$user_id;
			if(!file_exists($directory)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Directory(".$directory.") does not exist. Creating it.");
				if(!self::create_directory($directory)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".$directory.") could not be created !");
					return false;
				}
			}
			
			$directory = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_PROFILE_DIRECTORY;
			if(!file_exists($directory)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Directory(".$directory.") does not exist. Creating it.");
				if(!self::create_directory($directory)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".$directory.") could not be created !");
					return false;
				}
			}
			
			$directory = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_PROFILE_DIRECTORY.APP_DATA_PROFILE_IMAGES_DIRECTORY;
			if(!file_exists($directory)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Directory(".$directory.") does not exist. Creating it.");
				if(!self::create_directory($directory)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".$directory.") could not be created !");
					return false;
				}
			}

			$directory = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_RECIPES_DIRECTORY;
			if(!file_exists($directory)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Directory(".$directory.") does not exist. Creating it.");
				if(!self::create_directory($directory)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Directory(".$directory.") could not be created !");
					return false;
				}
			}

			return true;
		}

		public static function get_relative_path($absolute_path){
			return str_replace(HOME_DIRECTORY,"",$absolute_path);
		}
		
		public static function getSmartDecimal($decimal){
			if($decimal == 0 || $decimal == "0.0"){
				return 0;
			}
			else if(self::endsWith($decimal, ".0")){
				return str_replace(".0", "", $decimal);
			}
			
			return $decimal;
		}
		
		public static function endsWith($haystack, $needle){
		   return !($needle[strlen($needle) - 1] === $haystack);
		}
	}
?>