<?php
	class FoodCuisine{
		public static function fetchAllFoodCuisines1($con){
			try{
				$query = "SELECT FOOD_CSN_ID, FOOD_CSN_NAME, IS_DEF, IMG FROM `FOOD_CUISINE`";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp['FOOD_CSN_ID'] = $result_data->FOOD_CSN_ID;
					$temp['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
					$temp['IS_DEF'] = $result_data->IS_DEF;
					$temp['IMG'] = $result_data->IMG;
					
					array_push($result_array, $temp);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function fetchAllFoodCuisines(){
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT * FROM `FOOD_CUISINE`";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					array_push($result_array, $result_data);
				}

				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>