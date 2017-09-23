<?php
$filename = "config_roll.php";

try
{
  $mysqli = new mysqli("localhost", "root", "cookery", "Cookery");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}
?>