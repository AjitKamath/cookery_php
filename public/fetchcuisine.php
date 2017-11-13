<?php
	include_once("../util/import_util.php");

	$filename = "fetchcuisine.php";

	logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");
	
	try{
		$con = open_connection();
		
		$query = "SELECT * FROM `FOOD_CUISINE`";
		$result = mysqli_query($con, $query);
		
		$result_array = array();
       	while($result_data = $result->fetch_object()) {
			array_push($result_array, $result_data);
        }
		
		echo json_encode($result_array);
	}
	catch(Exception $e){
		logger($filename, "E", 'Message: ' .$e->getMessage());
	}
	finally{
		close_connection($con);
	}

	logger($filename, "I", "-------------".$filename."-------------");
?>