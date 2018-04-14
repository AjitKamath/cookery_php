<?php
	class Save{

    public static function saveIgredient($ingredientname, $ingredientakaname, $img){
		   //check for null/empty
			if(!Util::check_for_null($ingredientname)){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient name");
					return;
			}
			if(!Util::check_for_null($ingredientakaname)){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient AKA name");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					// Check if category already exists
					$sql = "SELECT * from `INGREDIENT` WHERE `ING_NAME` = '$ingredientname'";
					$checkresult = mysqli_query($connection, $sql);
					$obj = $checkresult->fetch_object();
					if($obj->ING_NAME == $ingredientname){
							$data['message'] = "exists";
					}
					else
					{
						mysqli_begin_transaction($connection, MYSQLI_TRANS_START_READ_WRITE);
						mysqli_autocommit($connection, FALSE);
							//TODO:// Below is hardcoded image need to make it dynamic
							$ing_image = "app_data/master_data/ingredients/ginger.jpg";
							$ingquery = "INSERT INTO `INGREDIENT` (`ING_ID`,`ING_NAME`,`IMG`,`IS_REG`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$ingredientname','$ing_image','Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$ingquery);
							$ing_id = mysqli_insert_id($connection); 
							if($result){
								$ingredientquery = true;
							}
						
							$ingakaquery = "INSERT INTO `ING_AKA` (`ING_AKA_ID`,`ING_ID`,`ING_AKA_NAME`,`IMG`,`IS_REG`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$ing_id','$ingredientakaname','$ing_image' ,'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$ingakaquery);
							if($result){
								$ingredientakaquery = true;
							}
						
						if($ingredientquery == true && $ingredientakaquery == true)
						{
							mysqli_commit($connection);		
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
							Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
							mysqli_rollback($connection);
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					mysqli_rollback($connection);
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		
		 public static function saveFoodType($foodtypename, $img){
		   //check for null/empty
			if(!Util::check_for_null($foodtypename)){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food type name");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					// Check if category already exists
					$sql = "SELECT * from `FOOD_TYPE` WHERE `FOOD_TYP_NAME` = '$foodtypename'";
					$checkresult = mysqli_query($connection, $sql);
					$obj = $checkresult->fetch_object();
					if($obj->FOOD_TYP_NAME == $foodtypename){
							$data['message'] = "exists";
					}
					else
					{
							//TODO:// Below is hardcoded image need to make it dynamic
							$foodtype_image = "app_data/master_data/food_type/breakfast.jpg";
							$query = "INSERT INTO `FOOD_TYPE` (`FOOD_TYP_ID`,`FOOD_TYP_NAME`,`IMG`,`IS_DEF`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$foodtypename','$foodtype_image','N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$query);
							if($result){
							$data['message'] = "success";
							}
							else{
							$data['message'] = "failed";
							Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		 public static function saveFoodCuisine($foodcuisinename, $img){
		   //check for null/empty
			if(!Util::check_for_null($foodcuisinename)){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Cuisine name");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					// Check if category already exists
					$sql = "SELECT * from `FOOD_CUISINE` WHERE `FOOD_CSN_NAME` = '$foodcuisinename'";
					$checkresult = mysqli_query($connection, $sql);
					$obj = $checkresult->fetch_object();
					if($obj->FOOD_CSN_NAME == $foodcuisinename){
							$data['message'] = "exists";
					}
					else
					{
							//TODO:// Below is hardcoded image need to make it dynamic
							$foodtype_image = "app_data/master_data/cuisines/indian.jpg";
							$query = "INSERT INTO `FOOD_CUISINE` (`FOOD_CSN_ID`,`FOOD_CSN_NAME`,`IMG`,`IS_DEF`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$foodcuisinename','$foodtype_image','N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$query);
							if($result){
							$data['message'] = "success";
							}
							else{
							$data['message'] = "failed";
							Util::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Util::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		
		
		
    
   
	
		
		
	
 }
?>