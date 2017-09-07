<?php
include 'application_context.php';

$sql = "SELECT * FROM `FOOD_CUISINE` ";

$cat_data = mysqli_query($db,$sql);
$myArray = array();
       while($catobj = $cat_data->fetch_object()) 
	    {
                $tempArray = $catobj;
                array_push($myArray, $tempArray);
        }
//		$res["cat_data"] = $myArray;
        echo json_encode($myArray);


?>