<?php
include 'application_context.php';

$filename = "fetchtastes.php";
$sql = "SELECT * FROM `TASTES` ";
 
try
{
	$cat_data = mysqli_query($db,$sql);
	logger($filename, "I", "Tastes fetched successfully");
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