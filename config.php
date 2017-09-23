<?php

$filename = "config.php";

$hostname = "localhost";
$user = "root";
$password = "cookery";
$database = "Cookery";
$db = mysqli_connect($hostname, $user, $password);
if (mysqli_connect_errno())
  {
	errlogger($filename, "E", "Connection Failed");
	errlogger($filename, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

else{
//			echo "Connected sucessfully";
	}
	mysqli_select_db($db,$database);
?>