 <?php
	// Web controller
	include_once('importutil.php');

	/*Directories that contain classes*/
	$classesDir = array (SERVICES, APP_CONFIG);

	function __autoload($class_name) {
			global $classesDir;
			foreach ($classesDir as $directory) {
					if (file_exists($directory . $class_name . '.php')) {
							require_once ($directory . $class_name . '.php');
							return;
					}
			}
	}

	//function key
	$function_key = isset($_POST['function_key']) ? $_POST['function_key'] : $_GET['function_key'];
	
	//check for null/empty
	if(!Utility::check_for_null($function_key)){
		Utility::logger(__FILE__, "Controller", __LINE__, "E", "Error ! null/empty function_key");
		return;
	}
	//check for null/empty
	
	//params
	$username 						= isset($_POST['username']) ? $_POST['username'] : '';
	$password 						= isset($_POST['password']) ? $_POST['password'] : '';

	$adminusername 				= isset($_GET['adminusername']) ? $_GET['adminusername'] : '';
	$adminpassword 				= isset($_GET['adminuserpassword']) ? $_GET['adminuserpassword'] : '';

	$ingredientname 			= isset($_GET['ing_name']) ? $_GET['ing_name'] : '';
  $ingname         			= isset($_POST['ing_name']) ? $_POST['ing_name'] : '';
  $categoryid      			= isset($_POST['category']) ? $_POST['category'] : '';
  $ingtagid        			= isset($_POST['availableingredientsunderselectedcategory']) ? $_POST['availableingredientsunderselectedcategory'] : '';
	$ingredientakaname 		= isset($_GET['ing_aka_name']) ? $_GET['ing_aka_name'] : '';
	$foodtypename			 		= isset($_GET['food_type_name']) ? $_GET['food_type_name'] : '';
  $foodtypenameadd	 		= isset($_POST['food_type_name']) ? $_POST['food_type_name'] : '';
  $foodcuisine    	 		= isset($_POST['cuisine_name']) ? $_POST['cuisine_name'] : '';
  $nutcategory 		      = isset($_POST['nutcategory']) ? $_POST['nutcategory'] : '';
  $nut 		              = isset($_POST['nut']) ? $_POST['nut'] : '';
  $nutuom     		      = isset($_POST['nutuom']) ? $_POST['nutuom'] : '';
  $nutval 	    	      = isset($_POST['nutval']) ? $_POST['nutval'] : '';


  // will be depcrecated
  $foodtypenamesearch		= isset($_GET['foodtypename']) ? $_GET['foodtypename'] : '';
	$foodcuisinename	 		= isset($_GET['food_cuisine_name']) ? $_GET['food_cuisine_name'] : '';
  $foodcuisinesearch		= isset($_GET['food_csn_name_search']) ? $_GET['food_csn_name_search'] : '';
	$foodtypeid				 		= isset($_GET['foodtypeid']) ? $_GET['foodtypeid'] : '';
	$foodcsnid				 		= isset($_GET['foodcsnid']) ? $_GET['foodcsnid'] : '';
	$ingid				 				= isset($_GET['ingid']) ? $_GET['ingid'] : '';
  $ingids			 		  		= isset($_GET['ingids']) ? $_GET['ingids'] : '';
  $foodcuisineids				= isset($_GET['foodcuisineids']) ? $_GET['foodcuisineids'] : '';
  $foodtypeids	  			= isset($_GET['foodtypeids']) ? $_GET['foodtypeids'] : '';
  $userids	  	    		= isset($_GET['$userids']) ? $_GET['$userids'] : '';
  $category     	  		= isset($_GET['category']) ? $_GET['category'] : '';
  
  $role       				  = isset($_GET['role']) ? $_GET['role'] : '';
  $mobile     				  = isset($_GET['mobile']) ? $_GET['mobile'] : '';
  $email      				  = isset($_GET['email']) ? $_GET['email'] : '';
  $userid      				  = isset($_GET['userid']) ? $_GET['userid'] : '';
  

  Utility::logger(__FILE__, "controller", __LINE__, "I", "=====>".$function_key);

	if(AUTHENTICATE_USER == $function_key){
		echo User::authenticateUser($username, $password);
	}
	else if(SHOW_ALL_USERS == $function_key){
		echo User::showAllUsers();
	}
	else if(SAVE_INGREDIENT == $function_key){
		echo Save::saveIngredient($ingname, $categoryid, $ingtagid, $nutcategory, $nut, $nutuom, $nutval);
	}
	else if(SAVE_FOOD_TYPE == $function_key){
		echo Save::saveFoodType($foodtypenameadd);
	}
	else if(SAVE_FOOD_CUISINE == $function_key){
		echo Save::saveFoodCuisine($foodcuisine);
	}
	else if(FETCH_INGREDIENTS == $function_key){
		echo Master::fetchIngredients();
	}
	else if(FETCH_FOOD_CUISINE == $function_key){
		echo Master::fetchFoodCuisine();
	}
	else if(FETCH_FOOD_TYPE == $function_key){
		echo Master::fetchFoodType();
	}
	else if(ADMIN_FETCH_USERS == $function_key){
		echo Master::AdminfetchUsers();
	}
	else if(EDIT_FOOD_TYPE == $function_key){
		echo Master::filterFoodType($foodtypeid);
	}
	else if(EDIT_FOOD_CUISINE == $function_key){
		echo Master::filterFoodCuisine($foodcsnid);
	}
	else if(EDIT_INGREDIENT == $function_key){
		echo Master::filterIngredient($ingid);
	}
	else if(UPDATE_INGREDIENTS == $function_key){
		echo Save::updateIngredient($ingid, $ingredientname, $ingredientakaname);
	}
	else if(UPDATE_FOOD_TYPE == $function_key){
		echo Save::updateFoodType($foodtypeid, $foodtypename);
	}
	else if(UPDATE_FOOD_CUISINE == $function_key){
		echo Save::updateFoodCuisine($foodcsnid, $foodcuisinename);
	}
  else if(MULTI_FOOD_CUISINE_DELETE == $function_key){
		echo Save::multipleFoodCuisineDelete($foodcuisineids);
	}
  else if(MULTI_FOOD_TYPE_DELETE == $function_key){
		echo Save::multipleFoodTypeDelete($foodtypeids);
	}
  else if(MULTI_INGREDIENT_DELETE == $function_key){
		echo Save::multipleIngredientDelete($ingids);
	}
  else if(DELETE_FOOD_CUISINE == $function_key){
		echo Save::deleteFoodCuisine($foodcsnid);
	}
  else if(DELETE_FOOD_TYPE == $function_key){
		echo Save::deleteFoodType($foodtypeid);
	}
  else if(DELETE_INGREDIENT == $function_key){
		echo Save::deleteIngredient($ingid);
	}
  else if(DELETE_ADMIN_USER == $function_key){
		echo Save::deleteAdminUser($userid);
	}
  else if(LOGOUT == $function_key){
		echo User::logout();
	}
  else if(ADMIN_SAVE_USER == $function_key){
		echo User::adminSaveUser($adminusername, $adminpassword, $role, $mobile, $email);
	}
  else if(UPDATE_ADMIN_USER_ROLE == $function_key){
		echo User::updateAdminUserRole($userid, $role);
	}
  else if(SETUP_FOOD_CUISINE_DASHBOARD == $function_key){
		echo Master::fetchFoodCuisineDashboard();
	}
  else if(SETUP_FOOD_TYPE_DASHBOARD == $function_key){
		echo Master::fetchFoodTypeDashboard();
	}
  else if(SETUP_INGREDIENTS_DASHBOARD == $function_key){
		echo Master::fetchIngredientsDashboard();
	}
  else if(SETUP_USERS_DASHBOARD == $function_key){
		echo Master::fetchUsersDashboard();
	}
  else if(SEARCH_FOOD_TYPE == $function_key){
		echo Master::searchFoodType($foodtypenamesearch);
	}
  else if(SEARCH_FOOD_CUISINE == $function_key){
		echo Master::searchFoodCuisine($foodcuisinesearch);
	}
  else if(SETUP_MAIN_DASHBOARD == $function_key){
		echo Master::setupMainDashboard();
	}
  else if(FETCH_ING_CATEGORY == $function_key){
		echo Master::fetchIngCategory();
	}
  else if(FETCH_NUT_CATEGORY == $function_key){
		echo Master::fetchNutCategory();
	}
  else if(FETCH_ING_BY_CATEGORY == $function_key){
		echo Master::fetchIngByCategory($category);
	}
  else if(FETCH_NUT_BY_CATEGORY == $function_key){
		echo Master::fetchNutByCategory($category);
	}
  else if(FETCH_UOM_BY_NUT == $function_key){
		echo Master::fetchUomByNut($category);
	}
  else if(SEARCH_INGRIDIENTS == $function_key){
		echo Master::searchIngredient($ingredientname);
	}
  else if(SEARCH_USER == $function_key){
		echo Master::searchUser($adminusername);
	}
  else if(MULTI_ADMIN_USER_DELETE == $function_key){
    echo Save::multipleUserDelete($userids);
	}











 ?>
    