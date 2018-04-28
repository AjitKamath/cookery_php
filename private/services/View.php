<?php
	class View{
		public static function fetchViewedUsers($logged_in_user_id, $rcp_id, $index){
			//check for null/empty
			if(!Util::check_for_null($logged_in_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."logged_in_user_id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$result_array = self::getViewedUsers($con, $logged_in_user_id, $rcp_id, $index);
				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getViewCount($con, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT COUNT(*) AS VIEWS_COUNT 
							FROM `VIEWS` 
							WHERE RCP_ID = '".$rcp_id."'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->VIEWS_COUNT;
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getViewedUsers($con, $logged_in_user_id, $rcp_id, $index){
			//check for null/empty
			if(!Util::check_for_null($logged_in_user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."logged_in_user_id");
				return;
			}
			
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT VIW.USER_ID, VIW.MOD_DTM, VIW.CREATE_DTM, USR.NAME, USR.IMG
							FROM `VIEWS` AS VIW
							INNER JOIN USER AS USR ON USR.USER_ID = VIW.USER_ID
							WHERE RCP_ID = '".$rcp_id."'
							LIMIT ".$index." , ".USERS_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_obj = $result->fetch_object()){
					$temp_array['USER_ID'] = $result_obj->USER_ID; 
					$temp_array['MOD_DTM'] = $result_obj->MOD_DTM;
					$temp_array['CREATE_DTM'] = $result_obj->CREATE_DTM;
					$temp_array['NAME'] = $result_obj->NAME;
					$temp_array['IMG'] = $result_obj->IMG;
					
					$temp_array['following'] = User::getIsUserFollowing($con, $logged_in_user_id, $result_obj->USER_ID);
					$temp_array['followed'] = User::getIsUserFollowing($con, $result_obj->USER_ID, $logged_in_user_id);
					
					array_push($result_array, $temp_array); 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function fetchRecipeViews($rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp id");
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

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Total views fetched for rcp_id('.$rcp_id.') : ".sizeof($result_array));

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>