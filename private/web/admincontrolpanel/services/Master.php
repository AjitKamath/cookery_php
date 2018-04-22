<?php
	class Master{
		
		public static function fetchIngredients(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `INGREDIENT` ING INNER JOIN `ING_AKA` AKA ON ING.ING_ID = AKA.ING_ID ORDER BY ING.ING_ID DESC");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
    public static function AdminfetchUsers(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `ADMIN_USER` WHERE IS_DEL = 'N' ORDER BY ADMIN_USER_ID DESC");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function fetchFoodType(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `FOOD_TYPE` ORDER BY FOOD_TYP_ID DESC");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		
		public static function fetchFoodCuisine(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `FOOD_CUISINE` ORDER BY FOOD_CSN_ID DESC");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function filterFoodType($food_type_id){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `FOOD_TYPE` WHERE FOOD_TYP_ID = '$food_type_id'");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
			public static function filterFoodCuisine($foodcsnid){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `FOOD_CUISINE` WHERE FOOD_CSN_ID = '$foodcsnid'");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
			public static function filterIngredient($ingid){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `INGREDIENT` ING INNER JOIN `ING_AKA` AKA ON ING.ING_ID = AKA.ING_ID WHERE ING.ING_ID = '$ingid'");
					$myArray = array();
 					while($row = $result->fetch_object()) 
					{
             $tempArray = $row;
             array_push($myArray, $tempArray);
          }
        	
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		
		public static function updateIngredient($ingid, $ingredientname, $ingredientakaname){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"UPDATE `INGREDIENT` SET ING_NAME='$ingredientname' WHERE ING_ID = '$ingid'");
					$resultaka = mysqli_query($connection,"UPDATE `ING_AKA` SET ING_AKA_NAME='$ingredientakaname' WHERE ING_ID = '$ingid'");
					if($result && $resultaka)
					{
						$data['message'] = "success";
					}
					else
					{
						$data['message'] = "failed";
					}
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function updateFoodType($foodtypeid, $foodtypename){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"UPDATE `FOOD_TYPE` SET FOOD_TYP_NAME='$foodtypename' WHERE FOOD_TYP_ID = '$foodtypeid'");
					if($result)
					{
						$data['message'] = "success";
					}
					else
					{
						$data['message'] = "failed";
					}
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function updateFoodCuisine($foodcsnid, $foodcuisinename){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"UPDATE `FOOD_CUISINE` SET FOOD_CSN_NAME='$foodcuisinename' WHERE FOOD_CSN_ID = '$foodcsnid'");
					if($result)
					{
						$data['message'] = "success";
					}
					else
					{
						$data['message'] = "failed";
					}
					echo json_encode($myArray);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
  
  }
?>