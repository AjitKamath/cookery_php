<?php


//Logs format
//datetime filename type message

function logger($filename, $type, $message)
{
	include "error_code.php";

	date_default_timezone_set('Asia/Kolkata');
	$datetime = date('d-m-y H:i:s');

	$file_handle = fopen($LOG_PATH, "a");
	$file_contents = $datetime." : ".$filename." : ".$type." : ".$message;

	fwrite($file_handle, $file_contents."\n");
	
	fclose($file_handle);
}

?>