<?php
    session_start();

    include 'application_context.php';

    $filename = "registerusertimeline.php";

    infologger($filename, "I", "");
    infologger($filename, "I", "-------------'.$filename.'-------------");

    //request
    $user_id = isset($_SESSION["user_id"]) ? $_SESSION["user_id"] : '';
    $type = isset($_SESSION["type"]) ? $_SESSION["type"] : '';
    $type_id = isset($_SESSION["type_id"]) ? $_SESSION["type_id"] : '';
    
    infologger($filename, "I", "REQUEST PARAM : user_id(".$user_id.")");
    infologger($filename, "I", "REQUEST PARAM : type(".$type.")");
    infologger($filename, "I", "REQUEST PARAM : type_id(".$type_id.")");
    //request

    try{
        //register the timeline
        $query = "INSERT INTO `TIMELINES` (`USER_ID`, `TYPE`, `TYPE_ID`, `CREATE_DTM`) VALUES ('$user_id', '$type', '$type_id', CURRENT_TIMESTAMP)";

        if($mysqli->query($query)){
            infologger($filename, "I" , "Registered a timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.")");
        }
        else{
            errlogger($filename, "E", "Failed !! The timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.") could not be registered");
        } 
        //register the timeline
    }
    catch(Exception $e){
        errlogger($filename, "E", 'Message: ' .$e->getMessage());
    }

    session_unset(); 
    session_destroy(); 

    infologger($filename, "I", "-------------'.$filename.'-------------");
    infologger($filename, "I", "");
?>