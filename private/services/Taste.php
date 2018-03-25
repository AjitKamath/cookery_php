<?php
	class Taste{
		public static function fetchAllTastes1($con){
			try{
				$query = "SELECT TST_ID, TST_NAME, IMG FROM `TASTES`";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp['TST_ID'] = $result_data->TST_ID;
					$temp['TST_NAME'] = $result_data->TST_NAME;
					$temp['IMG'] = $result_data->IMG;
					
					array_push($result_array, $temp);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function fetchAllTastes(){
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT * FROM `TASTES`";
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