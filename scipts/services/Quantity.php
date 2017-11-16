<?php
	include_once("../util/ImportUtil.php");

	class Quantity{
		public static function fetchAllQuantities(){
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT * FROM `QTY`";
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