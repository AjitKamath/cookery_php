<?php
    include 'application_context.php';

    $filename = "submitlike.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
    $type = isset($_POST['type']) ? $_POST['type'] : '';
    $type_id = isset($_POST['type_id']) ? $_POST['type_id'] : '';

    infologger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    infologger($filename, "I", "REQUEST PARAM : type(".$type.")");
    infologger($filename, "I", "REQUEST PARAM : type_id(".$type_id.")");
    //request

    try{
        //check if $user_id has already liked $type & $type_id
        $query = "SELECT LIKE_ID, IS_DEL FROM LIKES WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";
        $result = mysqli_query($db,$query);

        //if there is already an entry in LIKES table
        if($result_data = $result->fetch_object()){
            //if the user has unliked it, like it
            if('Y' == $result_data->IS_DEL){
                infologger($filename, "I", "The user(".$user_id.") has not liked the type(".$type.") with type id(".$type_id."). liking it.");

                $query = "UPDATE LIKES SET IS_DEL = 'N',MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

                if(mysqli_query($db,$query)){
                    infologger($filename, "I", "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");
                }
                else{
                    errlogger($filename, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
                }
            }
            //if the user has unliked it, like it
            //if the user has liked it, unlike it
            else{
                infologger($filename, "I", "The user(".$user_id.") has already liked the type(".$type.") with type id(".$type_id."). unliking it.");

                $query = "UPDATE LIKES SET IS_DEL = 'Y',MOD_DTM = CURRENT_TIMESTAMP WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' ";

                if(mysqli_query($db,$query)){
                    infologger($filename, "I", "The user(".$user_id.") has unliked the type(".$type.") with type id(".$type_id.") successfully.");
                }
                else{
                    errlogger($filename, "E", "Failed !! The user(".$user_id.") could not unlike the type(".$type.") with type id(".$type_id.") successfully.");
                }
            }
            //if the user has liked it, unlike it
        }
        //if there is already an entry in LIKES table
        //if there is no entry in LIKES table
        else{
            infologger($filename, "I", "The user(".$user_id.") has not yet liked the type(".$type.") with type id(".$type_id."). So liking it");

            $query = "INSERT INTO `LIKES` (`USER_ID`, `TYPE`, `TYPE_ID` , `CREATE_DTM`, `MOD_DTM`) VALUES ('$user_id', '$type', '$type_id',  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

            if($mysqli->query($query)){
                infologger($filename, "I" , "The user(".$user_id.") has liked the type(".$type.") with type id(".$type_id.") successfully.");
            }
            else{
                errlogger($filename, "E", "Failed !! The user(".$user_id.") could not like the type(".$type.") with type id(".$type_id.") successfully.");
            } 
        }
        //if there is no entry in LIKES table
        //check if $user_id has already liked $type & $type_id

        $result_array = array();

        //check the status (liked/unliked)
        $query = "SELECT COUNT(*) AS LIKES_COUNT FROM LIKES WHERE USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id' AND IS_DEL = 'N'";
        $result = mysqli_query($db,$query);

        if($result_data = $result->fetch_object()){
            if($result_data->LIKES_COUNT != 0){
                $result_array['isLiked'] = true;
            }
            else{
                $result_array['isLiked'] = false;
            }

            infologger($filename, "I" , "The user(".$user_id.") for the type(".$type.") with type id(".$type_id.") has liked ? ".$result_array['isLiked']);
        }
        //check the status (liked/unliked)

        //get total likes for the $type & $type_id
        $query = "SELECT COUNT(*) AS LIKES_COUNT FROM LIKES WHERE TYPE = '$type' AND TYPE_ID = '$type_id' AND IS_DEL = 'N'";
        $result = mysqli_query($db,$query);

        if($result_data = $result->fetch_object()){
            $result_array['likes'] = $result_data->LIKES_COUNT;

            infologger($filename, "I" , "The type(".$type.") with type id(".$type_id.") has been liked ".$result_array['likes']." times");
        }
        //get total likes for the $type & $type_id

        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        errlogger($filename, "E", 'Message: ' .$e->getMessage());
    }

    infologger($filename, "I", "-------------'.$filename.'-------------");
    infologger($filename, "I", "");
?>