<?php
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	class ControllerUtil{
		public static function serviceController($post, $files){
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "");

			//function key
			$function_key = isset($_POST['function_key']) ? $_POST['function_key'] : '';
			if(!Util::check_for_null($function_key)){
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! null/empty function_key");
				return;
			}
			//function key

			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "=====>".$function_key);

			//security check
			if(!SecurityUtil::authenticateAPI(apache_request_headers())){
				return;
			}

			//log POST & FILES params from the request
			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, json_encode($_POST));

			if(Util::check_for_null($_FILES)){
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, json_encode($_FILES));
			}
			//log POST & FILES params from the request

			//params
			$searchQuery 	= isset($_POST['search_query']) ? $_POST['search_query'] : '';

			$com_id 		= isset($_POST['com_id']) ? $_POST['com_id'] : '';
			$comment 		= isset($_POST['comment']) ? $_POST['comment'] : '';

			$type			= isset($_POST['type']) ? $_POST['type'] : '';
			$type_id		= isset($_POST['type_id']) ? $_POST['type_id'] : '';

			$rev_id			= isset($_POST['rev_id']) ? $_POST['rev_id'] : '';
			$review 		= isset($_POST['review']) ? $_POST['review'] : '';
			$rating 		= isset($_POST['rating']) ? $_POST['rating'] : '';

			$index			= isset($_POST['index']) ? $_POST['index'] : '0';
			$tmln_id		= isset($_POST['tmln_id']) ? $_POST['tmln_id'] : '';

			$rcp_id 		= isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
			$user_id 		= isset($_POST['user_id']) ? $_POST['user_id'] : '';
			$rcp_nm         = isset($_POST['rcp_nm']) ? $_POST['rcp_nm'] : '';
			$food_csn_id    = isset($_POST['food_csn_id']) ? $_POST['food_csn_id'] : '';
			$ing_aka_id     = isset($_POST['ing_aka_id']) ? $_POST['ing_aka_id'] : '';
			$ing_aka_name   = isset($_POST['ing_aka_name']) ? $_POST['ing_aka_name'] : '';
			$qty_id         = isset($_POST['qty_id']) ? $_POST['qty_id'] : '';
			$ing_qty        = isset($_POST['ing_qty']) ? $_POST['ing_qty'] : '';
			$rcp_steps      = isset($_POST['rcp_steps']) ? $_POST['rcp_steps'] : '';
			$tst_id         = isset($_POST['tst_id']) ? $_POST['tst_id'] : '';
			$tst_qty        = isset($_POST['tst_qty']) ? $_POST['tst_qty'] : '';
			$food_typ_id    = isset($_POST['food_typ_id']) ? $_POST['food_typ_id'] : '';
			$rcp_images     = isset($_FILES['images']) ? $_FILES['images'] : '';

			$email			= isset($_POST['email']) ? $_POST['email'] : '';
			$password		= isset($_POST['password']) ? $_POST['password'] : '';
			$mobile			= isset($_POST['mobile']) ? $_POST['mobile'] : '';
			$name			= isset($_POST['name']) ? $_POST['name'] : '';
			$gender			= isset($_POST['gender']) ? $_POST['gender'] : '';

			$flwr_user_id	= isset($_POST['flwr_user_id']) ? $_POST['flwr_user_id'] : '';
			$flws_user_id	= isset($_POST['flws_user_id']) ? $_POST['flws_user_id'] : '';

			$list_name		= isset($_POST['list_name']) ? $_POST['list_name'] : '';
			$type			= isset($_POST['type']) ? $_POST['type'] : '';
			$list_id 		= isset($_POST['list_id']) ? $_POST['list_id'] : '';

			$new_password 	= isset($_POST['new_password']) ? $_POST['new_password'] : '';

			$image			= isset($_FILES['image']) ? $_FILES['image'] : '';

			$logged_in_user_id 		= isset($_POST['logged_in_user_id']) ? $_POST['logged_in_user_id'] : '';

			$scope_id			= isset($_POST['scope_id']) ? $_POST['scope_id'] : '';
			//params

			$response = "";

			//master data
			if(MASTER_DATA_FETCH_ALL == $function_key){
				$response = MasterData::fetchAllMasterData();
			}
			//master data

			//quantity
			else if(QUANTITY_FETCH_ALL == $function_key){
				$response = Quantity::fetchAllQuantities();
			}
			//quantity

			//food cuisine
			else if(FOOD_CUISINE_FETCH_ALL == $function_key){
				$response = FoodCuisine::fetchAllFoodCuisines();
			}
			//food cuisine

			//food type
			else if(FOOD_TYPE_FETCH_ALL == $function_key){
				$response = FoodType::fetchAllFoodTypes();
			}
			//food type	

			//taste
			else if(TASTE_FETCH_ALL == $function_key){
				$response = Taste::fetchAllTastes();
			}
			//taste

			//comment
			else if(COMMENT_DELETE == $function_key){
				$response = Comment::deleteComment($com_id, $user_id);
			}
			else if(COMMENT_FETCH_ALL == $function_key){
				$response = Comment::fetchComments($user_id, $type, $type_id, $index);
			}
			else if(COMMENT_SUBMIT == $function_key){
				$response = Comment::submitComment($user_id, $type, $type_id, $comment);
			}
			//comment

			//recipe
			else if(RECIPE_DELETE == $function_key){
				$response = Recipe::deleteRecipe($rcp_id, $user_id);
			}
			else if(RECIPE_FETCH == $function_key){
				$response = Recipe::fetchRecipe($rcp_id, $user_id);
			}
			else if(RECIPE_FAVORITE_FETCH == $function_key){
				$response = Recipe::fetchFavoriteRecipes($user_id, $index);
			}
			else if(RECIPE_USER_FETCH == $function_key){
				$response = Recipe::fetchUsersRecipes($user_id, $index);
			}
			else if(RECIPE_USER_VIEWED_FETCH == $function_key){
				$response = Recipe::fetchUserViewedRecipes($user_id, $index);
			}
			else if(RECIPE_USER_REVIEWED_FETCH == $function_key){
				$response = Recipe::fetchUserReviewedRecipes($user_id, $index);
			}
			else if(RECIPE_SUBMIT == $function_key){
				$response = Recipe::submitRecipe($rcp_id, $rcp_nm, $food_csn_id, $ing_aka_id, $ing_aka_name, $qty_id, $ing_qty, 
										  $rcp_steps, $tst_id, $tst_qty, $food_typ_id, $user_id, $rcp_images);
			}
			else if(RECIPE_SEARCH == $function_key){
				$response = Recipe::searchRecipes($user_id, $searchQuery);
			}
			//recipe

			//review
			else if(REVIEW_USER_FETCH == $function_key){
				$response = Review::fetchUserRecipeReview($user_id, $rcp_id);
			}
			else if(REVIEW_USER_FETCH_ALL == $function_key){
				$response = Review::fetchUsersReviews($user_id, $index);
			}
			else if(REVIEW_SUBMIT == $function_key){
				$response = Review::submitReview($rcp_id, $user_id, $review, $rating);
			}
			else if(REVIEW_DELETE == $function_key){
				$response = Review::deleteReview($rev_id, $user_id);
			}
			else if(REVIEW_RECIPE_AVG_RATING == $function_key){
				$response = Review::fetchAverageRecipeRating($rcp_id);
			}
			else if(REVIEW_RECIPE_FETCH == $function_key){
				$response = Review::fetchRecipeReviews($user_id, $rcp_id, $index);
			}
			//review

			//ingredient
			else if(INGREDIENT_FETCH == $function_key){
				$response = Ingredient::fetchIngredients($searchQuery);
			}

			else if(MYLIST_FETCH == $function_key){
				$response = Ingredient::checkUserLists($user_id);
			}

			else if(PHP_FUNCTION_KEY_MYLIST_SUBMIT == $function_key){
				$response = Ingredient::saveuserIngedrientList($list_name,$user_id, $ing_aka_id , $ing_aka_name);
			}

			else if(PHP_FUNCTION_KEY_MYLIST_VIEW == $function_key){
				$response = Ingredient::viewuserIngedrientList($list_id);
			}

			else if(PHP_FUNCTION_KEY_MYLIST_UPDATE == $function_key){
				$response = Ingredient::updateUserIngedrientList($list_id, $list_name,$user_id, $ing_aka_id , $ing_aka_name);
			}
			else if(PHP_FUNCTION_KEY_MYLIST_SUBMIT_FROM_RECIPE == $function_key){
				$response = Ingredient::updateUserIngedrientListFromRecipe($list_id, $ing_aka_id );
			}
			//ingredient

			//timeline
			else if(TIMELINE_USER_FETCH == $function_key){
				$response = Timeline::fetchUserTimeline($user_id, $index);
			}
			else if(STORY_USER_FETCH == $function_key){
				$response = Timeline::fetchUserStories($user_id, $index);
			}
			else if(TIMELINE_SCOPE_MODIFY == $function_key){
				$response = Timeline::modifyTimelineScope($tmln_id, $scope_id);
			}
			else if(TIMELINE_DELETE == $function_key){
				$response = Timeline::deleteTimeline($tmln_id);
			}
			//timeline

			//view
			else if(VIEW_RECIPE_FETCH == $function_key){
				$response = View::fetchRecipeViews($rcp_id);
			}
			else if(VIEW_FETCH_USERS == $function_key){
				$response = View::fetchViewedUsers($logged_in_user_id, $rcp_id, $index);
			}
			//view

			//user
			else if(USER_LOGIN == $function_key){
				$response = User::login($email, $password);
			}
			else if(USER_REGISTER == $function_key){
				$response = User::register($email, $password, $name);
			}
			else if(USER_FETCH_PUBLIC == $function_key || USER_FETCH_SELF == $function_key){
				$response = User::fetchUser($user_id, $logged_in_user_id, $function_key);
			}
			else if(USER_FOLLOW_SUBMIT == $function_key){
				$response = User::submitFollowUser($flwr_user_id, $flws_user_id);
			}
			else if(USER_FOLLOWERS_FETCH == $function_key){
				$response = User::fetchUserFollowers($user_id, $logged_in_user_id, $index);
			}
			else if(USER_FOLLOWINGS_FETCH == $function_key){
				$response = User::fetchUserFollowings($user_id, $logged_in_user_id, $index);
			}
			else if(USER_UPDATE_NAME == $function_key){
				$response = User::updateUserName($user_id, $name);
			}
			else if(USER_UPDATE_EMAIL == $function_key){
				$response = User::updateUserEmail($user_id, $email, $scope_id);
			}
			else if(USER_UPDATE_PASSWORD == $function_key){
				$response = User::updateUserPassword($user_id, $password, $new_password);
			}
			else if(USER_UPDATE_PHONE == $function_key){
				$response = User::updateUserPhone($user_id, $mobile, $scope_id);
			}
			else if(USER_UPDATE_GENDER == $function_key){
				$response = User::updateUserGender($user_id, $gender, $scope_id);
			}
			else if(USER_UPDATE_IMAGE == $function_key){
				$response = User::updateUserImage($user_id, $image);
			}
			else if(USER_REGISTER_CHECK == $function_key){
				$response = User::userRegisterCheck($email);
			}
			else if(USER_SEARCH == $function_key){
				$response = User::searchUsers($searchQuery, $logged_in_user_id, $index);
			}
			//user

			//like
			else if(LIKE_SUBMIT == $function_key){
				$response = Like::submitLike($user_id, $type, $type_id);
			}
			else if(LIKE_FETCH_USERS == $function_key){
				$response = Like::fetchLikedUsers ($logged_in_user_id, $type, $type_id, $index);
			}
			//like

			//favourite
			else if(FAV_SUBMIT == $function_key){
				$response = Favourites::submitFavourite($user_id, $rcp_id);
			}
			//favourite

			//trends
			else if(TREND_FETCH == $function_key){
				$response = Trend::fetchActiveTrends($user_id);
			}
			//trends

			else{
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, UNIDENTIFIED_FUNCTION_KEY);
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "1. Check if '".$function_key."' is defined in FunctionKeys.php");
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "2. Check if '".$function_key."' is handled in Controller.php");

				Util::setResponseHeader(HTTP_NOT_IMPLEMENTED);
			}

			if(!Util::check_for_null($response)){
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! null/empty response");
				Util::setResponseHeader(HTTP_INTERNAL_ERROR);
			}
			else{
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Response:");
				LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, $response);
				Util::setResponseHeader(HTTP_OK);
				echo $response;
			}

			LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, LOG_TYPE_INFO, "<=====".$function_key);
		}
	}

	//this function triggers on every class object creation or static method calls
	function __autoload($class_name){
		//relative paths to directories to scan for autoload
		$directorys = array(
			'private/services/',
			'private/util/'
		);
		//relative paths to directories to scan for autoload

		//for each directory
		foreach($directorys as $directory){
			$file_path = $_SERVER['DOCUMENT_ROOT'].'/'.$directory.$class_name . '.php';

			//see if the file exsists
			if(file_exists($file_path)){
				require_once($file_path);
				return;
			}            
		}
	}
	//this function triggers on every class object creation or static method calls
?>