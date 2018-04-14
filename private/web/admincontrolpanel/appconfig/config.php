<?php
$hostname = "localhost";
$user = "root";
$password = "";
$database = "cookery";
$conn = mysqli_connect($hostname, $user, $password);
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

else{
	//echo "Connected sucessfully";
	}
	mysqli_select_db($conn,$database);
?>