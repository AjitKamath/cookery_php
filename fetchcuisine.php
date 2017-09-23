<?php
include 'application_context.php';

$filename = "fetchcuisine.php";
$sql = "SELECT * FROM `FOOD_CUISINE` ";

try
{
	$cat_data = mysqli_query($db,$sql);
	infologger($filename, "I", "Food Cuisine fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
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