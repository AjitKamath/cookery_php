<?php

include 'application_context.php';

$text = isset($_POST['text']) ? $_POST['text'] : '';

$recipesql = "SELECT * FROM  `RECIPE` WHERE RCP_NAME LIKE '%$text%'";

$ingsql = "SELECT * FROM `DISH` AS DSH INNER JOIN `INGREDIENT` AS ING ON ING.ING_ID = DSH.ING_OR_AKA_ID WHERE ING.ING_NAME LIKE '%$text%'";

$cuisinesql = "SELECT * FROM `FOOD_CUISINE` AS FDCSN INNER JOIN `RECIPE` AS RCP ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID WHERE FDCSN.FOOD_CSN_NAME LIKE '%$text%'";

$foodtypsql = "SELECT * FROM `FOOD_TYPE` AS FDTYP INNER JOIN `RECIPE` AS RCP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID WHERE FDTYP.FOOD_TYP_NAME LIKE '%$text%'";

// Will Use later
$usersql = "SELECT * FROM `USER` WHERE NAME LIKE '%$text%'";


$rcp_data = mysqli_query($db,$recipesql);
$ing_data = mysqli_query($db,$ingsql);
$csn_data = mysqli_query($db,$cuisinesql);
$foodtyp_data = mysqli_query($db,$foodtypsql);

$user_data = mysqli_query($db,$usersql);

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
  
  $rcp_details = mysqli_query($db,$rcpdata);
  
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