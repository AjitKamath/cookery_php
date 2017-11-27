<?php
	class Comment{
		public static function deleteComment($com_id, $user_id){
            //request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : com_id(".$com_id.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
                return;
            }

            if(!Util::check_for_null($com_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty com id");
                return;
            }
            //check for null/empty

            try{
                $con = DatabaseUtil::getInstance()->open_connection();

                //delete comment
                $query = "UPDATE `COMMENTS` SET IS_DEL = 'Y' WHERE COM_ID = '".$com_id."' AND USER_ID = '".$user_id."'";

                if(mysqli_query($con,  $query)){
                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "Comment('$com_id') successfully deleted by the user('$user_id')");
                    echo "SUCCESS";

                    //register timeline
                    Timeline::addTimeline($con, $user_id, $user_id, COMMENT_RECIPE_REMOVE, $com_id);
                    //register timeline
                }
                else{
                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! Comment('$com_id') could not be deleted by the user('$user_id')");
                    echo "FAIL";
                } 
                //delete comment
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
                echo "FAIL";
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
            }
        }
        
        public static function fetchRecipeComments($rcp_id){
            //request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($rcp_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp id");
                return;
            }
            //check for null/empty

            try{
                $con = DatabaseUtil::getInstance()->open_connection();

                //get comments for $rcp_id
                $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG, COM.COMMENT, COM.CREATE_DTM, COM.MOD_DTM FROM COMMENTS COM 
                          INNER JOIN USER USR ON USR.USER_ID = COM.USER_ID WHERE RCP_ID = '$rcp_id' AND COM.IS_DEL = 'N'";
                $result = mysqli_query($db,$query);

                $result_array = array();
                while($result_data = $result->fetch_object()){
                    array_push($result_array, $result_data);
                }
                //get comments for $rcp_id

                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "Total comments fetched : ".sizeof($result_array));

                //response
                echo json_encode($result_array);
                //response
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
            }
        }
        
        public static function submitComment($rcp_id, $user_id, $comment){
            //request
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : user_id(".$user_id.")");
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I", "REQUEST PARAM : comment(".$comment.")");
            //request

            //check for null/empty
            if(!Util::check_for_null($user_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty user id");
                return;
            }

            if(!Util::check_for_null($rcp_id)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty rcp id");
                return;
            }

            if(!Util::check_for_null($comment)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty comment");
                return;
            }
            //check for null/empty

            try{
                $con = DatabaseUtil::getInstance()->open_connection();

                //insert comment
                $query = "INSERT INTO `COMMENTS`(`RCP_ID`, `USER_ID`, `COMMENT`, `CREATE_DTM`) VALUES('$rcp_id', '$user_id', '$comment', CURRENT_TIMESTAMP)";

                if(mysqli_query($con, $query)){
                    $com_id = mysqli_insert_id($con);

                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "I" , "Comment('$comment') successfully submitted by the user('$user_id') for the recipe('$rcp_id')");

                    echo "SUCCESS";

                    //register timeline
                    //get user_id of the recipe
                    $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
                    $result = mysqli_query($con, $query);
                    if($result_data = $result->fetch_object()){  
                        Timeline::addTimeline($con, $user_id, $result_data->USER_ID, COMMENT_RECIPE_ADD, $com_id);
                    }
                    //get user_id of the recipe
                    //register timeline
                }
                else{
                    LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Failed !! Comment('$comment') could not be submitted by the user('$user_id') for the recipe('$rcp_id')");
                    echo "FAIL";
                } 
                //insert comment
            }
            catch(Exception $e){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
                echo "FAIL";
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
            }
        }
    }
?>