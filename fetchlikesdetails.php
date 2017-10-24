<?php
    include 'application_context.php';

    $filename = "fetchlikesdetails.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $type = isset($_POST['type']) ? $_POST['type'] : '';
    $type_id = isset($_POST['type_id']) ? $_POST['type_id'] : '';
    
    infologger($filename, "I", "REQUEST PARAM : type(".$type.")");
    infologger($filename, "I", "REQUEST PARAM : type_id(".$type_id.")");
    //request

    try{
        //get likes details for $type & $type_id
        $query = "SELECT USR.USER_ID, USR.NAME, USR.IMG FROM LIKES LIKE INNER JOIN USER USR ON USR.USER_ID = LIKE.USER_ID WHERE TYPE                    = '$type' AND TYPE_ID = '$type_id'";
        $result = mysqli_query($db,$query);

        $result_array = array();
        while($result_data = $result->fetch_object()){
          array_push($result_array, $result_data);
        }
        //get likes details for $type & $type_id

        infologger($filename, "I", "Total likes fetched for type('.$type.') & type_id('.$type_id.') : ".sizeof($result_array));
        
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