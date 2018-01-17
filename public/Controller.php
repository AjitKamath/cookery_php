<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	//function key
	$function_key = isset($_POST['function_key']) ? $_POST['function_key'] : '';

	//check for null/empty
	if(!Util::check_for_null($function_key)){
			LoggerUtil::logger(__FILE__, "Controller", __LINE__, "E", "Error ! null/empty function_key");
			return;
	}
	
	//check for null/empty
	//function key

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
	$ing_id         = isset($_POST['ing_id']) ? $_POST['ing_id'] : '';
	$ing_nm         = isset($_POST['ing_nm']) ? $_POST['ing_nm'] : '';
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

	LoggerUtil::logger(__FILE__, "Controller", __LINE__, "I", "");
	LoggerUtil::logger(__FILE__, "Controller", __LINE__, "I", "=====>".$function_key);

	//quantity
	if(QUANTITY_FETCH_ALL == $function_key){
			echo Quantity::fetchAllQuantities();
	}
	//quantity
	
	//food cuisine
	else if(FOOD_CUISINE_FETCH_ALL == $function_key){
		echo FoodCuisine::fetchAllFoodCuisines();
	}
	//food cuisine
	
	//food type
	else if(FOOD_TYPE_FETCH_ALL == $function_key){
		echo FoodType::fetchAllFoodTypes();
	}
	//food type	

	//taste
	else if(TASTE_FETCH_ALL == $function_key){
		echo Taste::fetchAllTastes();
	}
	//taste

	//comment
	else if(COMMENT_DELETE == $function_key){
		echo Comment::deleteComment($com_id, $user_id);
	}
	else if(COMMENT_RECIPE_FETCH_ALL == $function_key){
		echo Comment::fetchRecipeComments($user_id, $rcp_id, $index);
	}
	else if(COMMENT_SUBMIT == $function_key){
		echo Comment::submitComment($rcp_id, $user_id, $comment);
	}
	//comment
	
	//recipe
	else if(RECIPE_DELETE == $function_key){
		echo Recipe::deleteRecipe($rcp_id, $user_id);
	}
	else if(RECIPE_FETCH == $function_key){
		echo Recipe::fetchRecipe($rcp_id, $user_id);
	}
	else if(RECIPE_FAVORITE_FETCH == $function_key){
		echo Recipe::fetchFavoriteRecipes($user_id, $index);
	}
	else if(RECIPE_USER_FETCH == $function_key){
		echo Recipe::fetchUsersRecipes($user_id, $index);
	}
	else if(RECIPE_USER_VIEWED_FETCH == $function_key){
		echo Recipe::fetchUserViewedRecipes($user_id, $index);
	}
	else if(RECIPE_USER_REVIEWED_FETCH == $function_key){
		echo Recipe::fetchUserReviewedRecipes($user_id, $index);
	}
	else if(RECIPE_TRENDING_FETCH == $function_key){
		echo Recipe::fetchTrendingRecipes($user_id);
	}
	else if(RECIPE_SUBMIT == $function_key){
		echo Recipe::submitRecipe($rcp_id, $rcp_nm, $food_csn_id, $ing_id, $ing_nm, $qty_id, $ing_qty, 
								  $rcp_steps, $tst_id, $tst_qty, $food_typ_id, $user_id, $rcp_images);
	}
	else if(RECIPE_SEARCH == $function_key){
		echo Recipe::searchRecipes($searchQuery);
	}
	//recipe
	
	//review
	else if(REVIEW_USER_FETCH == $function_key){
		echo Review::fetchUsersReviews($user_id, $rcp_id, $index);
	}
	else if(REVIEW_SUBMIT == $function_key){
		echo Review::submitReview($rcp_id, $user_id, $review, $rating);
	}
	else if(REVIEW_DELETE == $function_key){
		echo Review::deleteReview($rev_id, $user_id);
	}
	else if(REVIEW_RECIPE_AVG_RATING == $function_key){
		echo Review::fetchAverageRecipeRating($rcp_id);
	}
	else if(REVIEW_RECIPE_FETCH == $function_key){
		echo Review::fetchRecipeReviews($user_id, $rcp_id, $index);
	}
	//review
	
	//ingredient
	else if(INGREDIENT_FETCH == $function_key){
		echo Ingredient::fetchIngredients($searchQuery);
	}

	else if(MYLIST_FETCH == $function_key){
		echo Ingredient::checkUserLists($user_id);
	}

	else if(PHP_FUNCTION_KEY_MYLIST_SUBMIT == $function_key){
		echo Ingredient::saveuserIngedrientList($list_name,$user_id, $ing_id , $ing_nm);
	}

	else if(PHP_FUNCTION_KEY_MYLIST_VIEW == $function_key){
		echo Ingredient::viewuserIngedrientList($list_id);
	}
	else if(PHP_FUNCTION_KEY_MYLIST_UPDATE == $function_key){
		echo Ingredient::updateUserIngedrientList($list_name,$user_id, $ing_id , $ing_nm);
	}
	//ingredient
	
	//timeline
	else if(TIMELINE_USER_FETCH == $function_key){
		echo Timeline::fetchUserTimeline($user_id, $index);
	}
	else if(TIMELINE_USER_FOLLOWS_FETCH == $function_key){
		echo Timeline::fetchUserFollowsTimeline($user_id, $index);
	}
	else if(TIMELINE_SCOPE_MODIFY == $function_key){
		echo Timeline::modifyTimelineScope($tmln_id, $scope_id);
	}
	else if(TIMELINE_DELETE == $function_key){
		echo Timeline::deleteTimeline($tmln_id);
	}
	//timeline
	
	//view
	else if(VIEW_RECIPE_FETCH == $function_key){
		echo View::fetchRecipeViews($rcp_id);
	}
	else if(VIEW_FETCH_USERS == $function_key){
		echo View::fetchViewedUsers($rcp_id);
	}
	//view
	
	//user
	else if(USER_LOGIN == $function_key){
		echo User::login($email, $password);
	}
	else if(USER_REGISTER == $function_key){
		echo User::register($email, $password, $name);
	}
	else if(USER_FETCH_PUBLIC == $function_key || USER_FETCH_SELF == $function_key){
		echo User::fetchUser($user_id, $logged_in_user_id, $function_key);
	}
	else if(USER_FOLLOW_SUBMIT == $function_key){
		echo User::submitFollowUser($flwr_user_id, $flws_user_id);
	}
	else if(USER_FOLLOWERS_FETCH == $function_key){
		echo User::fetchUserFollowers($user_id, $logged_in_user_id, $index);
	}
	else if(USER_FOLLOWINGS_FETCH == $function_key){
		echo User::fetchUserFollowings($user_id, $logged_in_user_id, $index);
	}
	else if(USER_UPDATE_NAME == $function_key){
		echo User::updateUserName($user_id, $name);
	}
	else if(USER_UPDATE_EMAIL == $function_key){
		echo User::updateUserEmail($user_id, $email, $scope_id);
	}
	else if(USER_UPDATE_PASSWORD == $function_key){
		echo User::updateUserPassword($user_id, $password, $new_password);
	}
	else if(USER_UPDATE_PHONE == $function_key){
		echo User::updateUserPhone($user_id, $mobile, $scope_id);
	}
	else if(USER_UPDATE_GENDER == $function_key){
		echo User::updateUserGender($user_id, $gender, $scope_id);
	}
	else if(USER_UPDATE_IMAGE == $function_key){
		echo User::updateUserImage($user_id, $image);
	}
	//user
	
	//like
	else if(LIKE_SUBMIT == $function_key){
		echo Like::submitLike($user_id, $type, $type_id);
	}
	else if(LIKE_FETCH_USERS == $function_key){
		echo Like::fetchLikedUsers($type, $type_id);
	}
	//like
	
	else{
        echo UNIDENTIFIED_FUNCTION_KEY;    
    }
    
    LoggerUtil::logger(__FILE__, "Controller", __LINE__, "I", "<=====".$function_key);
	
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
                //echo "autoloaded : ".$file_path;
                return;
            }            
        }
    }
    //this function triggers on every class object creation or static method calls
?>