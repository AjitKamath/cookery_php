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

		public static function authenticateSonar($headers){
			if ( array_key_exists(SONAR_PROJECT_KEY_IDENTFIER, $headers) ) {
				$project_key = $headers[ SONAR_PROJECT_KEY_IDENTFIER ];
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON			: Request authentication failed !! Sonar Project Key is null/empty");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
			
			if($project_key == NULL || $project_key == ''){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "SONAR PROJECT KEY		: ".$project_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON				: Request authentication failed !! Sonar Project Key is null/empty");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
			else if($project_key == SONAR_PROJECT_KEY){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "SONAR PROJECT KEY		: ".$project_key);
				header('X-PHP-Response-Code: 200', true, 200);
				return true;
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "REASON			: UNKNOWN");
				header('X-PHP-Response-Code: 403', true, 403);
				return false;
			}
		}
	}
?>