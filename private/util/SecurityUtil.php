<?php
	class SecurityUtil{
		public static function authenticateAPI($headers){
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Authenticating request ..");
			
			if ( array_key_exists(API_KEY_IDENTFIER, $headers) ) {
				$api_key = $headers[ API_KEY_IDENTFIER ];
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON			: Request authentication failed !! API Key is null/empty");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
			
			if($api_key == NULL || $api_key == ''){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "API KEY		: ".$api_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON			: Request authentication failed !! API Key is null/empty");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
			else if($api_key == API_KEY_ANDROID){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST SOURCE	: ANDROID");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "API KEY		: ".$api_key);
				Util::setResponseHeader(HTTP_OK);
				return true;
			}
			else if($api_key == API_KEY_WEB){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST SOURCE	: WEB");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "API KEY		: ".$api_key);
				Util::setResponseHeader(HTTP_OK);
				return true;
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REQUEST SOURCE	: UNKNOWN");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "API KEY		: ".$api_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON			: UNKNOWN");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
		}

		public static function authenticateSonar($headers){
			if ( array_key_exists(SONAR_PROJECT_KEY_IDENTFIER, $headers) ) {
				$project_key = $headers[ SONAR_PROJECT_KEY_IDENTFIER ];
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON			: Request authentication failed !! Sonar Project Key is null/empty");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
			
			if($project_key == NULL || $project_key == ''){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "SONAR PROJECT KEY		: ".$project_key);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON				: Request authentication failed !! Sonar Project Key is null/empty");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
			else if($project_key == SONAR_PROJECT_KEY){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "!!!!! SECURITY PASSED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "SONAR PROJECT KEY		: ".$project_key);
				Util::setResponseHeader(HTTP_OK);
				return true;
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "!!!!! SECURITY FAILED !!!!!");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "REASON			: UNKNOWN");
				Util::setResponseHeader(HTTP_FORBIDDEN);
				return false;
			}
		}
	}
?>