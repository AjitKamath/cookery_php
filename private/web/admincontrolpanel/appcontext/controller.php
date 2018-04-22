 <?php
	// Web controller
	include_once($_SERVER['DOCUMENT_ROOT'].'/private/web/admincontrolpanel/appcontext/importutil.php');
	// App controller
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	/*Directories that contain classes*/
	$classesDir = array (
			$_SERVER['DOCUMENT_ROOT'].'/private/web/admincontrolpanel/services/',
			$_SERVER['DOCUMENT_ROOT'].'/private/services/',
			$_SERVER['DOCUMENT_ROOT'].'/private/util/'
	);
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

	$adminusername 						= isset($_GET['adminusername']) ? $_GET['adminusername'] : '';
	$adminpassword 						= isset($_GET['adminuserpassword']) ? $_GET['adminuserpassword'] : '';

	$ingredientname 			= isset($_GET['ing_name']) ? $_GET['ing_name'] : '';
	$ingredientakaname 		= isset($_GET['ing_aka_name']) ? $_GET['ing_aka_name'] : '';
	$foodtypename			 		= isset($_GET['food_type_name']) ? $_GET['food_type_name'] : '';
	$foodcuisinename	 		= isset($_GET['food_cuisine_name']) ? $_GET['food_cuisine_name'] : '';
	$foodtypeid				 		= isset($_GET['foodtypeid']) ? $_GET['foodtypeid'] : '';
	$foodcsnid				 		= isset($_GET['foodcsnid']) ? $_GET['foodcsnid'] : '';
	$ingid				 				= isset($_GET['ingid']) ? $_GET['ingid'] : '';
  $ingids			 		  		= isset($_GET['ingids']) ? $_GET['ingids'] : '';
  $foodcuisineids				= isset($_GET['foodcuisineids']) ? $_GET['foodcuisineids'] : '';
  
  $role       				  = isset($_GET['role']) ? $_GET['role'] : '';
  $mobile     				  = isset($_GET['mobile']) ? $_GET['mobile'] : '';
  $email      				  = isset($_GET['email']) ? $_GET['email'] : '';
  $userid      				  = isset($_GET['userid']) ? $_GET['userid'] : '';



	$img = "IMG_TO_BE_UPLOADED";
		
  Utility::logger(__FILE__, "Controller", __LINE__, "I", "=====>".$function_key);

	if(AUTHENTICATE_USER == $function_key){
		echo User::authenticateUser($username, $password);
	}
	else if(SHOW_ALL_USERS == $function_key){
		echo User::showAllUsers();
	}
	else if(SAVE_INGREDIENT == $function_key){
		echo Save::saveIgredient($ingredientname, $ingredientakaname, $img);
	}
	else if(SAVE_FOOD_TYPE == $function_key){
		echo Save::saveFoodType($foodtypename, $img);
	}
	else if(SAVE_FOOD_CUISINE == $function_key){
		echo Save::saveFoodCuisine($foodcuisinename, $img);
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
		echo Master::updateIngredient($ingid, $ingredientname, $ingredientakaname);
	}
	else if(UPDATE_FOOD_TYPE == $function_key){
		echo Master::updateFoodType($foodtypeid, $foodtypename);
	}
	else if(UPDATE_FOOD_CUISINE == $function_key){
		echo Master::updateFoodCuisine($foodcsnid, $foodcuisinename);
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
		echo User::adminSaveUser($username, $password, $role, $mobile, $email);
	}
  else if(UPDATE_ADMIN_USER_ROLE == $function_key){
		echo User::updateAdminUserRole($userid, $role);
	}



 ?>
    