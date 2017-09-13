<?php
include 'application_context.php';

$sql = "SELECT RECIPE.RCP_ID, RCP_IMG, RCP_NAME FROM `RECIPE_IMG` INNER JOIN `RECIPE` ON RECIPE_IMG.RCP_ID = RECIPE.RCP_ID";

$cat_data = mysqli_query($db,$sql);
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
           if(!in_array($rcp_id, array_column($myArray, 'RCP_ID')))
            {
             $tempArray['RCP_ID'] = $rcp_id;
             $tempArray['RCP_NAME'] = $rcp_name;
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