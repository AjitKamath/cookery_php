<?php
include 'application_context.php';

$filename = "fetchtrendingrecipes.php";

$sql = "SELECT RCP.RCP_ID, RCPIMG.RCP_IMG, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME FROM `RECIPE_IMG` AS RCPIMG
																				 INNER JOIN `RECIPE` AS RCP ON RCPIMG.RCP_ID = RCP.RCP_ID
																			   INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
                                         INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID ORDER BY RCP.RCP_ID DESC LIMIT 3";

try
{
	$cat_data = mysqli_query($db,$sql);
	infologger($filename, "I", "Trending Recipes fetched successfully");
}
catch(Exception $e)
{
	  errlogger($filename, "E", 'Message: ' .$e->getMessage());
}

$myArray = array();
$imgArray = array();

      while($catobj = $cat_data->fetch_object()) 
  	    {
          $rcp_id = $catobj->RCP_ID;
          $imgArray = array_push_assoc($imgArray, $rcp_id,$catobj->RCP_IMG);
        }

       $cat_dataj = mysqli_query($db,$sql);
       while($catobj = $cat_dataj->fetch_object()) 
	      {
         $rcp_id = $catobj->RCP_ID;
         $rcp_name = $catobj->RCP_NAME;
				 $food_csn_name = $catobj->FOOD_CSN_NAME;
				 $food_typ_name = $catobj->FOOD_TYP_NAME;
           if(!in_array($rcp_id, array_column($myArray, 'RCP_ID')))
            {
             $tempArray['RCP_ID'] = $rcp_id;
             $tempArray['RCP_NAME'] = $rcp_name;
						 $tempArray['FOOD_CSN_NAME'] = $food_csn_name;
						 $tempArray['FOOD_TYP_NAME'] = $food_typ_name;
						 $tempArray['NAME'] = "Don";
             $tempArray['RCP_IMGS'] = $imgArray[$rcp_id];

             array_push($myArray, $tempArray);
            }
        }
      
         echo json_encode($myArray);

function array_push_assoc($array, $key, $value){
$array[$key][] = $value;
return $array;
}

?>