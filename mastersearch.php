<?php

include 'application_context.php';

$filename = "mastersearch.php";
$text = isset($_POST['text']) ? $_POST['text'] : '';

$recipesql = "SELECT * FROM  `RECIPE` WHERE RCP_NAME LIKE '%$text%'";

$ingsql = "SELECT * FROM `DISH` AS DSH INNER JOIN `INGREDIENT` AS ING ON ING.ING_ID = DSH.ING_OR_AKA_ID WHERE ING.ING_NAME LIKE '%$text%'";

$cuisinesql = "SELECT * FROM `FOOD_CUISINE` AS FDCSN INNER JOIN `RECIPE` AS RCP ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID WHERE FDCSN.FOOD_CSN_NAME LIKE '%$text%'";

$foodtypsql = "SELECT * FROM `FOOD_TYPE` AS FDTYP INNER JOIN `RECIPE` AS RCP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID WHERE FDTYP.FOOD_TYP_NAME LIKE '%$text%'";

// Will Use later
$usersql = "SELECT * FROM `USER` WHERE NAME LIKE '%$text%'";

try
{
	$rcp_data = mysqli_query($db,$recipesql);
	logger($filename, "I", "Recipe data fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
	$ing_data = mysqli_query($db,$ingsql);
	logger($filename, "I", "Ingredient data fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
  $csn_data = mysqli_query($db,$cuisinesql);
	logger($filename, "I", "Cuisine data fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
	$foodtyp_data = mysqli_query($db,$foodtypsql);
	logger($filename, "I", "Food Type fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}

try
{
	$user_data = mysqli_query($db,$usersql);
	logger($filename, "I", "User Data fetched successfully");
}
catch(Exception $e)
{
	  logger($filename, "E", 'Message: ' .$e->getMessage());
}


$rcpids = array();

      while($rcpobj = $rcp_data->fetch_object()) 
      {
          array_push($rcpids, $rcpobj->RCP_ID);  
      }

      while($ingobj = $ing_data->fetch_object()) 
      {
          array_push($rcpids, $ingobj->RCP_ID);  
      }

      while($csnobj = $csn_data->fetch_object()) 
      {
          array_push($rcpids, $csnobj->RCP_ID);  
      }
    
      while($fdtypobj = $foodtyp_data->fetch_object()) 
      {
          array_push($rcpids, $fdtypobj->RCP_ID);  
      }

// Getting all unique Recipes Ids
//echo json_encode($rcpids);
//echo json_encode(array_unique($rcpids));

$rcpdatalist = array();
$finaldata = array();
$rcpids = array_unique($rcpids);
foreach($rcpids as $val)
{
  $rcpdata = "select * from `RECIPE` AS RCP INNER JOIN `FOOD_TYPE` AS FDTYP ON FDTYP.FOOD_TYP_ID = RCP.FOOD_TYP_ID
                                            INNER JOIN `FOOD_CUISINE` AS FDCSN ON FDCSN.FOOD_CSN_ID = RCP.FOOD_CSN_ID 
                                            INNER JOIN `RECIPE_IMG` AS RCPIMG ON RCPIMG.RCP_ID = RCP.RCP_ID
                                            WHERE RCP.RCP_ID = '$val'";
  
  try
  {
    $rcp_details = mysqli_query($db,$rcpdata);
    logger($filename, "I", "Full and final recipe details fetched successfully");
  }
  catch(Exception $e)
  {
      logger($filename, "E", 'Message: ' .$e->getMessage());
  }
  
   while($rcpdataobj = $rcp_details->fetch_object()) 
      {      
          $rcpdatalist['RCP_NAME'] = $rcpdataobj->RCP_NAME;
          $rcpdatalist['RCP_IMGS'][] = $rcpdataobj->RCP_IMG;
          $rcpdatalist['RCP_ID'] = $rcpdataobj->RCP_ID;
          $rcpdatalist['RATING'] = "5";
          $rcpdatalist['NAME'] = "Don";
          $rcpdatalist['FOOD_TYPE_NAME'] = $rcpdataobj->FOOD_TYP_NAME;
          $rcpdatalist['FOOD_CSN_NAME'] = $rcpdataobj->FOOD_CSN_NAME;
      }
  array_push($finaldata , $rcpdatalist);
}

echo json_encode($finaldata);



?>