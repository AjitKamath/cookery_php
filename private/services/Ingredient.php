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

				$query = "SELECT ING_ID, ING_NAME, IMG 
							FROM `INGREDIENT` 
							WHERE ING_NAME LIKE '%$searchQuery%'
							AND IS_REG = 'Y'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['ING_ID'] = $result_data->ING_ID;
					$temp_array['ING_NAME'] = $result_data->ING_NAME;
					$temp_array['IMG'] = $result_data->IMG;
					
					array_push($result_array, $temp_array);
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
		
	
	public static function checkUserLists($user_id)
	{
			//request start
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
      //request ends

       //check for null/empty start
			 if(!Util::check_for_null($user_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
					return;
       }
		
			try{
				$con = DatabaseUtil::getInstance()->open_connection();			
				
				$query = "Select * FROM `USER_ING_LIST` WHERE USER_ID = '$user_id'";			
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) 
				{
					$subquery = "Select count(ING_ID) AS ITEMS FROM `USER_ING_LIST_ITEM` WHERE USER_ING_LIST_ID = '$result_data->USER_ING_LIST_ID'";			
					$subresult = mysqli_query($con, $subquery);
					while($subresult_data = $subresult->fetch_object()) 
					{
						$data['LIST_ID'] = $result_data->USER_ING_LIST_ID;
						$data['LIST_NAME'] = $result_data->ING_LIST_NAME;
						$data['ITEM_COUNT'] = $subresult_data->ITEMS;	
					}
				
				array_push($result_array, $data);
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
		
	public static function viewuserIngedrientList($list_id)
	{
			//request start
		LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : listid(".$list_id.") for list_id(".$list_id.")");
		//request ends
		
		 //check for null/empty start
			
		if(!Util::check_for_null($list_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty list_id");
					return;
			 }
			
			 //check for null/empty ends
	
		try
			{
				$con = DatabaseUtil::getInstance()->open_connection();
								
					$query = "SELECT * FROM USER_ING_LIST UIL INNER JOIN USER_ING_LIST_ITEM UILI ON UIL.USER_ING_LIST_ID = UILI.USER_ING_LIST_ID
										INNER JOIN INGREDIENT ING ON UILI.ING_ID = ING.ING_ID 
										WHERE UIL.USER_ING_LIST_ID = '$list_id'";			
					$result = mysqli_query($con, $query);

					$result_array = array();
					while($result_data = $result->fetch_object()) 
					{
						$data['LIST_ID'] = $result_data->USER_ING_LIST_ID;
						$data['LIST_NAME'] = $result_data->ING_LIST_NAME;
						$data['ING_ID'] = $result_data->ING_ID;	
						$data['ING_NAME'] = $result_data->ING_NAME;	
						$data['IS_CHECKED'] = $result_data->IS_CHECKED;	
						
						array_push($result_array, $data);
					}
				echo json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				mysqli_rollback($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
	}
		
	public static function updateUserIngedrientList($list_id, $list_name, $user_id, $listofingredients, $nameofingredients)
	{
			//request start
		LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : listid(".$list_id.") for list_id(".$list_id.")");
		
		
			for($i = 0; $i< count($listofingredients); $i++)
			{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : ingredientlist(".$listofingredients[$i].") for user_id(".$user_id.")");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : ingredientlistcheck(".$nameofingredients[$i].") for user_id(".$user_id.")");
			}
			
		//request ends
		
		 //check for null/empty start
			
		if(!Util::check_for_null($list_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty list_id");
					return;
			 }
		
				if(!Util::check_for_null($list_name))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty list_name");
					return;
			 }
		
				if(!Util::check_for_null($user_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
					return;
			 }
			
			 if(count($listofingredients)<0)
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty listofingredients");
					return;
			}
	   
	    if(count($nameofingredients)<0)
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty listofingredientscheck");
					return;
			}
		//check for null/empty ends
			 
	
		try
			{
				$con = DatabaseUtil::getInstance()->open_connection();
				//transaction begins here
				mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
				mysqli_autocommit($con, FALSE);
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Transaction begin for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
					$query = "DELETE FROM USER_ING_LIST_ITEM WHERE USER_ING_LIST_ID = '$list_id'";
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "List ID(".$list_id.") deleted from USER_ING_LIST_ITEM table");
					$result = mysqli_query($con, $query);
					if($result)
					{
						$subquery = "UPDATE `USER_ING_LIST` SET `ING_LIST_NAME` = '$list_name' WHERE `USER_ING_LIST_ID` = '$list_id' ";
						if(mysqli_query($con, $subquery))
						{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "List(".$list_id.") updated list name as (".$list_name.") into USER_ING_LIST_ID table");
						}
						else
						{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "List(".$list_id.") failed to update list name as (".$list_name.") into USER_ING_LIST_ID table");
						}
						
					for($i = 0; $i< count($listofingredients); $i++)
							{
								if($listofingredients[$i] == 0)
								{
									$query = "INSERT INTO `INGREDIENT` (`ING_NAME` , `CREATE_DTM`) VALUES ('$nameofingredients[$i]' , CURRENT_TIMESTAMP)";
									if(mysqli_query($con, $query))
									{
										$listofingredients[$i] = mysqli_insert_id($con); 
										LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$listofingredients[$i].") added into INGREDIENT table");
									}					
								}
								$subquery = "INSERT INTO `USER_ING_LIST_ITEM` (ING_ID, USER_ING_LIST_ID, IS_CHECKED,
												CREATE_DTM, MOD_DTM) VALUES ('$listofingredients[$i]', '$list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
								if(mysqli_query($con, $subquery))
								{
												LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "List(".$list_id.") updated into USER_ING_LIST_ITEM table");
								}
								else
								{
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$query);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$subquery);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Rolling back !");
									throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
								}
							}
					}
								mysqli_commit($con);
					//transaction ends here
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Transaction completed for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
					$response = array();
					
					$response['err_message'] = "List updated successfully !";
					$response['isError'] = false;
				echo json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Transaction failed for List ID(".$list_id.") in USER_ING_LIST_ITEM table");
				$response['err_message'] = "Something went wrong !";
				$response['isError'] = true;
				mysqli_rollback($con);				
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Rolling Back..");
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
	}
		public static function updateUserIngedrientListFromRecipe($list_id, $ing_id)
		{
			//request start
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : listid(".$list_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : ingredientid(".$ing_id.")");
			
			//request ends
			
			//check for null/empty starts
			if(!Util::check_for_null($list_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty list_id");
					return;
			 }
			
			 if(!Util::check_for_null($ing_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ing_id");
					return;
			 }
			
			 //check for null/empty ends
			
			try
			{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				
					$query = "INSERT INTO `USER_ING_LIST_ITEM` (ING_ID, USER_ING_LIST_ID, IS_CHECKED,
												CREATE_DTM, MOD_DTM) VALUES ('$ing_id', '$list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
					if(mysqli_query($con, $query))
					{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$ing_id.") in List(".$list_id.") added into USER_ING_LIST_ITEM table");
					}
					else
					{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$query);
						throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
					}
						
					$response = array();
					
					$response['err_message'] = "Ingedient added successfully in your List!";
					$response['isError'] = false;
				echo json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				$response['err_message'] = "Something went wrong !";
				$response['isError'] = true;
				mysqli_rollback($con);				
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
			
		public static function saveuserIngedrientList($list_name, $user_id, $listofingredients, $nameofingredients)
		{
			//request start
			for($i = 0; $i< count($listofingredients); $i++)
			{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : ingredientlist(".$listofingredients[$i].") for user_id(".$user_id.")");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : ingredientlist(".$nameofingredients[$i].") for user_id(".$user_id.")");
			}
			//request ends

       //check for null/empty start
			 if(count($listofingredients)<0)
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty listofingredients");
					return;
       }
		
			if(count($nameofingredients)<0)
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty nameofingredients");
					return;
       }
		
			 if(!Util::check_for_null($user_id))
			 {
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
					return;
			 }
			
			 //check for null/empty ends
			
			try
			{
				$con = DatabaseUtil::getInstance()->open_connection();
				//submit list transaction begins here
				mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
				mysqli_autocommit($con, FALSE);
				
					$query = "INSERT INTO `USER_ING_LIST` (ING_LIST_NAME, USER_ID, IS_DEL,
										CREATE_DTM, MOD_DTM) VALUES ('$list_name', '$user_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
					if(mysqli_query($con, $query))
					{
							$temp_list_id = mysqli_insert_id($con); 
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "List(".$temp_list_id.") added into USER_ING_LIST table");
						
							for($i = 0; $i< count($listofingredients); $i++)
							{
								if($listofingredients[$i] == 0)
								{
									$query = "INSERT INTO `INGREDIENT` (`ING_NAME` , `CREATE_DTM`) VALUES ('$nameofingredients[$i]' , CURRENT_TIMESTAMP)";
									if(mysqli_query($con, $query))
									{
										$listofingredients[$i] = mysqli_insert_id($con); 
										LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$listofingredients[$i].") added into INGREDIENT table");
									}					
								}
								$subquery = "INSERT INTO `USER_ING_LIST_ITEM` (ING_ID, USER_ING_LIST_ID, IS_CHECKED,
												CREATE_DTM, MOD_DTM) VALUES ('$listofingredients[$i]', '$temp_list_id', 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";			
								if(mysqli_query($con, $subquery))
								{
												LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "List(".$temp_list_id.") added into USER_ING_LIST_ITEM table");
								}
								else
								{
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Failed to insert into USER_ING_LIST_ITEM table.");
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$query);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$subquery);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Rolling back !");
									throw new Exception("Failed to insert into USER_ING_LIST_ITEM table");
								}
							}
					}
					else
					{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Failed to insert into USER_ING_LIST table.");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed query : ".$query);
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Rolling back !");
						throw new Exception("Failed to insert into USER_ING_LIST table");
					}
				
				
				mysqli_commit($con);
				//submit list transaction ends here
				
					$response = array();
					
					$response['err_message'] = "List addedd successfully !";
					$response['isError'] = false;
				echo json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
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