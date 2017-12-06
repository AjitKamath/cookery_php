<?php
	class Ingredient{
		public static function fetchIngredients($searchQuery){
			//request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : searchQuery(".$searchQuery.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($searchQuery)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty search query");
                return;
            }
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT * from `INGREDIENT` WHERE ING_NAME LIKE '%$searchQuery%'";
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