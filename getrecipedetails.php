<?php

include 'application_context.php';

$filename = "getrecipedetails.php";

$rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';

$rcpdetailsquery = "SELECT USR.NAME, RCP.RCP_ID, RCP.RCP_NAME, RCP.RCP_PROC, RCP.RCP_PLATING, RCP.RCP_NOTE, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME,
                    FDCSN.FOOD_CSN_ID, FDTYP.FOOD_TYP_ID
                    from `RECIPE` AS RCP INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
                                         INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
																				 INNER JOIN `USER` AS USR ON RCP.USER_ID = USR.USER_ID 
                                         WHERE RCP.RCP_ID = '$rcp_id'";

 
$rcpimgquery = "SELECT RCP_IMG_ID, RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$rcp_id' ";

$ingquery = "SELECT ING.ING_ID, ING.ING_NAME, QTY.QTY_NAME, DSH.ING_QTY FROM `DISH` AS DSH 
                                                            INNER JOIN `RECIPE` AS RCP ON DSH.RCP_ID = RCP.RCP_ID
                                                            INNER JOIN  `INGREDIENT` AS ING ON ING.ING_ID = DSH.ING_OR_AKA_ID
                                                            INNER JOIN  `QTY` AS QTY ON QTY.QTY_ID = DSH.QTY_ID
                                                            WHERE RCP.RCP_ID = '$rcp_id' ";


$likequery = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE = 'RECIPE' AND TYPE_ID = '$rcp_id'";
$userhaslikedquery = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE = 'RECIPE' AND TYPE_ID = '$rcp_id' AND USER_ID = '$user_id'";

$checkviewquery = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
$insertviewquery = "INSERT INTO `VIEWS`(`USER_ID`, `RCP_ID`, `MOD_DTM`, `CREATE_DTM`) VALUES('$user_id', '$rcp_id', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
$viewquery = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$rcp_id'";

//if the view is not registered for this recipe by this user, register it
try
{
  $check_view_data = mysqli_query($db,$checkviewquery);
	infologger($filename, "I", "Recipe view data fetched successfully");
	
	if($viewobj = $check_view_data->fetch_object()) 
  {
      if($viewobj->VIEWS_COUNT == 0){
					$q1_ok = "true";
					$mysqli->query($insertviewquery) ? null : $q1_ok=false;

					if(!$q1_ok)
					{
						 errlogger($filename, "E", "Query failure : ".$insertviewquery);
					}
					else{
						infologger($filename, "I", "Recipe View data fetched successfully");
					}
			}
	}
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}
//if the view is not registered for this recipe by this user, register it

try
{
  $rcp_data = mysqli_query($db,$rcpdetailsquery);
	infologger($filename, "I", "Recipe data fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}



try
{
	$ing_data = mysqli_query($db,$ingquery);
	infologger($filename, "I", "Ingredient data fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}



try
{
	$rcp_imgs = mysqli_query($db,$rcpimgquery);
	infologger($filename, "I", "Recipe images fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}


try
{
	$like_data = mysqli_query($db,$likequery);
	infologger($filename, "I", "Like data fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
	$has_liked_data = mysqli_query($db,$userhaslikedquery);
	infologger($filename, "I", "User like data fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
	$view_data = mysqli_query($db,$viewquery);
	infologger($filename, "I", "View data fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}


$rcpdetails = array();

 while($rcpobj = $rcp_data->fetch_object()) 
  {
      $rcpdetails['RCP_ID'] = $rcpobj->RCP_ID;
      $rcpdetails['RCP_NAME'] = $rcpobj->RCP_NAME;
      $rcpdetails['RCP_PROC'] = $rcpobj->RCP_PROC;
      $rcpdetails['RCP_PLATING'] = $rcpobj->RCP_PLATING;
      $rcpdetails['RCP_NOTE'] = $rcpobj->RCP_NOTE;
      $rcpdetails['FOOD_CSN_NAME'] = $rcpobj->FOOD_CSN_NAME;
      $rcpdetails['FOOD_TYP_NAME'] = $rcpobj->FOOD_TYP_NAME;
      $rcpdetails['FOOD_CSN_ID'] = $rcpobj->FOOD_CSN_ID;
      $rcpdetails['FOOD_TYP_ID'] = $rcpobj->FOOD_TYP_ID;
	 		$rcpdetails['NAME'] = $rcpobj->NAME;
	}

if($likeobj = $like_data->fetch_object()){
	$rcpdetails['likes'] = $likeobj->LIKES_COUNT;
}

if($userlikedobj = $has_liked_data->fetch_object()){
	$rcpdetails['isLiked'] = $userlikedobj->LIKES_COUNT > 0;
}

if($viewobj = $view_data->fetch_object()){
	$rcpdetails['views'] = $viewobj->VIEWS_COUNT;
}

$ingarray = array();
 while($ingobj = $ing_data->fetch_object()) 
  {
        $temparr['ING_ID'] = $ingobj->ING_ID;
        $temparr['ING_NAME'] = $ingobj->ING_NAME;
        $temparr['QTY_NAME'] = $ingobj->QTY_NAME;
        $temparr['ING_QTY'] = $ingobj->ING_QTY;
      
      array_push($ingarray, $temparr);  
  }

$rcpimgarray = array();
 while($rcpimgobj = $rcp_imgs->fetch_object()) 
  {
        //$temparry['RCP_IMG_ID'] = $rcpimgobj->RCP_IMG_ID;
        $temparry = $rcpimgobj->RCP_IMG;
      array_push($rcpimgarray, $temparry);  
  }


$rcpdetails['ingredients'] = $ingarray;
$rcpdetails['RCP_IMGS'] = $rcpimgarray;

$finalresponse = array();
array_push($finalresponse, $rcpdetails);

echo json_encode($finalresponse);



   
?>
