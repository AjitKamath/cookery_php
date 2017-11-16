<?php
	include_once("../util/ImportUtil.php");

	class Ingredient{
		public static function fetchIngredients($searchQuery){
			//request
            logger(__CLASS__, "I", "REQUEST PARAM : searchQuery(".$searchQuery.")");
            //request

            //check for null/empty
            if(!check_for_null($searchQuery)){
                logger(__CLASS__, "E", "Error ! null/empty user id");
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
				logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>