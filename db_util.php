<?php
	$filename = "db_util.php";

	function open_connection() {
		$conn = mysqli_connect(DATABASE_HOSTNAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT);
   
		if(! $conn) {
			logger($filename, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
			echo "Failed to connect to MySQL: " . mysqli_connect_error();
		  	die("Failed to connect to MySQL: " . mysqli_error());
		}
		
		return $conn;
	}

	function close_connection($conn) {
		mysqli_close($conn);
	}
?>