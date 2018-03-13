<?php
	class Security{
		public static function authenticateAPI($headers){
			if ( array_key_exists(API_KEY_IDENTFIER, $headers) ) {
				$api_key = $headers[ API_KEY_IDENTFIER ];
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON			: Request authentication failed !! API Key is null/empty");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
			
			if($api_key == NULL || $api_key == ''){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "API KEY		: ".$api_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON			: Request authentication failed !! API Key is null/empty");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
			else if($api_key == API_KEY_ANDROID){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST SOURCE	: ANDROID");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "API KEY		: ".$api_key);
				header('X-PHP-Response-Code: 200', true, 200);
				return true;
			}
			else if($api_key == API_KEY_WEB){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST SOURCE	: WEB");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "API KEY		: ".$api_key);
				header('X-PHP-Response-Code: 200', true, 200);
				return true;
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "API KEY		: ".$api_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON			: UNKNOWN");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
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