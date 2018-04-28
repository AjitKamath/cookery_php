<?php
	class IngredientUOM{
		public static function getAllIngredientUOM($con){
			try{
				$query = "SELECT * FROM `INGREDIENT_UOM`";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					array_push($result_array, $result_data);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
	}
?>