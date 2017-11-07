<?php
$filename = "config_roll.php";

try
{
  $mysqli = new mysqli("db4free.net", "cookeryuser", "cookeryuser", "cookery", "3307");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}
?>