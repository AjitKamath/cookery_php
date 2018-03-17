<?php
	class LoggerUtil{
		
		//this common method will log into info/debug based on the $type. Also, this logger logs the application version. Zip's the logs whic are older than 
		public static function logger($className, $methodName, $lineNumber, $type, $message){
			try{
				if(!file_exists(LOGS_DIRECTORY)){
					echo "Error ! Directory(".LOGS_DIRECTORY.") does not exist !";
					return;
				}

				//clean old logs
				self::clean_logs();

				//switch off the logging, if LOG_SWITCH is OFF
				if(LOGS_SWITCH == 'OFF'){
					return;
				}

				if(LOGS_SWITCH == 'ALL'){
					self::registerLog(self::checkFile("all"), $className, $methodName, $lineNumber, $type, $message);
					
					if($type == "I"){
						self::registerLog(self::checkFile("info"), $className, $methodName, $lineNumber, $type, $message);
					}
					
					if($type == "E"){
						self::registerLog(self::checkFile("error"), $className, $methodName, $lineNumber, $type, $message);
					}
				}
				else if(LOGS_SWITCH == 'INFO'){
					if($type == "I"){
						self::registerLog(self::checkFile("info"), $className, $methodName, $lineNumber, $type, $message);
					}
				}
				else if(LOGS_SWITCH == 'ERROR'){
					if($type == "E"){
						self::registerLog(self::checkFile("error"), $className, $methodName, $lineNumber, $type, $message);
					}
				}
			}
			catch(Exception $e){
				//TODO: mail the admins
			}
		}
		
		private static function registerLog($file, $className, $methodName, $lineNumber, $type, $message){
			date_default_timezone_set(LOGS_TIMEZONE);
			$now = date(LOGS_TIMESTAMP_FORMAT);

			$file_handle = fopen($file, "a");
			$file_contents = "[v".APP_VERSION."] : ".$type." : ".$now." : ".$methodName."(".$lineNumber.") : ".$message;

			fwrite($file_handle, $file_contents."\n");
			fclose($file_handle);
		}
		
		private static function getLogType($type){
			if($type == 'E'){
				return "error";
			}
			else if($type == 'I'){
				return "info";
			}
		}
		
		private static function clean_logs(){
			//zip log files whic are older than today on every LOGS_MAX_HISTORY day of the month
			try{
				//get the list of log files in logs folder
				if (fmod(date("d"), LOGS_MAX_HISTORY) == 0 &&  is_dir(LOGS_DIRECTORY)){
					if ($dh = opendir(LOGS_DIRECTORY)){
						$today = date("Y-m-d");
						$yesterday = date('Y-m-d',strtotime("-1 days"));
						
						$zip = new ZipArchive();
						$zip->open(LOGS_DIRECTORY.$yesterday.".zip", ZIPARCHIVE::CREATE);

						$files_array = array();
						while (($file = readdir($dh)) !== false){
							//if the file modified date is older than today days
							if(Util::ends_with($file, ".log") && strtotime(date("Y-m-d", filemtime(LOGS_DIRECTORY.$file))) < strtotime($today)){
								$new_filename = substr($file,strrpos($file,'/') );
								$zip->addFile(LOGS_DIRECTORY.$file, $new_filename);
								array_push($files_array, $file);
							}
						}
						$zip->close();

						//files to delete
						foreach($files_array as $iter){
							unlink(LOGS_DIRECTORY.$iter);
						}

						closedir($dh);
					}
				}
			}
			catch (Exception $e) {
				//TODO: mail the admins
			}
			//zip log files whic are loder than LOGS_MAX_HISTORY on every LOGS_MAX_HISTORY day of the month
		}

		private static function checkFile($logType){
			$today = date("Y-m-d");
			$fileName = LOGS_DIRECTORY.$today."_".$logType.".log";
			
			if(!file_exists($fileName)){
				fopen($fileName, "w");
			}
			
			return $fileName;;
		}
	}
?>