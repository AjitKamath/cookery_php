<?php
	class MasterData{
		public static function fetchAllMasterData(){
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//food types
				$result_array['foodTypes'] = FoodType::fetchAllFoodTypes1($con);
				
				//cuisines
				$result_array['foodCuisines'] = FoodCuisine::fetchAllFoodCuisines1($con);
				
				//tastes
				$result_array['tastes'] = Taste::fetchAllTastes1($con);

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