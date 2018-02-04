<?php
	class Favourites{
      public static function submitFavourite($user_id, $rcp_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$rcp_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}

			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty recipe id");
				return;
			}
        
      //check for null/empty

			try{
				$con = DatabaseUtil::getInstance()->open_connection();

				//check if user has already marked recipe as favorite
				$query = "SELECT FAV_ID, IS_DEL FROM FAVOURITES WHERE USER_ID = '$user_id' AND RCP_ID = '$rcp_id' ";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){

					if('Y' == $result_data->IS_DEL){
						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has favorite recipe with recipe id(".$rcp_id."). and with indicator as Y");

						$query = "UPDATE FAVOURITES SET IS_DEL = 'N', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND RCP_ID = '$rcp_id' ";

						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has marked recipe again as favorite recipe with recipe id(".$rcp_id."). successfully.");
            }
          }
					else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has favorite recipe with recipe id(".$rcp_id."). and with indicator as N");

						$query = "UPDATE FAVOURITES SET IS_DEL = 'Y', MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND RCP_ID = '$rcp_id' ";

						if(mysqli_query($con, $query)){
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has marked recipe again as favorite recipe with recipe id(".$rcp_id."). successfully.");
            }
					}
				}
				
				//if there is no entry in FAVOURITES table
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "The user(".$user_id.") has not yet marked the recipe as favourite with recipe id(".$rcp_id."). So marking it");

					$query = "INSERT INTO `FAVOURITES` (`RCP_ID`, `USER_ID`, `IS_DEL` , `CREATE_DTM` , `MOD_DTM`) VALUES ('$rcp_id', '$user_id', 'N' , CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

					if(mysqli_query($con, $query)){
						$like_id = mysqli_insert_id($con);

						LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "The user(".$user_id.") has marked recipe as favorite with recipe id(".$rcp_id.") successfully.");
          }
        }
				$result_array = array();
        
        //check the status (favourite/Non-Favorite)
				$query = "SELECT IS_DEL AS FAV_STATUS FROM FAVOURITES WHERE USER_ID = '$user_id' AND RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);

				if($result_data = $result->fetch_object()){
					if($result_data->FAV_STATUS == 'Y'){
						$result_array['fabStatus'] = false;
					}
					else{
						$result_array['fabStatus'] = true;
					}
            $response_array = array();
					array_push($response_array, $result_array);

					//response
					echo json_encode($response_array);
					//response
        }
      }
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
			finally{
				DatabaseUtil::getInstance()->close_connection($con);
			}
		}
	
     public static function getFavouriteStatus($con, $rcp_id, $user_id){
			//request
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type(".$rcp_id.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : type_id(".$user_id.")");
			//request

			//check for null/empty
			if(!Util::check_for_null($rcp_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty recipe id");
				return;
			}

			if(!Util::check_for_null($user_id)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
				return;
			}
			//check for null/empty

			try{
				$query = "SELECT IS_DEL AS FAV_STATUS FROM FAVOURITES WHERE USER_ID = '$user_id' AND RCP_ID = '$rcp_id'";
				$result = mysqli_query($con, $query);
				if($result_data = $result->fetch_object()){
					if($result_data->FAV_STATUS == 'Y'){
						$result_array = false;
					}
					else{
						$result_array = true;
          }
				return $result_array;
        }
        else{
          return false;
        }
			}
			catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
			}
		}
        
	}
?>