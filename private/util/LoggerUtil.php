<?php
	class LoggerUtil{
		
		//this common method will log into info/debug based on the $type. Also, this logger logs the application version. Zip's the logs whic are older than 
		public static function logger($filename, $methodName, $lineNumber, $type, $message){
			if(!file_exists(LOGS_DIRECTORY)){
				echo "Error ! Directory(".LOGS_DIRECTORY.") does not exist !";
				return;
			}

			//clean old logs
			self::clean_logs();

			$name = "info";
			if($type == 'E'){
				$name = "error";
			}

			$status = self::checkforfile($name);
			$pieces = explode("|", $status);

			if($pieces[0]){
				date_default_timezone_set('Asia/Kolkata');
				$datetime = date('d-m-y H:i:s');

				$file_handle = fopen($pieces[1], "a");
				$file_contents = "[v".APP_VERSION."] : ".$datetime." : ".$filename." : ".$methodName."(".$lineNumber.")"." : ".$type." : ".$message;

				fwrite($file_handle, $file_contents."\n");

				fclose($file_handle);
			}
			else{
				date_default_timezone_set('Asia/Kolkata');
				$datetime = date('d-m-y H:i:s');

				$PO1 = "dial2vishal@gmail.com";
				$PO2 = "ajitkamathk@gmail.com";
				$subject = "ALERT, Loggers Stopped working";
				$msg = "Both Info and Error Logs stopped working from ".$datetime." ,check urgently";

				mail($PO1,$subject,$msg);
				mail($PO2,$subject,$msg);
			}
		}
		
		public static function clean_logs(){
			//zip log files whic are loder than LOGS_MAX_HISTORY on every LOGS_MAX_HISTORY day of the month
			try{
				//get the list of log files in logs folder
				if (fmod(date("d"), LOGS_MAX_HISTORY) == 0 &&  is_dir(LOGS_DIRECTORY)){
					if ($dh = opendir(LOGS_DIRECTORY)){
						$today = date("Y-m-d");

						$zip = new ZipArchive();
						$zip->open(LOGS_DIRECTORY.$today.".zip", ZIPARCHIVE::CREATE);

						$files_array = array();
						while (($file = readdir($dh)) !== false){
							//if the file modified date is older than LOGS_MAX_HISTORY days
							if(Util::ends_with($file, ".log") && strtotime(date("Y-m-d", filemtime(LOGS_DIRECTORY.$file))) < strtotime("-".LOGS_MAX_HISTORY."days")){
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

		public static function checkforfile($name){
			$flag = "false";
			$errfile =  "false";
			$infofile =  "false";

			$currentdate = date("Y-m-d");
			$errfilename = LOGS_DIRECTORY.$currentdate."_errlog.log";
			$infofilename = LOGS_DIRECTORY.$currentdate."_infolog.log";

			if(file_exists($errfilename))
			{
				$errfile = "true";
			}
			else
			{
				// Create a File
				$myfile = fopen($errfilename, "w");
				if($myfile)
				{
					$errfile = "true";
				}
			}


			if(file_exists($infofilename))
			{
				$infofile = "true";
			}
			else
			{
				// Create a File
				$myfile = fopen($infofilename, "w");
				if($myfile)
				{
					$infofile = "true";
				}
			}


			if($errfile && $infofile)
			{
				$flag = "true";
			}

			if($name == "info")
			{
				$flag = $flag."|".$infofilename;
			}
			else
			{
				$flag = $flag."|".$errfilename;
			}

			return $flag;
		}
	}
?>