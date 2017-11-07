<?php
	include_once('constants.php');
	
	$filename = "config.php";
	
	$db = mysqli_connect(DATABASE_HOSTNAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT);
		
	if (mysqli_connect_errno()){
		logger($filename, "E", "Connection Failed");
		logger($filename, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

	mysqli_select_db($db, DATABASE_NAME);
?>
