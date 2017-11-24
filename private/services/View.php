<?php
	class View{
		public static function fetchRecipeViews($rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get views details for $rcp_id
				$query = "SELECT USR.USER_ID, USR.NAME, USR.IMG FROM VIEWS VW INNER JOIN USER USR ON USR.USER_ID = VW.USER_ID WHERE RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					array_push($result_array, $result_data);
				}
				//get views details for $rcp_id

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total views fetched for rcp_id('.$rcp_id.') : ".sizeof($result_array));

				//response
				echo json_encode($result_array);
				//response
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