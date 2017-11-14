<?php
    include_once('../util/import_util.php');

    $filename = "fetchlikesdetails.php";

    logger($filename, "I", "");
    logger($filename, "I", "-------------".$filename."-------------");

    //request
    $type = isset($_POST['type']) ? $_POST['type'] : '';
    $type_id = isset($_POST['type_id']) ? $_POST['type_id'] : '';
    
    logger($filename, "I", "REQUEST PARAM : type(".$type.")");
    logger($filename, "I", "REQUEST PARAM : type_id(".$type_id.")");
    //request

    //check for null/empty
    if(!check_for_null($type)){
        logger($filename, "E", "Error ! null/empty type");
        return;
    }

    if(!check_for_null($type_id)){
        logger($filename, "E", "Error ! null/empty type id");
        return;
    }
    //check for null/empty

    try{
        $con = DatabaseUtil::getInstance()->open_connection();
        
        //get likes details for $type & $type_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG FROM LIKES LIKE INNER JOIN USER USR ON USR.USER_ID = LIKE.USER_ID WHERE TYPE                    = '$type' AND TYPE_ID = '$type_id'";
        $result = mysqli_query($con, $query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
          array_push($result_array, $result_data);
        }
        //get likes details for $type & $type_id

        logger($filename, "I", "Total likes fetched for type('.$type.') & type_id('.$type_id.') : ".sizeof($result_array));
        
        //response
        echo json_encode($result_array);
        //response
    }
    catch(Exception $e){
        logger($filename, "E", 'Message: ' .$e->getMessage());
    }
    finally{
        DatabaseUtil::getInstance()->close_connection($con);
    }

    logger($filename, "I", "-------------".$filename."-------------");
?>