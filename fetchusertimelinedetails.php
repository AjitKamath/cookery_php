<?php
    include('application_context.php');
    include('constants.php');

    $filename = "fetchusertimelinedetails.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------"$filename"-------------");

    //request
    $tmln_id = isset($_POST['tmln_id']) ? $_POST['tmln_id'] : '';

    logger($filename, "I", "REQUEST PARAM : user_id("$tmln_id")");
    //request

    try{
        //get timeline details for $tmln_id
        $query = "SELECT TYPE, TYPE_ID FROM `TIMELINES` WHERE TMLN_ID '$tmln_id'";
        $result = mysqli_query($db, $query);

        $result_array = array();
        if($result_data = $result->fetch_object()){
            $timeline_array = array();
            $type = $result_data->TYPE;

            if(USER_ADD == $type){
                $timeline_query = "SELECT CREATE_DTM FROM `USER` WHERE USER_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['USER_ID'] = $timeline_result_data->TYPE_ID;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else if(RECIPE_ADD == $type || RECIPE_MODIFY == $type || RECIPE_REMOVE = $type){
                $timeline_query = "SELECT RCP_NAME, RCP_IMG, RCP.CREATE_DTM FROM `RECIPE` AS RCP
                                INNER JOIN `RECIPE_IMG` AS IMG ON RCP.RCP_ID = IMG.RCP_ID
                                WHERE RCP.RCP_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['RCP_ID'] = $result_data->TYPE_ID;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                    
                    $image_array = array();
                    $temparr['RCP_IMG'] = $timeline_result_data->RCP_IMG;
                    array_push($image_array, $temparr);
                    
                    $timeline_array['RCP_IMGS'] = $image_array;
                }
            }
            else if(COMMENT_RECIPE_ADD == $type || COMMENT_RECIPE_MODIFY == $type || COMMENT_RECIPE_REMOVE == $type){
                $timeline_query = "SELECT RCP_NAME, NAME, COM.CREATE_DTM FROM `COMMENTS` AS COM
                                   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = COM.RCP_ID
                                   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
                                   WHERE COM_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['COM_ID'] = $result_data->TYPE_ID;
                    $timeline_array['NAME'] = $timeline_result_data->NAME;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else if(LIKE_RECIPE_ADD == $type || LIKE_RECIPE_MODIFY == $type || LIKE_RECIPE_REMOVE == $type){
                $timeline_query = "SELECT RCP_NAME, NAME, LIK.CREATE_DTM FROM `LIKES` AS LIK
                                   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = LIK.RCP_ID
                                   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
                                   WHERE LIKE_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['LIKE_ID'] = $result_data->TYPE_ID;
                    $timeline_array['NAME'] = $timeline_result_data->NAME;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else if(LIKE_COMMENT_ADD == $type || LIKE_COMMENT_MODIFY == $type || LIKE_COMMENT_REMOVE == $type){
                $timeline_query = "SELECT NAME, RCP_NAME, LIK.CREATE_DTM FROM `LIKES` AS LIK
                                   INNER JOIN `COMMENTS` AS COM ON COM.COM_ID = LIK.TYPE_ID
                                   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = COM.RCP_ID
                                   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
                                   WHERE LIKE_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['LIKE_ID'] = $result_data->TYPE_ID;
                    $timeline_array['NAME'] = $timeline_result_data->NAME;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else if(LIKE_REVIEW_ADD == $type || LIKE_REVIEW_MODIFY == $type || LIKE_REVIEW_REMOVE == $type){
                $timeline_query = "SELECT NAME, RCP_NAME, LIK.CREATE_DTM FROM `LIKES` AS LIK
                                   INNER JOIN `REVIEWS` AS REV ON REV.REV_ID = LIK.TYPE_ID
                                   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
                                   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
                                   WHERE LIKE_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['LIKE_ID'] = $result_data->TYPE_ID;
                    $timeline_array['NAME'] = $timeline_result_data->NAME;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else if(REVIEW_RECIPE_ADD == $type || REVIEW_RECIPE_MODIFY == $type || REVIEW_RECIPE_REMOVE == $type){
                $timeline_query = "SELECT RATING, NAME, RCP_NAME, REV.CREATE_DTM FROM `REVIEWS` AS REV
                                   INNER JOIN `RECIPE` AS RCP ON RCP.RCP_ID = REV.RCP_ID
                                   INNER JOIN `USER` AS USR ON USR.USER_ID = RCP.USER_ID
                                   WHERE LIKE_ID '$result_data->TYPE_ID'";
                $timeline_result = mysqli_query($db, $timeline_query);
                
                if($timeline_result_data = $timeline_result->fetch_object()){
                    $timeline_array['REV_ID'] = $result_data->TYPE_ID;
                    $timeline_array['RATING'] = $timeline_result_data->RATING;
                    $timeline_array['NAME'] = $timeline_result_data->NAME;
                    $timeline_array['RCP_NAME'] = $timeline_result_data->RCP_NAME;
                    $timeline_array['createdDateTime'] = $timeline_result_data->CREATE_DTM;
                }
            }
            else{
                logger($filename, "E", 'Error ! The timeline type('.$result->TYPE.') is not yet implemented.');
            }

            array_push($result_array, $timeline_array);
        }
        //get timeline details for $tmln_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }

    logger($filename, "I", "-------------"$filename"-------------");
?>