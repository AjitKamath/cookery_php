<?php
//Logs format
//datetime filename type message

function errlogger($filename, $type, $message)
{
	include 'error_code.php';

	$name = "error";
	$status = checkforfile($name);
	$pieces = explode("|", $status);
	
	if($pieces[0])
	{
		date_default_timezone_set('Asia/Kolkata');
		$datetime = date('d-m-y H:i:s');

		////$file_handle = fopen($ERR_LOG_PATH, "a");
		$file_handle = fopen($pieces[1], "a");
		$file_contents = $datetime." : ".$filename." : ".$type." : ".$message;

		fwrite($file_handle, $file_contents."\n");

		fclose($file_handle);
	}
	else
	{
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


function infologger($filename, $type, $message)
{
	include 'error_code.php';

	$name = "info";
	$status = checkforfile($name);
	$pieces = explode("|", $status);
	
	if($pieces[0])
	{
		date_default_timezone_set('Asia/Kolkata');
		$datetime = date('d-m-y H:i:s');

		//$file_handle = fopen($INFO_LOG_PATH, "a");
		$file_handle = fopen($pieces[1], "a");
		$file_contents = $datetime." : ".$filename." : ".$type." : ".$message;

		fwrite($file_handle, $file_contents."\n");

		fclose($file_handle);
	}
	else
	{
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

function checkforfile($name)
{
	$flag = "false";
	$errfile =  "false";
	$infofile =  "false";
	
	$currentdate = date("Y-m-d");
	$errfilename = "/home/cabox/workspace/Log/".$currentdate."_errlog.log";
	$infofilename = "/home/cabox/workspace/Log/".$currentdate."_infolog.log";
	
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