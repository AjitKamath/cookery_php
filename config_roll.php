<?php
$filename = "config_roll.php";

try
{
  $mysqli = new mysqli("localhost", "cookeryuser", "cookeryuser", "Cookery");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}
?>