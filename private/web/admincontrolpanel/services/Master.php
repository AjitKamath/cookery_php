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
    
    public static function fetchFoodCuisineDashboard(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNT FROM `FOOD_CUISINE`");
          $activeresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTACTIVE FROM `FOOD_CUISINE` WHERE IS_DEL = 'N'");
          $inactiveresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTINACTIVE FROM `FOOD_CUISINE` WHERE IS_DEL = 'Y'");
					$myArray = array();
        
          $row = $result->fetch_object();
          $activerow = $activeresult->fetch_object();
          $inactiverow = $inactiveresult->fetch_object();
 					
          $tempArray['totalcount'] = $row->TOTALCOUNT;
          $tempArray['activecount'] = $activerow->TOTALCOUNTACTIVE;
          $tempArray['inactivecount'] = $inactiverow->TOTALCOUNTINACTIVE;
          array_push($myArray, $tempArray);
          
					echo json_encode($myArray);
        
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function fetchFoodTypeDashboard(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNT FROM `FOOD_TYPE`");
          $activeresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTACTIVE FROM `FOOD_TYPE` WHERE IS_DEL = 'N'");
          $inactiveresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTINACTIVE FROM `FOOD_TYPE` WHERE IS_DEL = 'Y'");
					$myArray = array();
        
          $row = $result->fetch_object();
          $activerow = $activeresult->fetch_object();
          $inactiverow = $inactiveresult->fetch_object();
 					
          $tempArray['totalcount'] = $row->TOTALCOUNT;
          $tempArray['activecount'] = $activerow->TOTALCOUNTACTIVE;
          $tempArray['inactivecount'] = $inactiverow->TOTALCOUNTINACTIVE;
          array_push($myArray, $tempArray);
          
					echo json_encode($myArray);
        
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function fetchUsersDashboard(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNT FROM `ADMIN_USER`");
          $activeresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTACTIVE FROM `ADMIN_USER` WHERE IS_DEL = 'N'");
          $inactiveresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTINACTIVE FROM `ADMIN_USER` WHERE IS_DEL = 'Y'");
					$myArray = array();
        
          $row = $result->fetch_object();
          $activerow = $activeresult->fetch_object();
          $inactiverow = $inactiveresult->fetch_object();
 					
          $tempArray['totalcount'] = $row->TOTALCOUNT;
          $tempArray['activecount'] = $activerow->TOTALCOUNTACTIVE;
          $tempArray['inactivecount'] = $inactiverow->TOTALCOUNTINACTIVE;
          array_push($myArray, $tempArray);
          
					echo json_encode($myArray);
        
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
      
    public static function fetchIngredientsDashboard(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNT FROM `ING_AKA`");
          $activeresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTACTIVE FROM `ING_AKA` WHERE IS_DEL = 'N'");
          $inactiveresult = mysqli_query($connection,"SELECT count(*) AS TOTALCOUNTINACTIVE FROM `ING_AKA` WHERE IS_DEL = 'Y'");
					$myArray = array();
        
          $row = $result->fetch_object();
          $activerow = $activeresult->fetch_object();
          $inactiverow = $inactiveresult->fetch_object();
 					
          $tempArray['totalcount'] = $row->TOTALCOUNT;
          $tempArray['activecount'] = $activerow->TOTALCOUNTACTIVE;
          $tempArray['inactivecount'] = $inactiverow->TOTALCOUNTINACTIVE;
          array_push($myArray, $tempArray);
          
					echo json_encode($myArray);
        
				}catch(Exception $e){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
				}
				finally{
					DatabaseUtil::getInstance()->close_connection($connection);
				}
		}
    
    public static function setupMainDashboard(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT count(*) AS TOTALRECIPECOUNT FROM `RECIPE` WHERE IS_DEL = 'N'");
          $activeusers = mysqli_query($connection,"SELECT count(*) AS TOTALUSERCOUNT FROM `USER`");
          
          // IP's
          $ipcount = mysqli_query($connection, "SELECT CLNT_IP_ADD, COUNT(CLNT_IP_ADD) AS NUMS FROM AUDIT GROUP BY CLNT_IP_ADD ORDER BY NUMS DESC LIMIT 3");
          $iptotalcount = mysqli_query($connection, "SELECT COUNT(CLNT_IP_ADD) AS TOTALIPADDCOUNT FROM AUDIT");

          // COUNTRY
          $countrycount = mysqli_query($connection, "SELECT COUNTRY, COUNT(COUNTRY) AS NUMS FROM AUDIT GROUP BY COUNTRY ORDER BY NUMS DESC LIMIT 3");
          $countrytotalcount = mysqli_query($connection, "SELECT COUNT(COUNTRY) AS TOTALCOUNTRYCOUNT FROM AUDIT");

          // REGION
          $citycount = mysqli_query($connection, "SELECT CITY, COUNT(CITY) AS NUMS FROM AUDIT GROUP BY CITY ORDER BY NUMS DESC LIMIT 3");
          $citytotalcount = mysqli_query($connection, "SELECT COUNT(CITY) AS TOTALCITYCOUNT FROM AUDIT");

          // USERS LAST 24 HOURS
          $useronedaycount = mysqli_query($connection, "SELECT COUNT(*) AS ONEDAYCOUNT FROM USER WHERE CREATE_DTM >= NOW() - INTERVAL 1 DAY");

          // USERS LAST 7 DAYS
          $useroneweekcount = mysqli_query($connection, "SELECT COUNT(*) AS ONEWEEKCOUNT FROM USER WHERE CREATE_DTM >= NOW() - INTERVAL 7 DAY");

          // USERS LAST 30 DAYS
          $useronemonthcount = mysqli_query($connection, "SELECT COUNT(*) AS ONEMONTHCOUNT FROM USER WHERE CREATE_DTM >= NOW() - INTERVAL 30 DAY");
        
        
          $myArray = array();
          $IpArray = array();
          $CountryArray = array();
          $CityArray = array();
        
          $row = $result->fetch_object();
          $activerow = $activeusers->fetch_object();
         
          $temporaryArray['recipecount'] = $row->TOTALRECIPECOUNT;
          $temporaryArray['registercount'] = $activerow->TOTALUSERCOUNT;
          
        	while($row = $ipcount->fetch_object()) 
					{
             $tempArray['ipadd'] = $row->CLNT_IP_ADD;    
             $tempArray['ipaddcount'] = $row->NUMS;    
          
             array_push($IpArray, $tempArray);
          }
        
          $temporaryArray['ip'] = $IpArray;
        
          while($row = $countrycount->fetch_object()) 
					{
             $countrytempArray['area'] = $row->COUNTRY;    
             $countrytempArray['areacount'] = $row->NUMS;    
            
             array_push($CountryArray, $countrytempArray);
          }
        
          $temporaryArray['country'] = $CountryArray;
        
          while($row = $citycount->fetch_object()) 
					{
             $citytempArray['city'] = $row->CITY;    
             $citytempArray['citycount'] = $row->NUMS;    
              
             array_push($CityArray, $citytempArray);
          }
        
          $temporaryArray['city'] = $CityArray;
        
          $iptotal           = $iptotalcount->fetch_object();
          $countrytotal      = $countrytotalcount->fetch_object();
          $citytotal         = $citytotalcount->fetch_object();
          $useroneday        = $useronedaycount->fetch_object();
          $useroneweek       = $useroneweekcount->fetch_object();
          $useronemonth      = $useronemonthcount->fetch_object();
        
        
          $temporaryArray['ipaddtotalcount'] = $iptotal->TOTALIPADDCOUNT;
          $temporaryArray['areatotalcount'] = $countrytotal->TOTALCOUNTRYCOUNT;
          $temporaryArray['citytotalcount'] = $citytotal->TOTALCITYCOUNT;
        
          $temporaryArray['useronedaycount'] = $useroneday->ONEDAYCOUNT;
          $temporaryArray['useroneweekcount'] = $useroneweek->ONEWEEKCOUNT;
          $temporaryArray['useronemonthcount'] = $useronemonth->ONEMONTHCOUNT;
          
        
          array_push($myArray, $temporaryArray);
          
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
    
    public static function fetchIngCategory(){
			try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `ING_CATEGORIES`");
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
    
    
    public static function fetchNutCategory(){
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `NUTRITION_CATEGORIES`");
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
      
    public static function fetchIngByCategory($category){
			//check for null/empty
				if(!Utility::check_for_null($category)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty category");
						return;
				}
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$sql = "SELECT ING_AKA_ID, ING_AKA_NAME FROM `ING_AKA` 
          WHERE ING_ID IN
          (SELECT ING_ID FROM INGREDIENT WHERE ING_CAT_ID IN 
          (SELECT ING_CAT_ID FROM ING_CATEGORIES WHERE ING_CAT_ID = '$category'))";
        	$result = mysqli_query($connection,$sql);
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
    
    public static function fetchNutByCategory($category){
    //check for null/empty
      if(!Utility::check_for_null($category)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty category");
          return;
      }
    try{
        $connection = DatabaseUtil::getInstance()->open_connection();
        $sql = "SELECT NUT_ID, NUT_NAME FROM `NUTRITION` WHERE NUT_CAT_ID = '$category'";
        $result = mysqli_query($connection,$sql);
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
    
    
    public static function fetchUomByNut($category){
    //check for null/empty
      if(!Utility::check_for_null($category)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty category");
          return;
      }
    try{
        $connection = DatabaseUtil::getInstance()->open_connection();
        $sql = "SELECT UOM.NUT_UOM_ID, UOM.NUT_UOM_NAME FROM NUTRITION NUTRI INNER JOIN NUTRITION_UOM UOM ON NUTRI.NUT_UOM_ID = UOM.NUT_UOM_ID WHERE NUTRI.NUT_ID = '$category'";
        $result = mysqli_query($connection,$sql);
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
    
    public static function searchIngredient($ingredientname){
			 //check for null/empty
				if(!Utility::check_for_null($ingredientname)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Ingredient name");
						return;
				}
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `ING_AKA` WHERE ING_AKA_NAME LIKE '%$ingredientname%'");
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
    
    public static function searchUser($adminusername){
       //check for null/empty
				if(!Utility::check_for_null($adminusername)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty User name");
						return;
				}
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$result = mysqli_query($connection,"SELECT * from `ADMIN_USER` WHERE ADMIN_USER_NAME LIKE '%$adminusername%'");
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
    
    public static function searchFoodType($foodtypename){
       //check for null/empty
				if(!Utility::check_for_null($foodtypename)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food type name");
						return;
				}
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$sql = "SELECT * from `FOOD_TYPE` WHERE FOOD_TYP_NAME LIKE '%$foodtypename%'";
          $result = mysqli_query($connection, $sql);
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
    
    public static function searchFoodCuisine($foodcuisinesearch){
       //check for null/empty
				if(!Utility::check_for_null($foodcuisinesearch)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food cuisine name");
						return;
				}
      try{
					$connection = DatabaseUtil::getInstance()->open_connection();
					$sql = "SELECT * from `FOOD_CUISINE` WHERE FOOD_CSN_NAME LIKE '%$foodcuisinesearch%'";
          $result = mysqli_query($connection, $sql);
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
			 //check for null/empty
				if(!Utility::check_for_null($food_type_id)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food type id");
						return;
				}
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
			//check for null/empty
				if(!Utility::check_for_null($foodcsnid)){
						Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Food cuisine id");
						return;
				}
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
      //check for null/empty
      if(!Utility::check_for_null($ingid)){
          Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty Ingredient id");
          return;
      }
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
		
		
		
  }
?>