<?php
	class Ingredient{
		public static function fetchIngredients($searchQuery){
			//check for null/empty
            if(!Util::check_for_null($searchQuery)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."search query");
                return;
            }
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT ING_AKA_ID, ING_AKA_NAME, ING.ING_ID, ING.ING_CAT_ID, ING_CAT_NAME
							FROM `ING_AKA` AS ING_AKA
							INNER JOIN `INGREDIENT` AS ING ON ING.ING_ID = ING_AKA.ING_ID
							INNER JOIN `ING_CATEGORIES` AS ING_CAT ON ING.ING_CAT_ID = ING_CAT.ING_CAT_ID
							WHERE ING_AKA_NAME LIKE '%$searchQuery%'
							AND IS_REG = 'Y'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['ING_AKA_ID'] = $result_data->ING_AKA_ID;
					$temp_array['ING_AKA_NAME'] = $result_data->ING_AKA_NAME;
					$temp_array['ING_ID'] = $result_data->ING_ID;
					$temp_array['ING_CAT_ID'] = $result_data->ING_CAT_ID;
					$temp_array['ingredientCategoryName'] = $result_data->ING_CAT_NAME;
					$temp_array['images'] = self::getIngredientPrimaryImage($con, $result_data->ING_ID);
					
					array_push($result_array, $temp_array);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getIngredientPrimaryImage($con, $ing_id){
			//check for null/empty
            if(!Util::check_for_null($ing_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."ing_id");
                return;
            }
			//check for null/empty
			
			try{
				$query = "SELECT ING_IMG
							FROM `ING_IMAGES`
							WHERE ING_ID = '".$ing_id."'
							AND IS_DEF = 'Y'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()) {
					$temp_array['ING_IMG'] = $result_data->ING_IMG;
					array_push($result_array, $temp_array);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getIngredientImages($con, $ing_id){
			//check for null/empty
            if(!Util::check_for_null($ing_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."ing_id");
                return;
            }
			//check for null/empty
			
			try{
				$query = "SELECT ING_IMG
							FROM `ING_IMAGES`
							WHERE ING_ID = '".$ing_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['ING_IMG'] = $result_data->ING_IMG;
					array_push($result_array, $temp_array);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function checkUserLists($user_id){
			//check for null/empty start
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."user id");
				return;
			}

			try{
				$con = DatabaseUtil::getInstance()->open_connection();			

				$query = "Select * FROM `USER_ING_LIST` WHERE USER_ID = '$user_id'";			
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$subquery = "Select count(ING_AKA_ID) AS ITEMS FROM `USER_ING_LIST_ITEM` WHERE USER_ING_LIST_ID = '$result_data->USER_ING_LIST_ID'";			
					$subresult = mysqli_query($con, $subquery);
					while($subresult_data = $subresult->fetch_object()) 
					{
						$data['LIST_ID'] = $result_data->USER_ING_LIST_ID;
						$data['LIST_NAME'] = $result_data->ING_LIST_NAME;
						$data['ITEM_COUNT'] = $subresult_data->ITEMS;	
					}

				array_push($result_array, $data);
				}

				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}

		public static function viewuserIngedrientList($list_id){
			//check for null/empty start
			if(!Util::check_for_null($list_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."list_id");
				return;
			}
			//check for null/empty ends

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

					$query = "SELECT * FROM USER_ING_LIST UIL INNER JOIN USER_ING_LIST_ITEM UILI ON UIL.USER_ING_LIST_ID = UILI.USER_ING_LIST_ID
										INNER JOIN ING_AKA ING ON UILI.ING_AKA = ING.ING_AKA 
										WHERE UIL.USER_ING_LIST_ID = '$list_id'";			
					$result = mysqli_query($con, $query);

					$result_array = array();
					while($result_data = $result->fetch_object()) 
					{
						$data['LIST_ID'] = $result_data->USER_ING_LIST_ID;
						$data['LIST_NAME'] = $result_data->ING_LIST_NAME;
						$data['ING_AKA_ID'] = $result_data->ING_AKA_ID;	
						$data['ING_AKA_NAME'] = $result_data->ING_AKA_NAME;	
						$data['IS_CHECKED'] = $result_data->IS_CHECKED;	

						array_push($result_array, $data);
					}
				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				mysqli_rollback($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function updateUserIngedrientList($list_id, $list_name, $user_id, $listofingredients, $nameofingredients){
			//check for null/empty start
			if(!Util::check_for_null($list_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."list_id");
				return;
			}

			if(!Util::check_for_null($list_name)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."list_name");
				return;
			}

			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}

			if(!count($listofingredients)>0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."listofingredients");
				return;
			}

			if(!count($nameofingredients)>0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."listofingredientscheck");
				return;
			}
			//check for null/empty ends

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				//transaction begins here
				mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
				mysqli_autocommit($con, FALSE);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Transaction begin for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
					$query = "DELETE FROM USER_ING_LIST_ITEM WHERE USER_ING_LIST_ID = '$list_id'";
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "List ID(".$list_id.") deleted from USER_ING_LIST_ITEM table");
					$result = mysqli_query($con, $query);
					if($result)
					{
						$subquery = "UPDATE `USER_ING_LIST` 
									SET `ING_LIST_NAME` = '".DatabaseUtil::cleanUpString($con, $list_name)."' 
									WHERE `USER_ING_LIST_ID` = '$list_id' ";
						if(mysqli_query($con, $subquery))
						{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "List(".$list_id.") updated list name as (".$list_name.") into USER_ING_LIST_ID table");
						}
						else
						{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "List(".$list_id.") failed to update list name as (".$list_name.") into USER_ING_LIST_ID table");
						}

					for($i = 0; $i< count($listofingredients); $i++)
							{
								if($listofingredients[$i] == 0)
								{
									$query = "INSERT INTO `ING_AKA` (`ING_AKA_NAME` , `CREATE_DTM`) 
												VALUES ('".DatabaseUtil::cleanUpString($con, $nameofingredients[$i])."' , CURRENT_TIMESTAMP)";
									if(mysqli_query($con, $query))
									{
										$listofingredients[$i] = mysqli_insert_id($con); 
										LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Ingredient(".$listofingredients[$i].") added into ING_AKA table");
									}					
								}
								$subquery = "INSERT INTO `USER_ING_LIST_ITEM` (ING_AKA_ID, USER_ING_LIST_ID, IS_CHECKED,
												CREATE_DTM, MOD_DTM) VALUES ('$listofingredients[$i]', '$list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
								if(mysqli_query($con, $subquery))
								{
												LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "List(".$list_id.") updated into USER_ING_LIST_ITEM table");
								}
								else
								{
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$query);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$subquery);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Rolling back !");
									throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
								}
							}
					}
								mysqli_commit($con);
					//transaction ends here
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Transaction completed for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
					$response = array();

					$response['err_message'] = "List updated successfully !";
					$response['isError'] = false;
				return json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Transaction failed for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
				$response['err_message'] = "Something went wrong !";
				$response['isError'] = true;
				mysqli_rollback($con);				
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Rolling Back..");
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}

		public static function updateUserIngedrientListFromRecipe($list_id, $ing_aka_id){
			//check for null/empty starts
			if(!Util::check_for_null($list_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."list_id");
				return;
			}

			if(!Util::check_for_null($ing_aka_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."ing_aka_id");
				return;
			}

			//check for null/empty ends

			try{
				$con = DatabaseUtil::getInstance()->open_connection();


				$query = "INSERT INTO `USER_ING_LIST_ITEM` (ING_AKA_ID, USER_ING_LIST_ID, IS_CHECKED,
											CREATE_DTM, MOD_DTM) VALUES ('$ing_aka_id', '$list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
				if(mysqli_query($con, $query))
				{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Ingredient(".$ing_aka_id.") in List(".$list_id.") added into USER_ING_LIST_ITEM table");
				}
				else
				{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$query);
					throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
				}

				$response = array();

				$response['err_message'] = "Ingedient added successfully in your List!";
				$response['isError'] = false;
				return json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				$response['err_message'] = "Something went wrong !";
				$response['isError'] = true;
				mysqli_rollback($con);				
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
			
		public static function saveuserIngedrientList($list_name, $user_id, $listofingredients, $nameofingredients){
			//check for null/empty start
			if(!count($listofingredients)>0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."listofingredients");
				return;
			}

			if(!count($nameofingredients)>0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."nameofingredients");
				return;
			}

			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}
			//check for null/empty ends

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				//submit list transaction begins here
				mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
				mysqli_autocommit($con, FALSE);

				$query = "INSERT INTO `USER_ING_LIST` (ING_LIST_NAME, USER_ID, IS_DEL,
									CREATE_DTM, MOD_DTM) VALUES ('".DatabaseUtil::cleanUpString($con, $list_name)."', '$user_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
				if(mysqli_query($con, $query))
				{
						$temp_list_id = mysqli_insert_id($con); 
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "List(".$temp_list_id.") added into USER_ING_LIST table");

						for($i = 0; $i< count($listofingredients); $i++)
						{
							if($listofingredients[$i] == 0)
							{
								$query = "INSERT INTO `ING_AKA` (`ING_AKA_NAME` , `CREATE_DTM`) 
											VALUES ('".DatabaseUtil::cleanUpString($con, $nameofingredients[$i])."' , CURRENT_TIMESTAMP)";
								if(mysqli_query($con, $query))
								{
									$listofingredients[$i] = mysqli_insert_id($con); 
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Ingredient(".$listofingredients[$i].") added into ING_AKA table");
								}					
							}
							$subquery = "INSERT INTO `USER_ING_LIST_ITEM` (ING_AKA_ID, USER_ING_LIST_ID, IS_CHECKED,
											CREATE_DTM, MOD_DTM) VALUES ('$listofingredients[$i]', '$temp_list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
							if(mysqli_query($con, $subquery))
							{
											LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "List(".$temp_list_id.") added into USER_ING_LIST_ITEM table");
							}
							else
							{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$subquery);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
							}
						}
				}
				else
				{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Error ! Failed to insert into USER_ING_LIST table.");
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Failed query : ".$query);
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, "Rolling back !");
					throw new Exception("Failed to insert into USER_ING_LIST table");
				}

				mysqli_commit($con);
				//submit list transaction ends here

				$response = array();

				$response['err_message'] = "List addedd successfully !";
				$response['isError'] = false;
				return json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				$response['err_message'] = "Something went wrong !";
				$response['isError'] = true;
				mysqli_rollback($con);				
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
				
	}
?>