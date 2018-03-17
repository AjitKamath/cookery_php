<?php
	class DatabaseUtil {
		private static $instance = NULL;
		
		public static function getInstance(){
			if(is_null(self::$instance)){
				self::$instance = new self();
			}
			return self::$instance;
		}
		
		public static function open_connection() {
			$conn = mysqli_connect(DATABASE_HOSTNAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT);

			if(! $conn) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
				echo "Failed to connect to MySQL: " . mysqli_connect_error();
				die("Failed to connect to MySQL: " . mysqli_error());
			}
			else{
				$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
				if(count($config) == 0){
					$config[DATABASE_CONNECTION_COUNTER] = 0;	
					$config[DATABASE_CONNECTION_LEAK_TIMESTAMP] = 0;
				}	
				else if($config[DATABASE_CONNECTION_COUNTER] > 0 && $config[DATABASE_CONNECTION_LEAK_TIMESTAMP] == 0){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Suspected database connection leak !");
					
					date_default_timezone_set(LOGS_TIMEZONE);
					$now = date(LOGS_TIMESTAMP_FORMAT);
					$config[DATABASE_CONNECTION_LEAK_TIMESTAMP] == $now;
				}

				$config[DATABASE_CONNECTION_COUNTER] = $config[DATABASE_CONNECTION_COUNTER] + 1;
				DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
			}
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Database connected [connections alive-".$config[DATABASE_CONNECTION_COUNTER]."]");
			return $conn;
		}

		public static function close_connection($conn) {
			mysqli_close($conn);
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			if(count($config) == 0){
				$config[DATABASE_CONNECTION_COUNTER] = 0;	
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Expecting atleast 1 database connection to be alive here but found (".$config[DATABASE_CONNECTION_COUNTER]."). Premature connection closed ?");
			}	
			
			$config[DATABASE_CONNECTION_COUNTER] = $config[DATABASE_CONNECTION_COUNTER] - 1;
			DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Database disconnected [connections alive-".$config[DATABASE_CONNECTION_COUNTER]."]");
		}
		
		public static function put_ini_file($config, $file, $has_section = false, $write_to_file = true){
			$fileContent = '';
			if(!empty($config)){
				foreach($config as $i=>$v){
					if($has_section){
						$fileContent .= "[".$i."]\n\r" . self::put_ini_file($v, $file, false, false);
					}
					else{
						if(is_array($v)){
							foreach($v as $t=>$m){
								$fileContent .= $i."[".$t."] = ".(is_numeric($m) ? $m : '"'.$m.'"') . "\n\r";
							}
						}
						else $fileContent .= $i . " = " . (is_numeric($v) ? $v : '"'.$v.'"') . "\n\r";
					}
				}
			}

			if($write_to_file && strlen($fileContent)) return file_put_contents($file, $fileContent, LOCK_EX);
			else return $fileContent;
		}
	}
?>