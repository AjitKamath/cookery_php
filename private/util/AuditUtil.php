<?php
	class AuditUtil{
		public static function registerAuditData(){
			$clientIP = self::getClientIP();
			$apiKey = self::getApiKey();
			$clientOS = self::getClientOS();
			$clientBrowser = self::getClientBrowser();
			$clientIdentifier = self::getClientIdentifier();
			$httpStatusCode = self::getHttpResponseCode();
			$functionKey = self::getFunctionKey();
			$country = "UNKNOWN";
			$city = "UNKNOWN";
			
			$geoLocation = self::getClientGeoLocation();
			if(!Util::check_for_null($geoLocation)){
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not fetch the client's geo location");
			}
			else{
				$country = $geoLocation['geoplugin_countryCode'];
				$city = $geoLocation['geoplugin_city'];
			}
			
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "--");
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT IP      -> ".$clientIP);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "API KEY        -> ".$apiKey);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT OS      -> ".$clientOS);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT BROWSER -> ".$clientBrowser);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT ID      -> ".$clientIdentifier);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT COUNTRY -> ".$country);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "CLIENT CITY    -> ".$city);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "RESPONSE CODE  -> ".$httpStatusCode);
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "FUNCTION KEY   -> ".$functionKey);
			
			//register request into Audit table
			Audit::submitAudit($clientIP, $apiKey, $clientOS, $clientBrowser, $clientIdentifier, $httpStatusCode, $functionKey, $country, $city);
			
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "<=====".$functionKey);
		}
		
		public static function getFunctionKey(){
			$function_key = isset($_POST['function_key']) ? $_POST['function_key'] : '';
			if(!Util::check_for_null($function_key)){
				return "";
			}
			else{
				return $function_key;
			}
		}
		
		public static function getHttpResponseCode(){
			return http_response_code();
		}
		
		public static function getClientIdentifier(){
			$clientIdentifier = '';
			if (isset($_SERVER['HTTP_X_APP_UNIQUE_ID']))
				$clientIdentifier = $_SERVER['HTTP_X_APP_UNIQUE_ID'];
			else
				$clientIdentifier = 'UNKNOWN';
			return $clientIdentifier;
		}
		
		public static function getClientIP(){
			$ipaddress = '';
			if (isset($_SERVER['HTTP_CLIENT_IP']))
				$ipaddress = $_SERVER['HTTP_CLIENT_IP'];
			else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
				$ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
			else if(isset($_SERVER['HTTP_X_FORWARDED']))
				$ipaddress = $_SERVER['HTTP_X_FORWARDED'];
			else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
				$ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
			else if(isset($_SERVER['HTTP_FORWARDED']))
				$ipaddress = $_SERVER['HTTP_FORWARDED'];
			else if(isset($_SERVER['REMOTE_ADDR']))
				$ipaddress = $_SERVER['REMOTE_ADDR'];
			else
				$ipaddress = 'UNKNOWN';
			return $ipaddress;
		}
		
		public static function getApiKey(){
			$apiKey = '';
			if (isset($_SERVER['HTTP_X_API_KEY']))
				$apiKey = $_SERVER['HTTP_X_API_KEY'];
			else
				$apiKey = 'UNKNOWN';
			return $apiKey;
		}
		
		function getClientOS() { 
    		$user_agent = $_SERVER['HTTP_USER_AGENT'];
    		$os_platform    =   "UNKNOWN";
    		$os_array       =   array(
                            '/windows nt 6.2/i'     =>  'Windows 8',
                            '/windows nt 6.1/i'     =>  'Windows 7',
                            '/windows nt 6.0/i'     =>  'Windows Vista',
                            '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
                            '/windows nt 5.1/i'     =>  'Windows XP',
                            '/windows xp/i'         =>  'Windows XP',
                            '/windows nt 5.0/i'     =>  'Windows 2000',
                            '/windows me/i'         =>  'Windows ME',
                            '/win98/i'              =>  'Windows 98',
                            '/win95/i'              =>  'Windows 95',
                            '/win16/i'              =>  'Windows 3.11',
                            '/macintosh|mac os x/i' =>  'Mac OS X',
                            '/mac_powerpc/i'        =>  'Mac OS 9',
                            '/linux/i'              =>  'Linux',
                            '/ubuntu/i'             =>  'Ubuntu',
                            '/iphone/i'             =>  'iPhone',
                            '/ipod/i'               =>  'iPod',
                            '/ipad/i'               =>  'iPad',
                            '/android/i'            =>  'Android',
                            '/blackberry/i'         =>  'BlackBerry',
                            '/webos/i'              =>  'Mobile'
                        );

    		foreach ($os_array as $regex => $value) { 
				if (preg_match($regex, $user_agent)) {
					$os_platform    =   $value;
					break;
				}
			}   

    		return $os_platform;
		}
		
		function getClientBrowser() {
			$user_agent = $_SERVER['HTTP_USER_AGENT'];
			$browser        =   "UNKNOWN";
			$browser_array  =   array(
                            '/msie/i'       =>  'Internet Explorer',
                            '/firefox/i'    =>  'Firefox',
                            '/safari/i'     =>  'Safari',
                            '/chrome/i'     =>  'Chrome',
                            '/opera/i'      =>  'Opera',
                            '/netscape/i'   =>  'Netscape',
                            '/maxthon/i'    =>  'Maxthon',
                            '/konqueror/i'  =>  'Konqueror',
                            '/mobile/i'     =>  'Handheld Browser'
                        );

			foreach ($browser_array as $regex => $value) { 
				if (preg_match($regex, $user_agent)) {
					$browser    =   $value;
					break;
				}
			}

   			return $browser;
		}
		
		function getClientGeoLocation(){
			/*Get user ip address*/
			$ip_address=AuditUtil::getClientIP();

			/*Get user ip address details with geoplugin.net*/
			$geopluginURL='http://www.geoplugin.net/php.gp?ip='.$ip_address;
			$addrDetailsArr = unserialize(file_get_contents($geopluginURL));

			if(isset($addrDetailsArr)){
				return $addrDetailsArr;
			}
			else{
				return "";
			}
		}
	}
?>