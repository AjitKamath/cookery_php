<?php
	class DatabaseUtil {
		private static $instance = NULL;
		
		public static function getInstance(){
			if(is_null(self::$instance)){
				self::$instance = new self();
			}
			return self::$instance;
		}
		
		public static function beginTransaction($con){
			mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
			mysqli_autocommit($con, FALSE);
			
			//audit
			self::intializeIniFiles();
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			if($config[DATABASE_TRANSACTION_COUNTER] == 1 && $config[DATABASE_TRANSACTION_LEAK_TIMESTAMP] == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Suspected database transaction leak !");

				date_default_timezone_set(LOGS_TIMEZONE);
				$now = date(LOGS_TIMESTAMP_FORMAT);
				$config[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = $now;

				if($config[DATABASE_TRANSACTION_COUNTER] == 1){
					//email
					MailUtil::databaseEmail(DATABASE_TRANSACTION_LEAK);
				}
			}

			$config[DATABASE_TRANSACTION_COUNTER] = $config[DATABASE_TRANSACTION_COUNTER] + 1;
			DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
			//audit
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Transaction Status : started [transactions alive-".$config[DATABASE_TRANSACTION_COUNTER]."]");
		}
		
		public static function endTransaction($con){
			mysqli_commit($con);
			
			//audit
			self::intializeIniFiles();
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE);
			if(count($config) == 0){
				$config[DATABASE_TRANSACTION_COUNTER] = 0;	
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Expecting atleast 1 database transaction to be alive here but found (".$config[DATABASE_TRANSACTION_COUNTER]."). Premature connection closed ?");
			}	
			
			$config[DATABASE_TRANSACTION_COUNTER] = $config[DATABASE_TRANSACTION_COUNTER] - 1;
			DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Transaction Status : ended [transactions alive-".$config[DATABASE_TRANSACTION_COUNTER]."]");
			//audit
		}
		
		public static function rollbackTransaction($con){
			mysqli_rollback($con);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Transaction Status : rolled back");
		}
		
		public static function open_connection() {
			$conn = mysqli_connect(DATABASE_HOSTNAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT);

			if(! $conn) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed to connect to MySQL: " . mysqli_connect_error());
				echo "Failed to connect to MySQL: " . mysqli_connect_error();
				die("Failed to connect to MySQL: " . mysqli_error());		
			}
			else{
				//audit
				self::intializeIniFiles();
				
				$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
				if($config[DATABASE_CONNECTION_COUNTER] == 1 && $config[DATABASE_CONNECTION_LEAK_TIMESTAMP] == 0){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Suspected database connection leak !");
					
					date_default_timezone_set(LOGS_TIMEZONE);
					$now = date(LOGS_TIMESTAMP_FORMAT);
					$config[DATABASE_CONNECTION_LEAK_TIMESTAMP] = $now;
					
					if($config[DATABASE_CONNECTION_COUNTER] == 1){
						//email
						MailUtil::databaseEmail(DATABASE_CONNECTION_LEAK);
					}
				}

				$config[DATABASE_CONNECTION_COUNTER] = $config[DATABASE_CONNECTION_COUNTER] + 1;
				DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
				//audit
			}
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Status : connected [connections alive-".$config[DATABASE_CONNECTION_COUNTER]."]");
			return $conn;
		}

		public static function close_connection($conn) {
			mysqli_close($conn);
			
			//audit
			self::intializeIniFiles();
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE);
			if(count($config) == 0){
				$config[DATABASE_CONNECTION_COUNTER] = 0;	
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Expecting atleast 1 database connection to be alive here but found (".$config[DATABASE_CONNECTION_COUNTER]."). Premature connection closed ?");
			}	
			
			$config[DATABASE_CONNECTION_COUNTER] = $config[DATABASE_CONNECTION_COUNTER] - 1;
			DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
			
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE);
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Status : disconnected [connections alive-".$config[DATABASE_CONNECTION_COUNTER]."]");
			//audit
		}
		
		private static function put_ini_file($config, $file, $has_section = false, $write_to_file = true){
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
		
		private static function intializeIniFiles(){
			//database_stats.in file
			$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
			
			if(count($config) == 0){
				$config[DATABASE_CONNECTION_COUNTER] = 0;	
				$config[DATABASE_CONNECTION_LEAK_TIMESTAMP] = 0;
				$config[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = 0;
				$config[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = 0;
			
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, STATS_DIRECTORY.STATS_DATABASE_FILE." is empty. Initializing the variables in it.");
				DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Initialized all the variables in it.");
			}	
			//database_stats.in file
		}
		
		public static function cleanUpString($con, $string){
			return $con->real_escape_string($string);
		}
	}
?>