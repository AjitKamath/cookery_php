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

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				return "";
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>