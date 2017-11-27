<?php
	class FoodType{
		public static function fetchAllFoodTypes(){
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT * FROM `FOOD_TYPE`";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					array_push($result_array, $result_data);
				}

				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>