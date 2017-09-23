<?php
include 'application_context.php';

$filename = "fetchfoodtype.php";
$sql = "SELECT * FROM `FOOD_TYPE` ";

try
{
	$cat_data = mysqli_query($db,$sql);
	infologger($filename, "I", "Food Type fetched successfully");
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