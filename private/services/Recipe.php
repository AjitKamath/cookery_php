<?php
	class Recipe{
		public static function getRecipesCount($con, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}
			
			try{
				$query = "SELECT COUNT(*) AS COUNT 
							FROM `RECIPE` 
							WHERE USER_ID = '$user_id'
							AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return $result_obj->COUNT; 
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function searchRecipes($user_id, $searchQuery){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id");
				return;
			}
			
			if(!Util::check_for_null($searchQuery)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."searchQuery");
				return;
			}
			//check for null/empty
			
			try{
				$con = DatabaseUtil::getInstance()->open_connection();
				
				//check if the query matches any recipe with its name or ingredients or the user who submitted it
				$query = "SELECT DISTINCT RCP.RCP_ID, RCP_NAME, USR.NAME, USR.IMG 
							FROM RECIPE AS RCP
							INNER JOIN USER AS USR ON USR.USER_ID = RCP.USER_ID 
							INNER JOIN DISH AS DSH ON DSH.RCP_ID = RCP.RCP_ID
							INNER JOIN ING_AKA AS ING_AKA ON ING_AKA.ING_AKA_ID = DSH.ING_AKA_ID
							WHERE (RCP_NAME LIKE '%".$searchQuery."%'
							OR ING_AKA_NAME LIKE '%".$searchQuery."%' 
							OR USR.NAME LIKE '%".$searchQuery."%')
							AND RCP.IS_DEL = 'N'
							AND ING_AKA.IS_REG = 'Y'
							LIMIT 10";
				
				$result = mysqli_query($con, $query);
				//check if the query matches any recipe with its name or ingredients or the user who submitted it
								
				$result_array = array();
				while($result_obj = $result->fetch_object()){
					$temp_array['userName'] = $result_obj->NAME;
					$temp_array['userImage'] = $result_obj->IMG;

					$temp_array['RCP_ID'] = $result_obj->RCP_ID;
					$temp_array['RCP_NAME'] = $result_obj->RCP_NAME;

					//fetch primary recipe image
					$temp_array['images'] = self::getRecipePrimaryImage($con, $user_id, $result_obj->RCP_ID);
					//fetch primary recipe image
					
					//fetch recipe ingredients
					$temp_array['ingredients'] = self::getRecipeIngredients($con, $result_obj->RCP_ID);
					//fetch recipe ingredients

					//fetch recipe avg rating
					$temp_array['avgRating'] = self::getRecipeAvgRating($con, $result_obj->RCP_ID);
					//fetch recipe avg rating
					
					//fetch recipe likes count
					$temp_array['likesCount'] = Like::getLikeCount($con, "RECIPE", $result_obj->RCP_ID);
					//fetch recipe likes count

					//fetch recipe views count
					$temp_array['viewsCount'] = View::getViewCount($con, $result_obj->RCP_ID);
					//fetch recipe views count

					array_push($result_array, $temp_array); 
				}
				
				return json_encode($result_array);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getRecipeAvgRating($con, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			try{
				$query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);

				if($result_obj = $result->fetch_object()){
					return Util::getSmartDecimal($result_obj->RATING); 
				}
				
				return 0;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getRecipeIngredients($con, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			try{
				//fetch primary recipe image
				$query = "SELECT ING_AKA.ING_AKA_ID, ING_AKA.ING_AKA_NAME, QTY.QTY_NAME, DSH.ING_QTY FROM `DISH` AS DSH 
								INNER JOIN `RECIPE` AS RCP ON DSH.RCP_ID = RCP.RCP_ID
								INNER JOIN  `ING_AKA` AS ING_AKA ON ING_AKA.ING_AKA_ID = DSH.ING_AKA_ID
								INNER JOIN  `QTY` AS QTY ON QTY.QTY_ID = DSH.QTY_ID
								WHERE RCP.RCP_ID = '$rcp_id' ";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$temparr['ING_AKA_ID'] = $result_data->ING_AKA_ID;
					$temparr['ING_AKA_NAME'] = $result_data->ING_AKA_NAME;
					$temparr['QTY_NAME'] = $result_data->QTY_NAME;
					$temparr['ING_QTY'] = $result_data->ING_QTY;

					array_push($result_array, $temparr);  
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getRecipePrimaryImage($con, $user_id, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			try{
				//fetch primary recipe image
				$query = "SELECT RCP_IMG_ID, RCP_IMG FROM RECIPE_IMG WHERE RCP_ID = '".$rcp_id."' LIMIT 1";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_obj = $result->fetch_object()){
					$temp_array['RCP_IMG_ID'] = $result_obj->RCP_IMG_ID;
					$temp_array['RCP_IMG'] = $result_obj->RCP_IMG;
					
					$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, 'RECIPE_IMG', $result_obj->RCP_IMG_ID);
					$temp_array['likesCount'] = Like::getLikeCount($con, 'RECIPE_IMG', $result_obj->RCP_IMG_ID);
					
					array_push($result_array, $temp_array); 
				}
				//fetch primary recipe image
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getRecipeName($con, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			try{
				//fetch recipe name
				$query = "SELECT RCP_NAME FROM RECIPE WHERE RCP_ID = '".$rcp_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_obj = $result->fetch_object()){
					return $result_obj->RCP_NAME;
				}
				//fetch recipe name
				
				return "";
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function getRecipeImages($con, $user_id, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			
			try{
				$query = "SELECT RCP_IMG_ID, RCP_IMG FROM RECIPE_IMG WHERE RCP_ID = '".$rcp_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_obj = $result->fetch_object()){
					$temp_array['RCP_IMG_ID'] = $result_obj->RCP_IMG_ID;
					$temp_array['RCP_IMG'] = $result_obj->RCP_IMG;
					
					$temp_array['userLiked'] = Like::isUserLiked($con, $user_id, 'RECIPE_IMG', $result_obj->RCP_IMG_ID);
					$temp_array['likesCount'] = Like::getLikeCount($con, 'RECIPE_IMG', $result_obj->RCP_IMG_ID);
					$temp_array['commentsCount'] = Comment::getCommentsCount($con, 'RECIPE_IMG', $result_obj->RCP_IMG_ID);
					
					array_push($result_array, $temp_array); 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function submitRecipe($rcp_id, $rcp_nm, $food_csn_id, $ing_aka_id, $ing_aka_nm, $qty_id, $ing_qty, 
											$rcp_steps, $tst_id, $tst_qty, $food_typ_id, $user_id, $rcp_images){
			//check for null/empty
			//mandatory
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user_id)");
				return;
			}

			if(!Util::check_for_null($rcp_nm)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_nm");
				return;
			}

			if(!Util::check_for_null($food_typ_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."food_typ_id");
				return;
			}

			if(!Util::check_for_null($food_csn_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."food_csn_nm");
				return;
			}

			if(count($ing_aka_id) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."ing_aka_id");
				return;
			}

			if(!Util::check_for_null($qty_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."qty_id");
				return;
			}

			if(!Util::check_for_null($ing_qty)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."ing_qty");
				return;
			}

			if(!Util::check_for_null($tst_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."tst_id");
				return;
			}

			if(!Util::check_for_null($tst_qty)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."tst_qty");
				return;
			}  

			if(count($rcp_images['name']) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_images");
				return;
			}

			if(count($rcp_steps) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_steps");
				return;
			}
			//mandatory

			//optional
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "null/empty rcp_id");
			}

			if(!Util::check_for_null($ing_aka_nm)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "null/empty ing_nm");
			}
			//optional
			//check for null/empty

			//validations
			$ing_count = count($ing_aka_id);
			if(count($ing_aka_nm) != $ing_count || count($ing_qty) != $ing_count || count($qty_id) != $ing_count){

			}
			//validations

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//submit recipe transaction begins here
				mysqli_begin_transaction($con, MYSQLI_TRANS_START_READ_WRITE);
				mysqli_autocommit($con, FALSE);

				//if the $rcp_id is not null/empty, user is updating an old recipe
				if(Util::check_for_null($rcp_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User(".$user_id.") is updating an old Recipe(".$rcp_id.")");

					//update recipe
					//update RECIPE table
					$query = "UPDATE `RECIPE` 
								SET `RCP_NAME` = '".DatabaseUtil::cleanUpString($con, $rcp_nm)."', `FOOD_TYP_ID` = '".$food_typ_id."', 
								`FOOD_CSN_ID` = '".$food_csn_id."', `MOD_DTM` = CURRENT_TIMESTAMP
							  	WHERE RCP_ID = '".$rcp_id."'";
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe(".$rcp_id.") updated into RECIPE table by User(".$user_id.")");

						//delete the old ingredients in DISH table
						$query = "DELETE FROM `DISH` WHERE RCP_ID = '".$rcp_id."'";
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "All Ingredients for Recipe(".$rcp_id.") are deleted from DISH table");
						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to delete Ingredients for Recipe(".$rcp_id.") from DISH table.");
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
							throw new Exception("Failed to delete Ingredients for Recipe(".$rcp_id.") from DISH table.");
						}
						//delete the old ingredients in DISH table

						//update/insert ingredients into DISH table
						for($i = 0; $i< count($ing_aka_id); $i++){
							$temp_ing_aka_id = $ing_aka_id[$i];

							//if the $ing_aka_id[i] is empty/null, user has entered custom ingredient. insert it in ING_AKA table then in DISH table
							if($temp_ing_aka_id == null || $temp_ing_aka_id == ''){
								$query = "INSERT INTO `ING_AKA` ( `ING_AKA_NAME` , `CREATE_DTM`) 
											VALUES ('".DatabaseUtil::cleanUpString($con, $ing_aka_nm)."' , CURRENT_TIMESTAMP)";
								if(mysqli_query($con, $query)){
									$temp_ing_aka_id = mysqli_insert_id($con); 
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$temp_ing_aka_id.") added into ING_AKA table");
								}
								else{
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into ING_AKA table.");
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
									throw new Exception("Failed to insert into ING_AKA table");
								}
							}
							//if the $ing_aka_id[i] is empty/null, user has entered custom ingredient. insert it in ING_AKA table then in DISH table

							//insert into DISH table
							$query = "INSERT INTO `DISH` (`RCP_ID` , `ING_AKA_ID` , `QTY_ID` , `ING_QTY` , `CREATE_DTM`) 
										VALUES ('$rcp_id' , '$temp_ing_aka_id' , '$qty_id[$i]' , '$ing_qty[$i]' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$dish_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$dish_id.") added into DISH table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into DISH table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into DISH table");
							}
							//insert into DISH table
						}
						//insert ingredients into DISH table

						//delete the old recipe steps from RECIPE_STEPS table
						$query = "DELETE FROM `RECIPE_STEPS` WHERE RCP_ID = '".$rcp_id."'";
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "All steps for Recipe(".$rcp_id.") are deleted from RECIPE_STEPS table");
						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to delete steps for Recipe(".$rcp_id.") from RECIPE_STEPS table.");
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
							throw new Exception("Failed to delete steps for Recipe(".$rcp_id.") from RECIPE_STEPS table.");
						}
						//delete the old recipe steps from RECIPE_STEPS table

						//insert recipe steps into RECIPE_STEPS table
						for($i = 0; $i< count($rcp_steps); $i++){
							$query = "INSERT INTO `RECIPE_STEPS` (`RCP_ID` , `RCP_STEP` , `CREATE_DTM`) 
									  VALUES ('$rcp_id' , '".DatabaseUtil::cleanUpString($con, $rcp_steps[$i])."' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$rcp_stps_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Step(".$rcp_stps_id.") added into RECIPE_STEPS table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_STEPS table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_STEPS table");
							}
						}
						//insert recipe steps into RECIPE_STEPS table

						//delete the old tastes from RECIPE_TASTE table
						$query = "DELETE FROM `RECIPE_TASTE` WHERE RCP_ID = '".$rcp_id."'";
						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "All tastes for Recipe(".$rcp_id.") are deleted from RECIPE_TASTE table");
						}
						else{
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
							throw new Exception("Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
						}
						//delete the old recipe tastes from RECIPE_TASTE table

						//insert tastes into TASTE table
						for($i = 0; $i< count($tst_id); $i++){
							$query = "INSERT INTO `RECIPE_TASTE` (`RCP_ID` , `TST_ID` , `TST_QTY` , `CREATE_DTM`)
									  VALUES ('$rcp_id' , '$tst_id[$i]' , '$tst_qty[$i]' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$rcp_tst_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Taste(".$rcp_tst_id.") added into DISH table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_TASTE table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_TASTE table");
							}
						}
						//insert tastes into TASTE table
					}
					else{
						throw new Exception("Query failure : ".$query);
					}
					//update RECIPE table

					//delete the old recipe images from RECIPE_IMG table
					$query = "DELETE FROM `RECIPE_IMG` WHERE RCP_ID = '".$rcp_id."'";
					if(mysqli_query($con, $query)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "All images for Recipe(".$rcp_id.") are deleted from RECIPE_IMG table");

						//NOTE : not deleting the images from its phyiscal path as of now.
					}
					else{
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Failed to delete tastes for Recipe(".$rcp_id.") from RECIPE_TASTE table.");
					}
					//delete the old recipe tastes from RECIPE_TASTE table

					//upload images. if atleast one image is uploaded, warn the user but recipe must be added without rolling back
					//prepare directories
					if(!Util::prepare_directories($user_id)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Cannot submit the recipe as the file directories could not be created for the user($user_id).");  
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Cannot submit the recipe as the file directories could not be created for the user($user_id).");
					}

					$recipe_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_RECIPES_DIRECTORY.$rcp_id."/".APP_DATA_RECIPES_IMAGES_DIRECTORY;
					if(!Util::create_directory($recipe_images_dir)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to create directory(".$recipe_images_dir.")");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Failed to create directory(".$recipe_images_dir.")");
					}
					//prepare directories

					$upload_failed = false;
					$primaryRecipeImage = "";
					for($i = 0; $i< count($rcp_images['tmp_name']); $i++){
						try{
							$recipe_image = $recipe_images_dir.uniqid().".jpg";

							//insert into RECIPE_IMG table
							$query = "INSERT INTO `RECIPE_IMG` (`RCP_ID` , `RCP_IMG`, `CREATE_DTM`) 
									  VALUES ('$rcp_id' , '".Util::get_relative_path($recipe_image)."', CURRENT_TIMESTAMP)";   
							if(mysqli_query($con, $query)){
								$rcp_img_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Image(".$rcp_img_id.") added into RECIPE_IMG table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_IMG table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_IMG table");
							}
							//insert into RECIPE_IMG table

							if (isset($rcp_images['tmp_name'][$i])){
								$tmpFilePath = $rcp_images['tmp_name'][$i];
								move_uploaded_file($tmpFilePath, $recipe_image);
								$atleast_one_uploaded = true;
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Image(".$recipe_image.") uploaded");
								
								if(!Util::check_for_null($primaryRecipeImage)){
									$primaryRecipeImage = $recipe_image;
								} 
							}
						}
						catch(Exception $e){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Image upload fail exception : ".$e->getMessage());
							$upload_failed = true;
						}
					}

					if(!$atleast_one_uploaded){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Could not upload atleast one recipe image");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Could not upload atleast one recipe image");
					}

					$response = array();
					if($upload_failed){
						$response['err_message'] = "Few of the images could not be uploaded !";
					}
					else{
						$response['err_message'] = "Recipe has been updated !";
						
						Timeline::addTimeline($con, $user_id, $user_id, RECIPE_MODIFY, $rcp_id, DEFAULT_SCOPE_ID);
						MailUtil::recipeEmail(RECIPE_MODIFY, User::getEmail($con, $user_id), User::getUsername($con, $user_id), "Your Recipe is Updated", $primaryRecipeImage, $rcp_nm);
					}
					//upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back

					$response['isError'] = false;
					//update recipe
				}
				//if the $rcp_id is not null/empty, user is updating an old recipe
				//if the $rcp_id is null/empty, user is adding a new recipe
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "User(".$user_id.") is adding a new Recipe");

					//add recipe
					//insert into RECIPE table
					$query = "INSERT INTO `RECIPE` (`RCP_NAME` , `FOOD_TYP_ID` , `FOOD_CSN_ID`, `USER_ID`, `CREATE_DTM`) 
							  VALUES ('".DatabaseUtil::cleanUpString($con, $rcp_nm)."' , '$food_typ_id' , '$food_csn_id' , '$user_id' , CURRENT_TIMESTAMP)";
					if(mysqli_query($con, $query)){
						$rcp_id = mysqli_insert_id($con);
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe(".$rcp_id.") added into RECIPE table by User(".$user_id.")");

						//insert ingredients into DISH table
						for($i = 0; $i< count($ing_aka_id); $i++){
							$temp_ing_aka_id = $ing_aka_id[$i];

							//if the $ing_aka_id[i] is empty/null, user has entered custom ingredient. insert it in ING_AKA table then in DISH table
							if($temp_ing_aka_id == null || $temp_ing_aka_id == ''){
								$query = "INSERT INTO `ING_AKA` (`ING_AKA_NAME` , `CREATE_DTM`) 
											VALUES ('".DatabaseUtil::cleanUpString($con, $ing_aka_nm)."' , CURRENT_TIMESTAMP)";
								if(mysqli_query($con, $query)){
									$temp_ing_aka_id = mysqli_insert_id($con); 
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$temp_ing_aka_id.") added into ING_AKA table");
								}
								else{
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into ING_AKA table.");
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
									LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
									throw new Exception("Failed to insert into ING_AKA table");
								}
							}
							//if the $ing_aka_id[i] is empty/null, user has entered custom ingredient. insert it in ING_AKA table then in DISH table

							//insert into DISH table
							$query = "INSERT INTO `DISH` (`RCP_ID` , `ING_AKA_ID` , `QTY_ID` , `ING_QTY` , `CREATE_DTM`) 
										VALUES ('$rcp_id' , '$temp_ing_aka_id' , '$qty_id[$i]' , '$ing_qty[$i]' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$dish_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Ingredient(".$dish_id.") added into DISH table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into DISH table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into DISH table");
							}
							//insert into DISH table
						}
						//insert ingredients into DISH table

						//insert recipe steps into RECIPE_STEPS table
						for($i = 0; $i< count($rcp_steps); $i++){
							$query = "INSERT INTO `RECIPE_STEPS` (`RCP_ID` , `RCP_STEP` , `CREATE_DTM`) 
									  VALUES ('$rcp_id' , '".DatabaseUtil::cleanUpString($con, $rcp_steps[$i])."' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$rcp_stps_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Step(".$rcp_stps_id.") added into RECIPE_STEPS table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_STEPS table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_STEPS table");
							}
						}
						//insert recipe steps into RECIPE_STEPS table

						//insert tastes into TASTE table
						for($i = 0; $i< count($tst_id); $i++){
							$query = "INSERT INTO `RECIPE_TASTE` (`RCP_ID` , `TST_ID` , `TST_QTY` , `CREATE_DTM`)
									  VALUES ('$rcp_id' , '$tst_id[$i]' , '$tst_qty[$i]' , CURRENT_TIMESTAMP)";
							if(mysqli_query($con, $query)){
								$rcp_tst_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Taste(".$rcp_tst_id.") added into DISH table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_TASTE table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_TASTE table");
							}
						}
						//insert tastes into TASTE table
					}
					else{
						throw new Exception("Query failure : ".$query);
					}
					//insert into RECIPE table

					//upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back
					//prepare directories
					if(!Util::prepare_directories($user_id)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Cannot submit the recipe as the file directories could not be created for the user($user_id).");  
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Cannot submit the recipe as the file directories could not be created for the user($user_id).");
					}

					$recipe_images_dir = APP_DATA_USERS_DIRECTORY.$user_id."/".APP_DATA_RECIPES_DIRECTORY.$rcp_id."/".APP_DATA_RECIPES_IMAGES_DIRECTORY;
					if(!Util::create_directory($recipe_images_dir)){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to create directory(".$recipe_images_dir.")");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Failed to create directory(".$recipe_images_dir.")");
					}
					//prepare directories

					$upload_failed = false;
					$primaryRecipeImage = "";
					for($i = 0; $i< count($rcp_images['tmp_name']); $i++){
						try{
							$recipe_image = $recipe_images_dir.uniqid().".jpg";

							//insert into RECIPE_IMG table
							$query = "INSERT INTO `RECIPE_IMG` (`RCP_ID` , `RCP_IMG`, `CREATE_DTM`) 
									  VALUES ('$rcp_id' , '".Util::get_relative_path($recipe_image)."', CURRENT_TIMESTAMP)";   
							if(mysqli_query($con, $query)){
								$rcp_img_id = mysqli_insert_id($con); 
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Image(".$rcp_img_id.") added into RECIPE_IMG table");
							}
							else{
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to insert into RECIPE_IMG table.");
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed query : ".$query);
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
								throw new Exception("Failed to insert into RECIPE_IMG table");
							}
							//insert into RECIPE_IMG table

							if (isset($rcp_images['tmp_name'][$i])){
								$tmpFilePath = $rcp_images['tmp_name'][$i];
								move_uploaded_file($tmpFilePath, $recipe_image);
								$atleast_one_uploaded = true;
								LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Recipe Image(".$recipe_image.") uploaded");
								
								if(!Util::check_for_null($primaryRecipeImage)){
									$primaryRecipeImage = $recipe_image;
								}  
							}
						}
						catch(Exception $e){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Image upload fail exception : ".$e->getMessage());
							$upload_failed = true;
						}
					}

					if(!$atleast_one_uploaded){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Could not upload atleast one recipe image");
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Rolling back !");
						throw new Exception("Could not upload atleast one recipe image");
					}

					$response = array();
					if($upload_failed){
						$response['err_message'] = "Few of the images could not be uploaded !";
					}
					else{
						$response['err_message'] = "Recipe submitted successfully !";
					}
					//upload images. if atleast one image is uploaded, warn the user but recipe mut be added without rolling back

					$response['isError'] = false;
					//add recipe
					
					Timeline::addTimeline($con, $user_id, $user_id, RECIPE_ADD, $rcp_id, DEFAULT_SCOPE_ID);
					MailUtil::recipeEmail(RECIPE_SUBMIT, User::getEmail($con, $user_id), User::getUsername($con, $user_id), "Your Recipe is Posted", $primaryRecipeImage, $rcp_nm);
				}
				//if the $rcp_id is null/empty, user is adding a new recipe

				mysqli_commit($con);
				//submit recipe transaction ends here
				
				//response
				return json_encode($response);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				$response['err_message'] = "FAIL";
				$response['isError'] = true;

				mysqli_rollback($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function getRecipeSteps($con, $rcp_id){
			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp_id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT RCP_STPS_ID, RCP_STEP
						FROM `RECIPE_STEPS` 
						WHERE RCP_ID = '".$rcp_id."'";
						
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_obj = $result->fetch_object()){
					array_push($result_array, $result_obj->RCP_STEP); 
				}
				
				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function fetchUserViewedRecipes($user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get all recipes for $user_id
				$query = "SELECT RCP.RCP_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME, RCP.CREATE_DTM, RCP.MOD_DTM, USR.NAME
								FROM `RECIPE` AS RCP 
								INNER JOIN `USER` USR ON USR.USER_ID = RCP.USER_ID
								INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
								INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
								INNER JOIN `VIEWS` AS VW ON VW.USER_ID = RCP.USER_ID AND VW.RCP_ID = RCP.RCP_ID
								WHERE RCP.USER_ID = '$user_id'
								AND RCP.IS_DEL = 'N'
								ORDER BY RCP.MOD_DTM DESC, RCP.CREATE_DTM DESC
								LIMIT ".$index." , ".RECIPES_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$recipe_array = array();

					$recipe_array['RCP_ID'] = $result_data->RCP_ID;
					$recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
					$recipe_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
					$recipe_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
					$recipe_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$recipe_array['MOD_DTM'] = $result_data->MOD_DTM;
					$recipe_array['NAME'] = $result_data->NAME;

					//fetch likes for the recipe
					$query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE_ID = '$result_data->RCP_ID' AND TYPE = 'RECIPE' AND IS_DEL = 'N'";
					$likes_result = mysqli_query($con, $query);

					if($likes_result_data = $likes_result->fetch_object()){
						$recipe_array['likes'] = $likes_result_data->LIKES_COUNT;
					}
					//fetch likes for the recipe

					//fetch views for the recipe
					$query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$result_data->RCP_ID'";
					$views_result = mysqli_query($con, $query);

					if($views_result_data = $views_result->fetch_object()){
						$recipe_array['views'] = $views_result_data->VIEWS_COUNT;
					}
					//fetch views for the recipe

					//fetch avg rating for the recipe
					$query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$result_data->RCP_ID'";
					$review_result = mysqli_query($con, $query);

					if($review_result_data = $review_result->fetch_object()){
						$recipe_array['rating'] = $review_result_data->RATING;
					}
					//fetch avg rating for the recipe

					//fetch images for the recipe
					$query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$result_data->RCP_ID' LIMIT 1";
					$img_result = mysqli_query($con, $query);

					$img_result_array = array();
					if($img_result_data = $img_result->fetch_object()){
						array_push($img_result_array, $img_result_data->RCP_IMG); 
					}
					$recipe_array['RCP_IMGS'] = $img_result_array;
					//fetch images for the recipe

					array_push($result_array, $recipe_array); 
				}
				//get all recipes for $user_id

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total Recipes fetched : ".sizeof($result_array));

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUserReviewedRecipes($user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get all recipes for $user_id
				$query = "SELECT RCP.RCP_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME, RCP.CREATE_DTM, RCP.MOD_DTM, USR.NAME
								FROM `RECIPE` AS RCP 
								INNER JOIN `USER` USR ON USR.USER_ID = RCP.USER_ID
								INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
								INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
								INNER JOIN `REVIEWS` AS RW ON RW.USER_ID = RCP.USER_ID AND RW.RCP_ID = RCP.RCP_ID
								WHERE RCP.USER_ID = '$user_id'
								AND RW.IS_DEL = 'N'
								AND RCP.IS_DEL = 'N'
								ORDER BY RCP.MOD_DTM DESC, RCP.CREATE_DTM DESC
								LIMIT ".$index." , ".RECIPES_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$recipe_array = array();

					$recipe_array['RCP_ID'] = $result_data->RCP_ID;
					$recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
					$recipe_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
					$recipe_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
					$recipe_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$recipe_array['MOD_DTM'] = $result_data->MOD_DTM;
					$recipe_array['NAME'] = $result_data->NAME;

					//fetch likes for the recipe
					$query = "SELECT COUNT(*) AS LIKES_COUNT FROM `LIKES` WHERE TYPE_ID = '$result_data->RCP_ID' AND TYPE = 'RECIPE' AND IS_DEL = 'N'";
					$likes_result = mysqli_query($con, $query);

					if($likes_result_data = $likes_result->fetch_object()){
						$recipe_array['likes'] = $likes_result_data->LIKES_COUNT;
					}
					//fetch likes for the recipe

					//fetch views for the recipe
					$query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$result_data->RCP_ID'";
					$views_result = mysqli_query($con, $query);

					if($views_result_data = $views_result->fetch_object()){
						$recipe_array['views'] = $views_result_data->VIEWS_COUNT;
					}
					//fetch views for the recipe

					//fetch avg rating for the recipe
					$query = "SELECT IFNULL(ROUND(AVG(RATING), 1), 0) AS RATING FROM REVIEWS WHERE RCP_ID = '$result_data->RCP_ID'";
					$review_result = mysqli_query($con, $query);

					if($review_result_data = $review_result->fetch_object()){
						$recipe_array['rating'] = $review_result_data->RATING;
					}
					//fetch avg rating for the recipe

					//fetch images for the recipe
					$query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$result_data->RCP_ID' LIMIT 1";
					$img_result = mysqli_query($con, $query);

					$img_result_array = array();
					if($img_result_data = $img_result->fetch_object()){
						array_push($img_result_array, $img_result_data->RCP_IMG); 
					}
					$recipe_array['RCP_IMGS'] = $img_result_array;
					//fetch images for the recipe

					array_push($result_array, $recipe_array); 
				}
				//get all recipes for $user_id

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total Recipes fetched : ".sizeof($result_array));

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUsersRecipes($user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get all recipes for $user_id
				$query = "SELECT RCP.RCP_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME, RCP.CREATE_DTM, RCP.MOD_DTM
								FROM `RECIPE` AS RCP 
								INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
								INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
								WHERE RCP.USER_ID = '$user_id'
								AND RCP.IS_DEL = 'N'
								ORDER BY RCP.MOD_DTM DESC, RCP.CREATE_DTM DESC
								LIMIT ".$index." , ".RECIPES_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$recipe_array['RCP_ID'] = $result_data->RCP_ID;
					$recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
					$recipe_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$recipe_array['MOD_DTM'] = $result_data->MOD_DTM;
					
					$recipe_array['foodCuisineName'] = $result_data->FOOD_CSN_NAME;
					$recipe_array['foodTypeName'] = $result_data->FOOD_TYP_NAME;

					//like count
					$recipe_array['likesCount'] = Like::getLikeCount($con, "RECIPE", $result_data->RCP_ID);
					//like count
					
					//views count
					$recipe_array['viewsCount'] = View::getViewCount($con, $result_data->RCP_ID);
					//views count
					
					//comments count
					$recipe_array['commentsCount'] = Comment::getCommentsCount($con, "RECIPE", $result_data->RCP_ID);	
					//comments count
					
					//if the user has liked recipe
					$recipe_array['userLiked'] = Like::isUserLiked($con, $user_id, "RECIPE", $result_data->RCP_ID);
					//if the user has liked recipe
					
					//if the user has reviewed recipe
					$recipe_array['userReviewed'] = Review::isUserReviewed($con, $user_id, $result_data->RCP_ID);
					//if the user has reviewed recipe

					//If the recipe is marked as Favourite for the logged in user
					$recipe_array['userFavorite'] = Favourites::getFavouriteStatus($con, $result_data->RCP_ID, $user_id);
					//If the recipe is marked as Favourite for the logged in user
					
					//fetch recipe avg rating
					$recipe_array['avgRating'] = self::getRecipeAvgRating($con, $result_data->RCP_ID);
					//fetch recipe avg rating

					//fetch primary image for the recipe
					$recipe_array['images'] = self::getRecipePrimaryImage($con, $user_id, $result_data->RCP_ID);
					//fetch primary image for the recipe

					array_push($result_array, $recipe_array); 
				}
				//get all recipes for $user_id

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total Recipes fetched : ".sizeof($result_array));

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchFavoriteRecipes($user_id, $index){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			
			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get all recipes for $user_id
				$query = "SELECT RCP.RCP_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, FDTYP.FOOD_TYP_NAME, RCP.CREATE_DTM, RCP.MOD_DTM, USR.NAME
						FROM `RECIPE` AS RCP 
						INNER JOIN `USER` USR ON USR.USER_ID = RCP.USER_ID
						INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
						INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
						INNER JOIN `LIKES` AS LIK ON LIK.USER_ID = RCP.USER_ID AND LIK.TYPE_ID = RCP.RCP_ID
						INNER JOIN `FAVOURITES` AS FAV ON FAV.USER_ID = RCP.USER_ID
						WHERE RCP.USER_ID = '$user_id'
						AND LIK.TYPE = 'RECIPE'
						AND LIK.IS_DEL = 'N'
						AND RCP.IS_DEL = 'N'
						AND FAV.IS_DEL = 'N'
						ORDER BY RCP.MOD_DTM DESC, RCP.CREATE_DTM DESC
						LIMIT ".$index." , ".RECIPES_COUNT;

				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
					$recipe_array = array();

					$recipe_array['RCP_ID'] = $result_data->RCP_ID;
					$recipe_array['RCP_NAME'] = $result_data->RCP_NAME;
					$recipe_array['FOOD_CSN_NAME'] = $result_data->FOOD_CSN_NAME;
					$recipe_array['FOOD_TYP_NAME'] = $result_data->FOOD_TYP_NAME;
					$recipe_array['CREATE_DTM'] = $result_data->CREATE_DTM;
					$recipe_array['MOD_DTM'] = $result_data->MOD_DTM;
					$recipe_array['NAME'] = $result_data->NAME;

					//like count
					$recipe_array['likesCount'] = Like::getLikeCount($con, "RECIPE", $result_data->RCP_ID);
					//like count
					
					//views count
					$recipe_array['viewsCount'] = View::getViewCount($con, $result_data->RCP_ID);
					//views count
					
					//comments count
					$recipe_array['commentsCount'] = Comment::getCommentsCount($con, "RECIPE", $result_data->RCP_ID);	
					//comments count
					
					//if the user has liked recipe
					$recipe_array['userLiked'] = Like::isUserLiked($con, $user_id, "RECIPE", $result_data->RCP_ID);
					//if the user has liked recipe
					
					//if the user has reviewed recipe
					$recipe_array['userReviewed'] = Review::isUserReviewed($con, $user_id, $result_data->RCP_ID);
					//if the user has reviewed recipe

					//If the recipe is marked as Favourite for the logged in user
					$recipe_array['userFavorite'] = Favourites::getFavouriteStatus($con, $result_data->RCP_ID, $user_id);
					//If the recipe is marked as Favourite for the logged in user
					
					//fetch recipe avg rating
					$recipe_array['avgRating'] = self::getRecipeAvgRating($con, $result_data->RCP_ID);
					//fetch recipe avg rating

					//fetch primary image for the recipe
					$recipe_array['RCP_IMGS'] = self::getRecipePrimaryImage($con, $user_id, $result_data->RCP_ID);
					//fetch primary image for the recipe

					array_push($result_array, $recipe_array); 
				}
				//get all recipes for $user_id

				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total Recipes fetched : ".sizeof($result_array));

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}	
		}
		
		public static function fetchRecipeReview($rcp_id, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}

			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get review for $rcp_id & $user_id
				$query = "SELECT RATING, REVIEW, CREATE_DTM, MOD_DTM FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()){
				  $result_array['RATING'] = $result_data->RATING;
				  $result_array['REVIEW'] = $result_data->REVIEW;
				}
				else{
				  $result_array['RATING'] = "0";
				  $result_array['REVIEW'] = "";
				}
				//get review for $rcp_id & $user_id

				//response
				return json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchRecipe($rcp_id, $user_id){
			//validations
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."recipe id");
				return;
			}

			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}
			//validations

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				$query = "SELECT USR.IMG, USR.NAME, RCP.USER_ID, RCP.RCP_ID, RCP.RCP_NAME, FDCSN.FOOD_CSN_NAME, 
						FDTYP.FOOD_TYP_NAME, FDCSN.FOOD_CSN_ID, FDTYP.FOOD_TYP_ID
						FROM `RECIPE` AS RCP 
						INNER JOIN `FOOD_CUISINE` AS FDCSN ON RCP.FOOD_CSN_ID = FDCSN.FOOD_CSN_ID
						INNER JOIN `FOOD_TYPE` AS FDTYP ON RCP.FOOD_TYP_ID = FDTYP.FOOD_TYP_ID
						INNER JOIN `USER` AS USR ON RCP.USER_ID = USR.USER_ID 
						WHERE RCP.RCP_ID = '$rcp_id'
						AND RCP.IS_DEL = 'N'";

				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()){
					$result_array['RCP_ID'] = $result_data->RCP_ID;
					$result_array['RCP_NAME'] = $result_data->RCP_NAME;
					$result_array['FOOD_TYP_ID'] = $result_data->FOOD_TYP_ID;
					$result_array['FOOD_CSN_ID'] = $result_data->FOOD_CSN_ID;
					
					$result_array['foodCuisineName'] = $result_data->FOOD_CSN_NAME;
					$result_array['foodTypeName'] = $result_data->FOOD_TYP_NAME;
					
					$result_array['userName'] = $result_data->NAME;
					$result_array['userImage'] = $result_data->IMG;
					$result_array['USER_ID'] = $result_data->USER_ID;
					
					//steps
					$result_array['steps'] = self::getRecipeSteps($con, $rcp_id);
					//steps

					//images
 					$result_array['images'] = self::getRecipeImages($con, $user_id, $rcp_id);
					//images

					//ingredients
					$result_array['ingredients'] = self::getRecipeIngredients($con, $rcp_id);
					//ingredients

					//like count
					$result_array['likesCount'] = Like::getLikeCount($con, "RECIPE", $rcp_id);
					//like count
					
					//views count
					$result_array['viewsCount'] = View::getViewCount($con, $rcp_id);
					//views count
					
					//comments count
					$result_array['commentsCount'] = Comment::getCommentsCount($con, "RECIPE", $rcp_id);	
					//comments count
					
					//if the user has liked recipe
					$result_array['userLiked'] = Like::isUserLiked($con, $user_id, "RECIPE", $rcp_id);
					//if the user has liked recipe
					
					//if the user has reviewed recipe
					$result_array['userReviewed'] = Review::isUserReviewed($con, $user_id, $rcp_id);
					//if the user has reviewed recipe

					//If the recipe is marked as Favourite for the logged in user
					$result_array['userFavorite'] = Favourites::getFavouriteStatus($con, $rcp_id, $user_id);
					//If the recipe is marked as Favourite for the logged in user

					//check if the user has viewed this recipe. if not, register it.
					$user_has_viewed_query = "SELECT COUNT(*) AS VIEWS_COUNT FROM `VIEWS` WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
					$user_has_viewed_result = mysqli_query($con, $user_has_viewed_query);

					if($user_has_viewed_result_data = $user_has_viewed_result->fetch_object()) {
						if($user_has_viewed_result_data->VIEWS_COUNT == 0){
							$register_user_view_query = "INSERT INTO `VIEWS`(`USER_ID`, `RCP_ID`, `CREATE_DTM`) VALUES('$user_id', '$rcp_id', CURRENT_TIMESTAMP)";
							mysqli_query($con, $register_user_view_query);
						}
					}
					//check if the user has viewed this recipe. if not, register it.

					//fetch recipe avg rating
					$result_array['avgRating'] = self::getRecipeAvgRating($con, $rcp_id);
					//fetch recipe avg rating

					$response_array = array();
					array_push($response_array, $result_array);

					//response
					return json_encode($response_array);
					//response
				}
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, 'Error ! Could not fetch recipe');
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, $e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function deleteRecipe($rcp_id, $user_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."user id");
				return;
			}

			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."rcp id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//transaction begin
				DatabaseUtil::beginTransaction($con);
				
				//delete recipe
				$query = "UPDATE `RECIPE` SET IS_DEL = 'Y' WHERE RCP_ID = '".$rcp_id."' AND USER_ID = '".$user_id."'";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "Recipe('$rcp_id') successfully deleted by the user('$user_id')");
					
					$result_arr["err_code"] = "0";
					$result_arr["isError"] = false;
					$result_arr["err_message"] = "Recipe deleted !";
					
					$primaryRecipeImage = array_slice(self::getRecipePrimaryImage($con, $user_id, $rcp_id), 0);
					$rcp_nm = self::getRecipeName($con, $rcp_id);
					
					//register timeline
					Timeline::addTimeline($con, $user_id, $user_id, RECIPE_REMOVE, $rcp_id, DEFAULT_SCOPE_ID);
					MailUtil::recipeEmail(RECIPE_REMOVE, User::getEmail($con, $user_id), User::getUsername($con, $user_id), "Your Recipe is Deleted", 
										  Util::getAbsolutePath($primaryRecipeImage[0]["RCP_IMG"]), $rcp_nm);
				}
				else{
					$result_arr["err_code"] = "1";
					$result_arr["isError"] = true;
					$result_arr["err_message"] = "Recipe delete failed !";
					
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed !! Recipe('$rcp_id') could not be deleted by the user('$user_id')");
					throw new Exception("Failed to delete recipe");
				} 
				//delete recipe
				
				//transaction end
				DatabaseUtil::endTransaction($con);
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Something went wrong !");
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				
				$result_arr["err_code"]="1";
				$result_arr["isError"]=true;
				$result_arr["err_message"]="Recipe delete failed !";
				
				//roll back
				DatabaseUtil::rollbackTransaction($con);
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
				
				return json_encode($result_arr);
			}
		}
	}
?>