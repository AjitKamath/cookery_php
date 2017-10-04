<?php
include 'application_context.php';

$filename = "deletetest.php";
$sql = "DELETE FROM `INGREDIENT` WHERE ING_ID = '4' ";

try
{
	$cat_data = mysqli_query($db,$sql);
	infologger($filename, "I", "Delete test done successfully");
  echo $filename;
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
    echo $e->getMessage();
}



?>