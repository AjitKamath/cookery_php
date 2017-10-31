<?php
    include 'application_context.php';
    include('constants.php');

    $filename = "submitrecipereview.php";

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

    try{
        //check if user already reviewed the $rcp_id
        $query = "SELECT REV_ID, IS_DEL FROM REVIEWS WHERE RCP_ID = '$rcp_id' AND USER_ID = '$user_id'";
        $result = mysqli_query($db,$query);

        //user has already reviewed
        if($result_data = $result->fetch_object()){
            $query = "UPDATE REVIEWS SET IS_DEL = 'N', REVIEW = '$review', MOD_DTM = CURRENT_TIMESTAMP, RATING = '$rating' WHERE RCP_ID = $rcp_id AND USER_ID = $user_id";

            if(mysqli_query($db,$query)){
                logger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
                
                //register timeline
                include_once('registerusertimeline.php');
                register_timeline($user_id, REVIEW_RECIPE_UPDATE, $result->REV_ID);
                //register timeline
            }
            else{
                logger($filename, "E", "Failed !! The user(".$user_id.") could not review the recipe('$rcp_id') successfully.");
            }
        }
        //user is reviewing for the first time
        else{
            $query = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`) VALUES('$rcp_id', '$user_id', '$review', '$rating' , CURRENT_TIMESTAMP)";

            if($review_id = $mysqli->query($query)){
                logger($filename, "I", "The user(".$user_id.") has reviewed recipe('$rcp_id') successfully.");
                
                //register timeline
                session_start();
                $_SESSION["user_id"] = $user_id;
                $_SESSION["type"] = REVIEW_RECIPE_ADD;
                $_SESSION["type_id"] = $review_id;
                header('Location: registerusertimeline.php'); 
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
        $result = mysqli_query($db,$query);

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
        $result = mysqli_query($db,$query);

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

    logger($filename, "I", "-------------".$filename."-------------");
?>