<?php
	include_once('Logger.php');
	include_once('util_recipe.php');
	
	$filename = "fetchrecipedetails.php";

	logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");	

	$rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '27';
	$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '1';

	$recipe_details_array = getRecipeDetails($rcp_id, $user_id, true);

	echo $recipe_details_array;

	logger($filename, "I", "-------------".$filename."-------------");	
?>
