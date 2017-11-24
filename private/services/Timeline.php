<?php
	class Timeline{
		public static function addTimeline($con, $user_id, $ref_user_id, $type, $type_id){
			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($ref_user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty ref user id");
				return;
			}

			if(!Util::check_for_null($type)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty type");
				return;
			}

			if(!Util::check_for_null($type_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty type id");
				return;
			}
			//check for null/empty

			try{
				//register the timeline
				$query = "INSERT INTO `TIMELINES` (`USER_ID`, `REF_USER_ID`, `TYPE`, `TYPE_ID`, `CREATE_DTM`) VALUES ('$user_id', '$ref_user_id', '$type', '$type_id', CURRENT_TIMESTAMP)";

				if(mysqli_query($con, $query)){
					LoggerUtil::logger(__CLASS__, "I" , "Registered a timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.")");
				}
				else{
					LoggerUtil::logger(__CLASS__, "E", "Failed !! The timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.") could not be registered");
				} 
				//register the timeline
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
		}
		
		public static function fetchUserTimeline($tmln_id){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$tmln_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($tmln_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty timeline id");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get timeline details for $tmln_id
				$query = "SELECT TMLN_ID, TYPE, TYPE_ID, TMLN.CREATE_DTM, USR.USER_ID, USR.NAME, USR.IMG 
						  FROM `TIMELINES` AS TMLN
						  INNER JOIN `USER` AS USR ON USR.USER_ID = TMLN.USER_ID
						  WHERE TMLN_ID = '$tmln_id'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				if($result_data = $result->fetch_object()){
					$timeline_array = array();
					$type = $result_data->TYPE;

					$timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
					$timeline_array['TYPE'] = $result_data->TYPE;
					$timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
					$timeline_array['whoName'] = $result_data->NAME;
					$timeline_array['whoUserId'] = $result_data->USER_ID;
					$timeline_array['whoUserImage'] = $result_data->IMG;
					$timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;

					if(USER_ADD == $type){
						$timeline_query = "SELECT CREATE_DTM FROM `USER` WHERE USER_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							$timeline_array['USER_ID'] = $result_data->TYPE_ID;
							$timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
						}
					}
					else if(RECIPE_ADD == $type || RECIPE_MODIFY == $type || RECIPE_REMOVE == $type){
						$timeline_query = "SELECT RCP.RCP_ID, RCP_NAME, FOOD_TYP_NAME, FOOD_CSN_NAME,
										USR.NAME AS WHOSE_NAME, USR.USER_ID AS WHOSE_USER_ID, USR.IMG AS RCP_OWN_IMG
										FROM `RECIPE` AS RCP
										INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										WHERE RCP.RCP_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else if(COMMENT_RECIPE_ADD == $type || COMMENT_RECIPE_REMOVE == $type){
						$timeline_query = "SELECT RCP.RCP_ID, RCP_NAME, COMMENT, FOOD_TYP_NAME, FOOD_CSN_NAME,
										   USR.NAME AS WHOSE_NAME, USR.USER_ID AS WHOSE_USER_ID, USR.IMG AS RCP_OWN_IMG
										   FROM `COMMENTS` AS COM
										   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = COM.RCP_ID
										   INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										   INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										   WHERE COM_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							$timeline_array['comment'] = $timeline_result_data->COMMENT;

							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else if(LIKE_RECIPE_ADD == $type || LIKE_RECIPE_REMOVE == $type){
						$timeline_query = "SELECT RCP.RCP_ID, RCP_NAME, FOOD_TYP_NAME, FOOD_CSN_NAME,
										   USR.NAME AS WHOSE_NAME, USR.USER_ID AS WHOSE_USER_ID, USR.IMG AS RCP_OWN_IMG
										   FROM `LIKES` AS LIK
										   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = LIK.TYPE_ID
										   INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										   INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										   WHERE LIKE_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else if(LIKE_COMMENT_ADD == $type || LIKE_COMMENT_REMOVE == $type){
						$timeline_query = "SELECT COMMENT, RCP.RCP_ID, RCP_NAME, FOOD_TYP_NAME, FOOD_CSN_NAME,
										   USR.NAME AS WHOSE_NAME, USR.USER_ID AS USR, USR.IMG AS RCP_OWN_IMG
										   FROM `LIKES` AS LIK
										   INNER JOIN `COMMENTS` AS COM ON COM.COM_ID = LIK.TYPE_ID
										   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = COM.RCP_ID
										   INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										   INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										   WHERE LIKE_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							$timeline_array['comment'] = $timeline_result_data->COMMENT;

							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else if(LIKE_REVIEW_ADD == $type || LIKE_REVIEW_REMOVE == $type){
						$timeline_query = "SELECT REVIEW, RATING, RCP.RCP_ID, RCP_NAME, FOOD_TYP_NAME, FOOD_CSN_NAME,
										   USR.NAME AS WHOSE_NAME, USR.USER_ID AS USR, USR.IMG AS RCP_OWN_IMG
										   FROM `LIKES` AS LIK
										   INNER JOIN `REVIEWS` AS REV ON REV.REV_ID = LIK.TYPE_ID
										   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
										   INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										   INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										   WHERE LIKE_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							$timeline_array['review'] = $timeline_result_data->REVIEW;
							$timeline_array['rating'] = $timeline_result_data->RATING;

							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else if(REVIEW_RECIPE_ADD == $type || REVIEW_RECIPE_REMOVE == $type){
						$timeline_query = "SELECT REVIEW, RATING, RCP.RCP_ID, RCP_NAME, NAME, RCP.USER_ID, USR.IMG, FOOD_TYP_NAME, FOOD_CSN_NAME,
										   USR.NAME AS WHOSE_NAME, USR.USER_ID AS USR, USR.IMG AS RCP_OWN_IMG
										   FROM `REVIEWS` AS REV
										   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
										   INNER JOIN `FOOD_TYPE` AS FOOD_TYPE ON FOOD_TYPE.FOOD_TYP_ID = RCP.FOOD_TYP_ID
										   INNER JOIN `FOOD_CUISINE` AS FOOD_CUISINE ON FOOD_CUISINE.FOOD_CSN_ID = RCP.FOOD_CSN_ID
										   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
										   WHERE LIKE_ID = '$result_data->TYPE_ID'";
						$timeline_result = mysqli_query($con, $timeline_query);

						if($timeline_result_data = $timeline_result->fetch_object()){
							$timeline_array['review'] = $timeline_result_data->REVIEW;
							$timeline_array['rating'] = $timeline_result_data->RATING;

							//recipe details
							$timeline_array['recipeId'] = $timeline_result_data->RCP_ID;
							$timeline_array['recipeName'] = $timeline_result_data->RCP_NAME;
							$timeline_array['recipeTypeName'] = $timeline_result_data->FOOD_TYP_NAME;
							$timeline_array['recipeCuisineName'] = $timeline_result_data->FOOD_CSN_NAME;
							$timeline_array['recipeOwnerImg'] = $timeline_result_data->RCP_OWN_IMG;
							$timeline_array['whoseName'] = $timeline_result_data->WHOSE_NAME;
							$timeline_array['whoseUserId'] = $timeline_result_data->WHOSE_USER_ID;

							//get 1st image for the recipe
							$recipe_image_query = "SELECT RCP_IMG FROM `RECIPE_IMG` WHERE RCP_ID = '$timeline_result_data->RCP_ID' LIMIT 1";
							$recipe_image_result = mysqli_query($con, $recipe_image_query);

							if($recipe_image_result_data = $recipe_image_result->fetch_object()){
							   $timeline_array['recipeImage'] = $recipe_image_result_data->RCP_IMG;
							}
							//get 1st image for the recipe
							//recipe details
						}
					}
					else{
						LoggerUtil::logger(__CLASS__, "E", 'Error ! The timeline type('.$result->TYPE.') is not yet implemented.');
					}

					array_push($result_array, $timeline_array);
				}
				//get timeline details for $tmln_id

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
		
		public static function fetchUserTimelines($user_id, $index){
			//request
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, "I", "REQUEST PARAM : index(".$index.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($index)){
				LoggerUtil::logger(__CLASS__, "E", "Error ! null/empty index");
				return;
			}
			//check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//get timeline performed by user or performed on his items
				$query = "SELECT TMLN_ID, TYPE, TYPE_ID, USER_ID, REF_USER_ID, CREATE_DTM FROM `TIMELINES` WHERE USER_ID = '$user_id' OR REF_USER_ID = '$user_id' LIMIT $index , ".TIMELINES_COUNT;
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()){
				$timeline_array = array();

				$timeline_array['TMLN_ID'] = $result_data->TMLN_ID;
				$timeline_array['TYPE'] = $result_data->TYPE;
				$timeline_array['TYPE_ID'] = $result_data->TYPE_ID;
				$timeline_array['CREATE_DTM'] = $result_data->CREATE_DTM;
				$timeline_array['USER_ID'] = $result_data->USER_ID;;
				$timeline_array['REF_USER_ID'] = $result_data->REF_USER_ID;;

				array_push($result_array, $timeline_array);
				}
				//get timeline performed by user or performed on his items

				//response
				echo json_encode($result_array);
				//response
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	}
?>