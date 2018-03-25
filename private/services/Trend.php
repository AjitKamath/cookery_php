<?php
	class Trend{
		
		public static function fetchActiveTrends($user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user_id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				$query = "SELECT TRND_ID, TRND_KEY, TRND_MSG 
							FROM `TRENDS`
							WHERE IS_ACTIVE = 'Y'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_obj = $result->fetch_object()){
					$temp_array = array();
					$temp_array['TRND_ID'] = $result_obj->TRND_ID; 
					$temp_array['TRND_KEY'] = $result_obj->TRND_KEY;
					$temp_array['TRND_MSG'] = $result_obj->TRND_MSG;
					
					if($result_obj->TRND_KEY == RECIPES_OF_THE_MONTH || $result_obj->TRND_KEY == RECIPE_OF_THE_DAY){
						$query = "SELECT RCP_ID, RCP_NAME, FOOD_CSN_NAME, FOOD_TYP_NAME, NAME 
							FROM `TRENDS_ITEM` AS TRND_ITM
							INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = TRND_ITM.TRND_ITEM_TYPE_ID
							INNER JOIN `FOOD_TYPE` AS FOOD_TYP ON FOOD_TYP.FOOD_TYP_ID = RCP.FOOD_TYP_ID
							INNER JOIN `FOOD_CUISINE` AS FOOD_CSN ON FOOD_CSN.FOOD_CSN_ID = RCP.FOOD_CSN_ID
							INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
							WHERE IS_ACTIVE = 'Y'
							AND RCP.IS_DEL = 'N'
							AND TRND_ID = '".$result_obj->TRND_ID."'";
						$recipe_result = mysqli_query($con, $query);
						
						$recipes_array = array();
						while($recipe_obj = $recipe_result->fetch_object()){
							$recipe_temp = array();
							$recipe_temp['RCP_ID'] = $recipe_obj->RCP_ID;
							$recipe_temp['RCP_NAME'] = $recipe_obj->RCP_NAME;
							
							$recipe_temp['foodCuisineName'] = $recipe_obj->FOOD_CSN_NAME;
							$recipe_temp['foodTypeName'] = $recipe_obj->FOOD_TYP_NAME;

							$recipe_temp['userName'] = $recipe_obj->NAME;
							
							//like count
							$recipe_temp['likesCount'] = Like::getLikeCount($con, "RECIPE", $recipe_obj->RCP_ID);
							//like count

							//views count
							$recipe_temp['viewsCount'] = View::getViewCount($con, $recipe_obj->RCP_ID);
							//views count

							//comments count
							$recipe_temp['commentsCount'] = Comment::getCommentsCount($con, "RECIPE", $recipe_obj->RCP_ID);	
							//comments count

							//if the user has liked recipe
							$recipe_temp['userLiked'] = Like::isUserLiked($con, $user_id, "RECIPE", $recipe_obj->RCP_ID);
							//if the user has liked recipe

							//if the user has reviewed recipe
							$recipe_temp['userReviewed'] = Review::isUserReviewed($con, $user_id, $recipe_obj->RCP_ID);
							//if the user has reviewed recipe

							//If the recipe is marked as Favourite for the logged in user
							$recipe_temp['userFavorite'] = Favourites::getFavouriteStatus($con, $recipe_obj->RCP_ID, $user_id);
							//If the recipe is marked as Favourite for the logged in user

							//fetch recipe avg rating
							$recipe_temp['avgRating'] = Recipe::getRecipeAvgRating($con, $recipe_obj->RCP_ID);
							//fetch recipe avg rating

							//fetch primary image for the recipe
							$recipe_temp['images'] = Recipe::getRecipePrimaryImage($con, $user_id, $recipe_obj->RCP_ID);
							//fetch primary image for the recipe
							
							array_push($recipes_array, $recipe_temp); 
						}
						
						$temp_array['recipes'] = $recipes_array;
					}
					else if($result_obj->TRND_KEY == USER_OF_THE_WEEK){
						$query = "SELECT USER_ID, NAME, IMG, RANK_NAME 
							FROM `TRENDS_ITEM` AS TRND_ITM
							INNER JOIN `USER` AS USR ON USR.USER_ID = TRND_ITM.TRND_ITEM_TYPE_ID
							INNER JOIN `RANK` AS RNK ON RNK.RANK_ID = USR.RANK_ID
							WHERE IS_ACTIVE = 'Y'
							AND TRND_ID = '".$result_obj->TRND_ID."'";
						$users_result = mysqli_query($con, $query);
						
						$users_array = array();
						while($user_obj = $users_result->fetch_object()){
							$user_temp = array();
							$user_temp['USER_ID'] = $user_obj->USER_ID;
							$user_temp['NAME'] = $user_obj->NAME;
							$user_temp['IMG'] = $user_obj->IMG;
							$user_temp['RANK_NAME'] = $user_obj->RANK_NAME;
							
							array_push($users_array, $user_temp);
						}
						
						$temp_array['users'] = $users_array;
					}
					
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
		
		
	}
?>