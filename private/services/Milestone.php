<?php
	class Milestone{
		public static function getRankAndMilestone($con, $rank_id, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rank_id(".$rank_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($rank_id)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rank_id");
					return;
			}
			//check for null/empty
			
			try{
				//fetch current & next rank & milestone
				$query = "SELECT MLT_ID, RNK.RANK_ID, RANK_NAME, TYPE, NUMBER 
									FROM `MILESTONE` AS MLT
									INNER JOIN `RANK` AS RNK ON RNK.RANK_ID = MLT.RANK_ID
									WHERE RNK.RANK_ID = '".$rank_id."'";
				$result = mysqli_query($con, $query);

				$result_array = array();
				while($result_data = $result->fetch_object()) {
					$temp_array['RANK_NAME'] = $result_data->RANK_NAME;
					$temp_array['RANK_ID'] = $result_data->RANK_ID;
					$temp_array['TYPE'] = $result_data->TYPE;
					$temp_array['NUMBER'] = $result_data->NUMBER;
					
					if(Util::check_for_null($user_id)){
						if("RECIPE" == $result_data->TYPE){
							$temp_array['currentNumber'] = Recipe::getRecipesCount($con, $user_id);
						}
						else if("LIKE" == $result_data->TYPE){
							$temp_array['currentNumber'] = Like::getUsersRecipesLikesCount($con, $user_id);
						}
						else if("REVIEW" == $result_data->TYPE){
							$temp_array['currentNumber'] = Review::getReviewsCount($con, $user_id);
						}
					}
					
					
					
					array_push($result_array, $temp_array);
				}

				return $result_array;
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
	}
?>