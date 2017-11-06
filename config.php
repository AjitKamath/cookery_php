<?php
	$filename = "config.php";
	
	$hostname = "db4free.net";
	$user = "cookeryuser";
	$password = "cookeryuser";
	$database = "cookery";
	$port = "3307";
	
	try{
		$db = mysqli_connect($hostname, $user, $password, $database, $port);
		
		if (mysqli_connect_errno()){
			logger($filename, "E", "Connection Failed");
			logger($filename, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
			echo "Failed to connect to MySQL: " . mysqli_connect_error();
		}

		mysqli_select_db($db,$database);
	}
	catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
?>
