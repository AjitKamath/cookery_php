<?php
include 'application_context.php';

$filename = "fetchqty.php";

$sql = "SELECT * FROM `QTY` ";

try
{
	$cat_data = mysqli_query($db,$sql);
	logger($filename, "I", "Quantity fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}

$myArray = array();
       while($catobj = $cat_data->fetch_object()) 
	    {
                $tempArray = $catobj;
                array_push($myArray, $tempArray);
        }
//		$res["cat_data"] = $myArray;
        echo json_encode($myArray);


?>