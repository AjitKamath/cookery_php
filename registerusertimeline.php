<?php
    $filename = "registerusertimeline.php";

    function register_timeline($con, $user_id, $ref_user_id, $type, $type_id){
        $filename = $GLOBALS['filename'];
        
        logger($filename, "I", "");
        logger($filename, "I", "-------------".$filename."-------------");

        //check for null/empty
        if(!check_for_null($user_id)){
            logger($filename, "E", "Error ! null/empty user id");
            return;
        }
        
        if(!check_for_null($ref_user_id)){
            logger($filename, "E", "Error ! null/empty ref user id");
            return;
        }
        
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
            //register the timeline
            $query = "INSERT INTO `TIMELINES` (`USER_ID`, `REF_USER_ID`, `TYPE`, `TYPE_ID`, `CREATE_DTM`) VALUES ('$user_id', '$ref_user_id', '$type', '$type_id', CURRENT_TIMESTAMP)";
            
            if(mysqli_query($con, $query)){
                logger($filename, "I" , "Registered a timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.")");
            }
            else{
                logger($filename, "E", "Failed !! The timeline for the user(".$user_id.") for the type(".$type.") with type id(".$type_id.") could not be registered");
            } 
            //register the timeline
        }
        catch(Exception $e){
            logger($filename, "E", 'Message: ' .$e->getMessage());
        }

        logger($filename, "I", "-------------".$filename."-------------");
    }
?>