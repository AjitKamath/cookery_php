<?php

//include 'application_context.php';
$filename = "autocompleteingredient.php";

// array for final json response
$response = array();

$text = isset($_POST['text']) ? $_POST['text'] : '';

if($text == '')
{
	/*
	$response['PHP'] = "autocompleteingredient";
	$response['IS_ERROR'] = "N";
	$response['ERROR_MESSAGE'] = "No Error";
	$response['EXCEPTION'] = "No Exception";
	$response['USER_MESSAGE'] = "No User Message";
	*/
	echo json_encode($response);
}
else
{
	searchIngredientData($text);
}

function searchIngredientData($data)
{
	include 'application_context.php';

	$SQL = "Select * from INGREDIENT where `ING_NAME` LIKE '%$data%'";
	
	$result = mysqli_query($db,$SQL);
	if($result)
	{
		logger($filename, "I", "Ingredient auto - search successully");
		$myArray = array();
       	while($result_val = $result->fetch_object()) 
	    	{
               $tempArray = $result_val;
               array_push($myArray, $tempArray);
        	}
/*
		$response['PHP'] = "autocompleteingredient";
		$response['IS_ERROR'] = "N";
		$response['ERROR_MESSAGE'] = "No Error Message";
		$response['EXCEPTION'] = "No Exception";
		$response['USER_MESSAGE'] = "No User Message";	*/
		$response = $myArray;
		mysqli_close($db);
	}
	else
	{
		logger($filename, "E", "Query failure : ".$SQL);
		/*
		$response['PHP'] = "autocompleteingredient";
		$response['IS_ERROR'] = "Y";
		$response['ERROR_MESSAGE'] = "SQL failed: ".$SQL;
		$response['EXCEPTION'] = "No Exception";
		$response['USER_MESSAGE'] = "No User Message"; */
		mysqli_close($db);
	}

echo json_encode($response);
}

?>