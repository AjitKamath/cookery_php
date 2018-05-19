<?php
	class Util{
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

		//TODO:remove this function after Recipe Update has been implemented.
		public static function prepare_directories($user_id){
			return true;
		}

		//TODO:remove this function after Recipe Update has been implemented.
		public static function get_relative_path($absolute_path){
			//return str_replace(HOME_DIRECTORY,"",$absolute_path);
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
		
		public static function setResponseHeader($code) {
			header('X-PHP-Response-Code: '.$code, true, $code);
			header('Content-Type: application/json');
		}
	}
?>