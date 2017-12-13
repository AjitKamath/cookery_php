<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	//function key
    $function_key = isset($_POST['function_key']) ? $_POST['function_key'] : '';

	//check for null/empty
    if(!Util::check_for_null($function_key)){
        LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, "E", "Error ! null/empty function_key");
        return;
    }
	else{
		LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, "I", "=====>".$function_key);
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
    //params

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
		echo Comment::fetchRecipeComments($rcp_id);
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
	else if(RECIPE_REVIEW_FETCH == $function_key){
		echo Recipe::fetchRecipeReview($rcp_id, $user_id);
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
	//recipe
	
	//review
	else if(REVIEW_USER_FETCH == $function_key){
		echo Review::fetchUsersReviews($user_id);
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
	//review
	
	//ingredient
	else if(INGREDIENT_FETCH == $function_key){
		echo Ingredient::fetchIngredients($searchQuery);
	}
	//ingredient
	
	//timeline
	else if(TIMELINE_USER_FETCH_ALL == $function_key){
		echo Timeline::fetchUserTimelines($user_id, $index);
	}
	else if(TIMELINE_FETCH == $function_key){
		echo Timeline::fetchUserTimeline($tmln_id);
	}
	//timeline
	
	//view
	else if(VIEW_RECIPE_FETCH == $function_key){
		echo View::fetchRecipeViews($rcp_id);
	}
	//view
	
	//user
	else if(USER_LOGIN == $function_key){
		echo User::login($email, $password);
	}
	else if(USER_REGISTER == $function_key){
		echo User::register($email, $mobile, $password, $name, $gender);
	}
	//user
	
	//like
	else if(LIKE_SUBMIT == $function_key){
		echo Like::submitLike($user_id, $type, $type_id);
	}
	//like
	
	else{
        echo UNIDENTIFIED_FUNCTION_KEY;    
    }
    
    LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, "I", "<=====".$function_key);
	LoggerUtil::logger(__FILE__, __METHOD__, __LINE__, "I", "");

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