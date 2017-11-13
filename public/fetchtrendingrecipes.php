<?php
	include_once("../util/import_util.php");
	
	$filename = "fetchtrendingrecipes.php";

	logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

	try{
		$con = open_connection();

		$query = "SELECT RCP.RCP_ID, RCPIMG.RCP_IMG, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME 
				  FROM `RECIPE_IMG` AS RCPIMG
				  INNER JOIN `RECIPE` AS RCP ON RCPIMG.RCP_ID = RCP.RCP_ID
				  INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
				  INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID 
				  ORDER BY RCP.RCP_ID DESC LIMIT 3";
		$result = mysqli_query($con, $query);

		$result_array = array();
		$imgArray = array();
		while($result_obj = $result->fetch_object()){
			$rcp_id = $result_obj->RCP_ID;
			$imgArray = array_push_assoc($imgArray, $rcp_id,$result_obj->RCP_IMG);
		}

		$resultj = mysqli_query($con, $query);
		while($result_obj = $resultj->fetch_object()) {
			$rcp_id = $result_obj->RCP_ID;
			$rcp_name = $result_obj->RCP_NAME;
			$food_csn_name = $result_obj->FOOD_CSN_NAME;
			$food_typ_name = $result_obj->FOOD_TYP_NAME;

			if(!in_array($rcp_id, array_column($result_array, 'RCP_ID'))){
				$tempArray['RCP_ID'] = $rcp_id;
				$tempArray['RCP_NAME'] = $rcp_name;
				$tempArray['FOOD_CSN_NAME'] = $food_csn_name;
				$tempArray['FOOD_TYP_NAME'] = $food_typ_name;
				$tempArray['NAME'] = "Don";
				$tempArray['RCP_IMGS'] = $imgArray[$rcp_id];

				array_push($result_array, $tempArray);
			}
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

	function array_push_assoc($array, $key, $value){
		$array[$key][] = $value;
		return $array;
	}
?>