<?php
	session_start();

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
			self::initializeDatabaseAuditParameters();
			if($_SESSION[DATABASE_TRANSACTION_COUNTER] == 1 && $_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP] == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Suspected database transaction leak !");

				date_default_timezone_set(LOGS_TIMEZONE);
				$now = date(LOGS_TIMESTAMP_FORMAT);
				$_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = $now;

				if($_SESSION[DATABASE_TRANSACTION_COUNTER] == 1){
					//email
					MailUtil::databaseEmail(DATABASE_TRANSACTION_LEAK);
				}
			}

			$_SESSION[DATABASE_TRANSACTION_COUNTER] = $_SESSION[DATABASE_TRANSACTION_COUNTER] + 1;
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Transaction Status : started [transactions alive-	".$_SESSION[DATABASE_TRANSACTION_COUNTER]."]");
			//audit
		}
		
		public static function endTransaction($con){
			mysqli_commit($con);
			
			//audit
			self::initializeDatabaseAuditParameters();
			if($_SESSION[DATABASE_TRANSACTION_COUNTER] == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Expecting atleast 1 database transaction to be alive here but found (".$_SESSION[DATABASE_TRANSACTION_COUNTER]."). Premature connection closed ?");
			}	
			
			$_SESSION[DATABASE_TRANSACTION_COUNTER] = $_SESSION[DATABASE_TRANSACTION_COUNTER] - 1;
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Transaction Status : ended [transactions alive-".$_SESSION[DATABASE_TRANSACTION_COUNTER]."]");
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
				Util::setResponseHeader(HTTP_INTERNAL_ERROR);
				die("Failed to connect to MySQL: " . mysqli_error());		
			}
			else{
				//audit
				self::initializeDatabaseAuditParameters();
				if($_SESSION[DATABASE_CONNECTION_COUNTER] == 1 && $_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP] == 0){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Suspected database connection leak !");
					
					date_default_timezone_set(LOGS_TIMEZONE);
					$now = date(LOGS_TIMESTAMP_FORMAT);
					$_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP] = $now;
					
					if($_SESSION[DATABASE_CONNECTION_COUNTER] == 1){
						//email
						MailUtil::databaseEmail(DATABASE_CONNECTION_LEAK);
					}
				}

				$_SESSION[DATABASE_CONNECTION_COUNTER] = $_SESSION[DATABASE_CONNECTION_COUNTER] + 1;
				//audit
			}
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Status : connected [connections alive-".$_SESSION[DATABASE_CONNECTION_COUNTER]."]");
			
			//Offset default mysql timezone to IST
			mysqli_query($conn, "SET time_zone = '".DATABASE_TIMEZONE_OFFSET."'");
			
			return $conn;
		}

		public static function close_connection($conn) {
			mysqli_close($conn);
			
			//audit
			self::initializeDatabaseAuditParameters();
			if($_SESSION[DATABASE_CONNECTION_COUNTER] == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Expecting atleast 1 database connection to be alive here but found (".$_SESSION[DATABASE_CONNECTION_COUNTER]."). Premature connection closed ?");
			}	
			
			$_SESSION[DATABASE_CONNECTION_COUNTER] = $_SESSION[DATABASE_CONNECTION_COUNTER] - 1;
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Database Status : disconnected [connections alive-".$_SESSION[DATABASE_CONNECTION_COUNTER]."]");
			//audit
		}
		
		private static function initializeDatabaseAuditParameters(){
			if(!isset($_SESSION[DATABASE_CONNECTION_COUNTER]) && empty($_SESSION[DATABASE_CONNECTION_COUNTER])){
				$_SESSION[DATABASE_CONNECTION_COUNTER] = "";
			}
			
			if(!isset($_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP]) && empty($_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP])){
				$_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP] = "";
			}
			
			if(!isset($_SESSION[DATABASE_TRANSACTION_COUNTER]) && empty($_SESSION[DATABASE_TRANSACTION_COUNTER])){
				$_SESSION[DATABASE_TRANSACTION_COUNTER] = "";
			}
			
			if(!isset($_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP]) && empty($_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP])){
				$_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = "";
			}
		}
		
		public static function showDatabaseAuditParameters(){
			$response = "";
			$response = $response. "DATABASE_CONNECTION_COUNTER : ".$_SESSION[DATABASE_CONNECTION_COUNTER]."\n";
			$response = $response. "DATABASE_CONNECTION_LEAK_TIMESTAMP : ".$_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP]."\n\n";
			$response = $response. "DATABASE_TRANSACTION_COUNTER : ".$_SESSION[DATABASE_TRANSACTION_COUNTER]."\n";
			$response = $response. "DATABASE_TRANSACTION_LEAK_TIMESTAMP : ".$_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP]."\n";
			
			return $response;
		}
		
		public static function deleteDatabaseAuditParameters(){
			$_SESSION[DATABASE_CONNECTION_COUNTER] = "";
			$_SESSION[DATABASE_CONNECTION_LEAK_TIMESTAMP] = "";
			$_SESSION[DATABASE_TRANSACTION_COUNTER] = "";
			$_SESSION[DATABASE_TRANSACTION_LEAK_TIMESTAMP] = "";
			
			$response = "All Database Audit parameters have been cleared !\n\n";
			$response = $response . self::showDatabaseAuditParameters();
			return $response;
		}
		
		public static function cleanUpString($con, $string){
			return $con->real_escape_string($string);
		}
	}
?>