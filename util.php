<?php

	function check_for_null($value) {
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

	function starts_with($haystack, $needle){
    	return strpos($haystack, $needle) === 0;
	}
	
	function ends_with($haystack, $needle){
		return strrpos($haystack, $needle) + strlen($needle) === strlen($haystack);
	}

	function clean_logs(){
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
						if(ends_with($file, ".log") && strtotime(date("Y-m-d", filemtime(LOGS_DIRECTORY.$file))) < strtotime("-".LOGS_MAX_HISTORY."days")){
							$new_filename = substr($file,strrpos($file,'/') );
							//$zip->addFile(LOGS_DIRECTORY.$file, $new_filename);
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
?>