<?php
    include_once('import_util.php');

    $filename = "submitreview.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $review = isset($_POST['review']) ? $_POST['review'] : '';
    $rating = isset($_POST['rating']) ? $_POST['rating'] : '';

    logger($filename, "I", "REQUEST PARAM : rcp_id(".$rcp_id.")");
    logger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    logger($filename, "I", "REQUEST PARAM : review(".$review.")");
    logger($filename, "I", "REQUEST PARAM : rating(".$rating.")");
    //request

    //check for null/empty
    if(!check_for_null($user_id)){
        logger($filename, "E", "Error ! null/empty user id");
        return;
    }

    if(!check_for_null($rcp_id)){
        logger($filename, "E", "Error ! null/empty rcp id");
        return;
    }

    if(!check_for_null($review)){
        logger($filename, "E", "Error ! null/empty review");
        return;
    }

    if(!check_for_null($rating)){
        logger($filename, "E", "Error ! null/empty rating");
        return;
    }
    //check for null/empty

    try{
        $con = open_connection();
        
        //check if user already reviewed the $rcp_id
        $query = "SELECT REV_ID, IS_DEL FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
        $result = mysqli_query($con, $query);

        //user has already reviewed
        if($result_data = $result->fetch_object()){
            $query = "UPDATE REVIEWS SET IS_DEL = 'N', REVIEW = '$review', MOD_DTM = CURRENT_TIMESTAMP, RATING = '$rating' WHERE RCP_ID = $rcp_id AND USER_ID = $user_id";

            if(mysqli_query($con, $query)){
                logger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
                
                //register timeline
                //get user_id of the recipe
                $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
                $result = mysqli_query($con, $query);
                if($result_data = $result->fetch_object()){  
                    include_once('registerusertimeline.php');
                    register_timeline($user_id, $result_data->USER_ID, REVIEW_RECIPE_MODIFY, $result->REV_ID);
                }
                //get user_id of the recipe
                //register timeline
            }
            else{
                logger($filename, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
            }
        }
        //user is reviewing for the first time
        else{
            $query = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`) VALUES('$rcp_id', '$user_id', '$review', '$rating' , CURRENT_TIMESTAMP)";

            if(mysqli_query($con, $query);){
                $rev_id = mysqli_insert_id($con);
                
                logger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
                
                //register timeline
                //get user_id of the recipe
                $query = "SELECT USER_ID FROM `RECIPE` WHERE RCP_ID = '$rcp_id'";
                $result = mysqli_query($con, $query);
                if($result_data = $result->fetch_object()){  
                    register_timeline($con, $user_id, $result_data->USER_ID, REVIEW_RECIPE_ADD, $rev_id);
                }
                //get user_id of the recipe
                //register timeline
            }
            else{
                logger($filename, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
            } 
        }
        //check if user already reviewed the $rcp_id

        $result_array = array();

        //check users review status
        $query = "SELECT COUNT(*) AS REVIEW_COUNT FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
        $result = mysqli_query($con, $query);

        if($result_data = $result->fetch_object()){
            if($result_data->REVIEW_COUNT > 0){
                $result_array['isReviewed'] = true;
            }
            else{
                $result_array['isReviewed'] = false;
            }
        }
        //check users review status

        //get avg rating of the $rcp_id
        $query = "SELECT ROUND(AVG(RATING), 1) AS RATING FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id' AND IS_DEL = 'N'";
        $result = mysqli_query($con, $query);

        if($result_data = $result->fetch_object()){
            $result_array['rating'] = $result_data->RATING;
        }
        //get avg rating of the $rcp_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
    finally{
        close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>