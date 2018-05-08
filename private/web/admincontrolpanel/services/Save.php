<?php
	class Save{

    public static function saveIngredient($ingredientname, $categoryid, $ingtagid)
    {
      Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", "Entered save ingredient");
		  //check user access
      if(!Utility::check_user_access(CREATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      } 
      //check for null/empty
			if(!Utility::check_for_null($ingredientname))
      {
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient name");
					return;
			}
      if(!Utility::check_for_null($categoryid))
      {
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty category id");
					return;
			}
      if(!Utility::check_for_null($ingtagid))
      {
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient tag id");
					return;
			}
     	try
      {
        $imagepath = Utility::uploadImage(INGREDIENT_IMAGE);
        if("EXISTS" == $imagepath)
        {
            Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Image already exists");
            $error = "IMAGE ALREADY EXISTS";
				    header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
            return;
        }
        else if(!Utility::check_for_null($imagepath))
        {
            Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed to upload Image");
            $error = "IMAGE UPLOAD FAILED";
				    header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
            return;
        }
        
        $imagepath = COMMON_IMG_UPLOAD_PATH.INGREDIENTS_DIR.$imagepath;
       
        $connection = DatabaseUtil::getInstance()->open_connection();
        // Check if category already exists
        $sql = "SELECT * from `ING_AKA` WHERE `ING_AKA_NAME` = '$ingredientname'";
        $checkresult = mysqli_query($connection, $sql);
        $obj = $checkresult->fetch_object();
        if($obj->ING_AKA_NAME == $ingredientname){
          // Display error message  
          $data['message'] = "INGREDIENT EXISTS ALREADY";
          $error = "INGREDIENT EXISTS ALREADY";
				  header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
          return;
        }
        else
        {
          mysqli_begin_transaction($connection, MYSQLI_TRANS_START_READ_WRITE);
          mysqli_autocommit($connection, FALSE);
            $ingquery = "INSERT INTO `INGREDIENT` (`ING_ID`,`ING_CAT_ID`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$categoryid', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
            $result = mysqli_query($connection,$ingquery);
            $ing_id = mysqli_insert_id($connection); 
            if(!$result){
              $data['message'] = "failed";
              $error = "ERROR OCCURED";
				      header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $ingquery " . mysqli_error($connection));
              mysqli_rollback($connection);
              return;
            }

            $ingakaquery = "INSERT INTO `ING_AKA` (`ING_AKA_ID`,`ING_ID`,`ING_AKA_NAME`,`SOURCE`,`IS_REG`,`IS_DEL`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$ingtagid','$ingredientname','NULL','Y','N',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
            $result = mysqli_query($connection,$ingakaquery);
            if(!$result){
              $data['message'] = "failed";
              $error = "ERROR OCCURED";
				      header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $ingakaquery " . mysqli_error($connection));
              mysqli_rollback($connection);
              return;
            }
          
          
            Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $imagepath);
            $ingimagequery = "INSERT INTO `ING_IMAGES` (`ING_IMG_ID`,`ING_ID`,`ING_IMG`,`IS_DEF`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$ing_id','$imagepath','N',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
            Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $ingimagequery);
            $result = mysqli_query($connection,$ingakaquery);
            if(!$result){
              $data['message'] = "failed";
              $error = "ERROR OCCURED";
				      header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $ingimagequery " . mysqli_error($connection));
              mysqli_rollback($connection);
              return;
            }
        }
 				
        $error = "INGREDIENT ADDED SUCCESSFULLY";
				header("Location:/private/web/admincontrolpanel/web/pages/manageingredient.php?msg=".$error);
			}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					mysqli_rollback($connection);
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function saveFoodType($foodtypename){
		  //check user access
      if(!Utility::check_user_access(CREATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      } 
      //check for null/empty
			if(!Utility::check_for_null($foodtypename)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food type name");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					// Check if category already exists
					$sql = "SELECT * from `FOOD_TYPE` WHERE `FOOD_TYP_NAME` = '$foodtypename'";
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $sql); 
					$checkresult = mysqli_query($connection, $sql);
					$obj = $checkresult->fetch_object();
					if($obj->FOOD_TYP_NAME == $foodtypename){
							$data['message'] = "exists";
              $error = "FOOD TYPE EXISTS ALREADY";
              header("Location:/private/web/admincontrolpanel/web/pages/managefoodtype.php?msg=".$error);
              return;
					}
					else
					{
             $imagepath = Utility::uploadImage(FOOD_TYPE_IMAGE);
            if("EXISTS" == $imagepath)
            {
                Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Image already exists");
                $error = "IMAGE ALREADY EXISTS";
                header("Location:/private/web/admincontrolpanel/web/pages/managefoodtype.php?msg=".$error);
                return;
            }
            else if(!Utility::check_for_null($imagepath))
            {
                Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed to upload Image");
                $error = "IMAGE UPLOAD FAILED";
                header("Location:/private/web/admincontrolpanel/web/pages/managefoodtype.php?msg=".$error);
                return;
            }
            
              $imagepath = COMMON_IMG_UPLOAD_PATH.FOOD_TYPE_DIR.$imagepath;
						
							$query = "INSERT INTO `FOOD_TYPE` (`FOOD_TYP_ID`,`FOOD_TYP_NAME`,`IMG`,`IS_DEF`,`IS_DEL`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$foodtypename','$imagepath','N','N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$query);
							if($result){
							$data['message'] = "success";
							}
							else{
							$data['message'] = "failed";
							Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
              $error = "ERROR OCCURED";
              header("Location:/private/web/admincontrolpanel/web/pages/managefoodtype.php?msg=".$error);          
              return;
						}
					}
 					echo json_encode($data);
         $error = "FOOD TYPE ADDED SUCCESSFULLY";
         header("Location:/private/web/admincontrolpanel/web/pages/managefoodtype.php?msg=".$error);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
		public static function saveFoodCuisine($foodcuisinename){
		  //check user access
      if(!Utility::check_user_access(CREATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
			if(!Utility::check_for_null($foodcuisinename)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Cuisine name");
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
              $error = "FOOD CUISINE EXISTS ALREADY";
              header("Location:/private/web/admincontrolpanel/web/pages/managefoodcuisine.php?msg=".$error);
              return;
					}
					else
					{
             $imagepath = Utility::uploadImage(FOOD_CUISINE_IMAGE);
              if("EXISTS" == $imagepath)
              {
                  Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Image already exists");
                  $error = "IMAGE ALREADY EXISTS";
                  header("Location:/private/web/admincontrolpanel/web/pages/managefoodcuisine.php?msg=".$error);
                  return;
              }
              else if(!Utility::check_for_null($imagepath))
              {
                  Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed to upload Image");
                  $error = "IMAGE UPLOAD FAILED";
                  header("Location:/private/web/admincontrolpanel/web/pages/managefoodcuisine.php?msg=".$error);
                  return;
              }
            
              $imagepath = COMMON_IMG_UPLOAD_PATH.CUISINES_DIR.$imagepath;
            
							//TODO:// Below is hardcoded image need to make it dynamic
							$foodtype_image = "app_data/master_data/cuisines/indian.jpg";
							$query = "INSERT INTO `FOOD_CUISINE` (`FOOD_CSN_ID`,`FOOD_CSN_NAME`,`IMG`,`IS_DEF`,`IS_DEL`,`CREATE_DTM`,`MOD_DTM`) values(NULL,'$foodcuisinename','$imagepath','N','N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
							$result = mysqli_query($connection,$query);
							if($result){
							$data['message'] = "success";
							}
							else{
							$data['message'] = "failed";
							Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Could not able to execute $query " . mysqli_error($connection));
              $error = "ERROR OCCURED";
              header("Location:/private/web/admincontrolpanel/web/pages/managefoodcuisine.php?msg=".$error);
              return;
						}
					}
 					echo json_encode($data);
          $error = "FOOD CUISINE ADDED SUCCESSFULLY";
         header("Location:/private/web/admincontrolpanel/web/pages/managefoodcuisine.php?msg=".$error);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
    public static function multipleFoodTypeDelete($foodtypeids){
		  //check user access
      if(!Utility::check_user_access(DELETE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
			if(!Utility::check_for_null($foodtypeids)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty food type id");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					foreach($foodtypeids as $foodtypeid)
					{
						$result = mysqli_query($connection,"UPDATE `FOOD_TYPE` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `FOOD_TYP_ID` = '$foodtypeid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function multipleFoodCuisineDelete($foodcuisineids){
		  //check user access
      if(!Utility::check_user_access(DELETE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      } 
      //check for null/empty
			if(!Utility::check_for_null($foodcuisineids)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty food cuisine id");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					foreach($foodcuisineids as $foodcuisineid)
					{
						$result = mysqli_query($connection,"UPDATE `FOOD_CUISINE` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `FOOD_CSN_ID` = '$foodcuisineid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
		
    public static function multipleIngredientDelete($ingids){
		  //check user access
      if(!Utility::check_user_access(DELETE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
			if(!Utility::check_for_null($ingids)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient id");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					foreach($ingids as $ingid)
					{
						$result = mysqli_query($connection,"UPDATE `ING_AKA` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `ING_ID` = '$ingid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function multipleUserDelete($userids){
      //check user access
      if(!Utility::check_user_access(DELETE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
			if(!Utility::check_for_null($userids)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty User id");
					return;
			}
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					foreach($userids as $userid)
					{
						$result = mysqli_query($connection,"UPDATE `ADMIN_USER` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `ADMIN_USER_ID` = '$userid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
					}
 					echo json_encode($data);
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
    }
    
    public static function deleteIngredient($ingid){
        //check user access
        if(!Utility::check_user_access(DELETE))
        {
            $data['message'] = "ACCESS DENIED";
            echo json_encode($data);
            return;
        } 
        //check for null/empty
				if(!Utility::check_for_null($ingid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty ingredient id");
						return;
				}
				try{
						$connection = DatabaseUtil::getInstance()->open_connection();
						$result = mysqli_query($connection,"UPDATE `ING_AKA` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `ING_ID` = '$ingid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
						echo json_encode($data);
					}catch(Exception $e){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
						DatabaseUtil::getInstance()->close_connection($connection);
					}
		}
		
		public static function deleteFoodCuisine($foodcuisineid){
        //check user access
        if(!Utility::check_user_access(DELETE))
        {
            $data['message'] = "ACCESS DENIED";
            echo json_encode($data);
            return;
        } 
        //check for null/empty
				if(!Utility::check_for_null($foodcuisineid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty food cuisine id");
						return;
				}
				try{
						$connection = DatabaseUtil::getInstance()->open_connection();
						$result = mysqli_query($connection,"UPDATE `FOOD_CUISINE` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `FOOD_CSN_ID` = '$foodcuisineid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
						echo json_encode($data);
					}catch(Exception $e){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
						DatabaseUtil::getInstance()->close_connection($connection);
					}
		}
    
    public static function deleteAdminUser($userid){
        //check user access
        if(!Utility::check_user_access(DELETE))
        {
            $data['message'] = "ACCESS DENIED";
            echo json_encode($data);
            return;
        } 
        //check for null/empty
				if(!Utility::check_for_null($userid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
						return;
				}
				try{
						$connection = DatabaseUtil::getInstance()->open_connection();
						$result = mysqli_query($connection,"UPDATE `ADMIN_USER` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `ADMIN_USER_ID` = '$userid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
						echo json_encode($data);
					}catch(Exception $e){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
						DatabaseUtil::getInstance()->close_connection($connection);
					}
		}
    
    public static function deleteFoodType($foodtypeid){
        //check user access
        if(!Utility::check_user_access(DELETE))
        {
            $data['message'] = "ACCESS DENIED";
            echo json_encode($data);
            return;
        }
        //check for null/empty
				if(!Utility::check_for_null($foodtypeid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food type id");
						return;
				}
				try{
						$connection = DatabaseUtil::getInstance()->open_connection();
						$result = mysqli_query($connection,"UPDATE `FOOD_TYPE` SET `IS_DEL` = 'Y',`MOD_DTM` = CURRENT_TIMESTAMP WHERE `FOOD_TYP_ID` = '$foodtypeid'");
						if($result){
							$data['message'] = "success";
						}
						else{
							$data['message'] = "failed";
						}
						echo json_encode($data);
					}catch(Exception $e){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
					}
					finally{
						DatabaseUtil::getInstance()->close_connection($connection);
					}
		}
    
    public static function updateIngredient($ingid, $ingredientname, $ingredientakaname){
		  //check user access
      if(!Utility::check_user_access(UPDATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
      if(!Utility::check_for_null($ingid)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Ingredient id");
          return;
      }
       //check for null/empty
      if(!Utility::check_for_null($ingredientname)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Ingredient name");
          return;
      }
       //check for null/empty
      if(!Utility::check_for_null($ingredientakaname)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Ingredient AKA name");
          return;
      }
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
      //check user access
      if(!Utility::check_user_access(UPDATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
      if(!Utility::check_for_null($foodtypeid)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Type id");
          return;
      }
      if(!Utility::check_for_null($foodtypename)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Type name");
          return;
      }
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$sql = "UPDATE `FOOD_TYPE` SET FOOD_TYP_NAME='$foodtypename' WHERE FOOD_TYP_ID = '$foodtypeid'";
          $result = mysqli_query($connection,$sql);
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
			//check user access
      if(!Utility::check_user_access(UPDATE))
      {
        	$data['message'] = "ACCESS DENIED";
          echo json_encode($data);
          return;
      }
      //check for null/empty
      if(!Utility::check_for_null($foodcsnid)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Cuisine id");
          return;
      }
      if(!Utility::check_for_null($foodcuisinename)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food Cuisine name");
          return;
      }
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