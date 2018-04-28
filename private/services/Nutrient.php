<?php
	class Nutrient{
		public static function fetchIngredientNutrientValues($ingId){
			//check for null/empty
			if(!Util::check_for_null($ingId)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."ingId");
				return;
			}
			//check for null/empty
			
			try{
                $con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "SELECT ING.ING_ID, ING_CAT.ING_CAT_NAME, ING_AKA.ING_AKA_NAME
							FROM INGREDIENT AS ING
							INNER JOIN ING_AKA AS ING_AKA ON ING_AKA.ING_ID = ING.ING_ID
							INNER JOIN ING_CATEGORIES AS ING_CAT ON ING.ING_CAT_ID = ING_CAT.ING_CAT_ID
							where ING.ING_ID = '".$ingId."'";
				$result = mysqli_query($con, $query);
				
				$result_array = array();
				if($result_obj = $result->fetch_object()){
					$temp_array['ingredientId'] = $result_obj->ING_ID;
					$temp_array['ingredientName'] = $result_obj->ING_AKA_NAME;
					$temp_array['ingredientCategoryName'] = $result_obj->ING_CAT_NAME;
					
					//get ingredient images
					$temp_array['images'] = Ingredient::getIngredientImages($con, $result_obj->ING_ID);
					
					//get ingredient nutrient types
					$query = "SELECT NUT_CAT.NUT_CAT_ID, NUT_CAT_NAME
 							FROM INGREDIENT_NUTRITION AS ING_NUT
 							INNER JOIN NUTRITION AS NUT ON NUT.NUT_ID = ING_NUT.NUT_ID
 							INNER JOIN NUTRITION_CATEGORIES AS NUT_CAT ON NUT_CAT.NUT_CAT_ID = NUT.NUT_CAT_ID
 							WHERE ING_NUT.ING_ID = '".$ingId."' 
							GROUP BY NUT_CAT_ID";
					$nut_cat_result = mysqli_query($con, $query);
					
					$nut_cat_result_array = array();
					while($nut_cat_result_obj = $nut_cat_result->fetch_object()){
						$nut_cat_temp_array['nutritionCategoryId'] = $nut_cat_result_obj->NUT_CAT_ID;
						$nut_cat_temp_array['nutritionCategoryName'] = $nut_cat_result_obj->NUT_CAT_NAME;
						
						//get ingredient nutrient values
						$query = "SELECT NUT.NUT_NAME, ING_NUT.ING_NUT_VAL, NUT_UOM.NUT_UOM_NAME
								FROM INGREDIENT_NUTRITION AS ING_NUT
								INNER JOIN NUTRITION AS NUT ON NUT.NUT_ID = ING_NUT.NUT_ID
								INNER JOIN NUTRITION_UOM AS NUT_UOM ON NUT_UOM.NUT_UOM_ID = ING_NUT.NUT_UOM_ID
								WHERE NUT.NUT_CAT_ID = '".$nut_cat_result_obj->NUT_CAT_ID."'
								AND ING_NUT.ING_ID = '".$ingId."'";
						$nut_result = mysqli_query($con, $query);

						$nut_result_array = array();
						while($nut_result_obj = $nut_result->fetch_object()){
							$nut_temp_array['NUT_NAME'] = $nut_result_obj->NUT_NAME;
							$nut_temp_array['ingredientNutritionValue'] = $nut_result_obj->ING_NUT_VAL;
							$nut_temp_array['nutritionUOMName'] = $nut_result_obj->NUT_UOM_NAME;

							array_push($nut_result_array, $nut_temp_array);
						}
						
						$nut_cat_temp_array['ingredientNutrition'] = $nut_result_array;
						
						array_push($nut_cat_result_array, $nut_cat_temp_array);
					}
					
					$temp_array['nutritions'] = $nut_cat_result_array;
					
					array_push($result_array, $temp_array);
					return json_encode($result_array);
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not fetch ingredient(".$ingId.")");
				}
            }
            catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
            }
		}		
	}
?>