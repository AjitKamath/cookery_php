<?php

include 'application_context.php';

$rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';

$rcpdetailsquery = "SELECT RCP.RCP_ID, RCP.RCP_NAME, RCP.RCP_PROC, RCP.RCP_PLATING, RCP.RCP_NOTE, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME,
                    FDCSN.FOOD_CSN_ID, FDTYP.FOOD_TYP_ID
                    from `RECIPE` AS RCP INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
                                         INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
                                         WHERE RCP.RCP_ID = '$rcp_id'";

 
$rcpimgquery = "SELECT RCP_IMG_ID, RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$rcp_id' ";

$ingquery = "SELECT ING.ING_ID, ING.ING_NAME, QTY.QTY_NAME, DSH.ING_QTY FROM `DISH` AS DSH 
                                                            INNER JOIN `RECIPE` AS RCP ON DSH.RCP_ID = RCP.RCP_ID
                                                            INNER JOIN  `INGREDIENT` AS ING ON ING.ING_ID = DSH.ING_OR_AKA_ID
                                                            INNER JOIN  `QTY` AS QTY ON QTY.QTY_ID = DSH.QTY_ID
                                                            WHERE RCP.RCP_ID = '$rcp_id' ";



$rcp_data = mysqli_query($db,$rcpdetailsquery);
$ing_data = mysqli_query($db,$ingquery);
$rcp_imgs = mysqli_query($db,$rcpimgquery);

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


$rcpdetails['INGREDIENTS'] = $ingarray;
$rcpdetails['RCP_IMGS'] = $rcpimgarray;

$finalresponse = array();
array_push($finalresponse, $rcpdetails);

echo json_encode($finalresponse);



   
?>
