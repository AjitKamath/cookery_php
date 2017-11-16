<?php
//this common method will log into info/debug based on the $type. Also, this logger logs the application version. Zip's the logs whic are older than 
function logger($filename, $type, $message){
	include 'error_code.php';
	include_once('util.php');
	
	if(!file_exists(LOGS_DIRECTORY)){
		echo "Error ! Directory(".LOGS_DIRECTORY.") does not exist !";
		return;
	}
	
	//clean old logs
	clean_logs();
	
	$name = "info";
	if($type == 'E'){
		$name = "error";
	}
	
	$status = checkforfile($name);
	$pieces = explode("|", $status);
	
	if($pieces[0]){
		date_default_timezone_set('Asia/Kolkata');
		$datetime = date('d-m-y H:i:s');

		$file_handle = fopen($pieces[1], "a");
		$file_contents = "[v".APP_VERSION."] : ".$datetime." : ".$filename." : ".$type." : ".$message;

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

function checkforfile($name){
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

?>