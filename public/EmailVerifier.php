<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');
	
	$purpose = isset($_GET['purpose']) ? $_GET['purpose'] : '';
	$email = isset($_GET['email']) ? $_GET['email'] : '';
	$veri_code = isset($_GET['veri_code']) ? $_GET['veri_code'] : '';

	//check for null/empty
    if(!Util::check_for_null($purpose)){
        LoggerUtil::logger(__FILE__, "Controller", __LINE__, "E", "Error ! null/empty purpose");
        return;
    }
	//check for null/empty
	
	LoggerUtil::logger(__FILE__, "Email", __LINE__, "I", "");
	LoggerUtil::logger(__FILE__, "Email", __LINE__, "I", "=====>".$purpose);

	if($purpose == USER_VERIFY_EMAIL){
		$response = User::verifyEmail($email, $veri_code);
		
		if(VERIFY_EMAIL_INVALID_URL == $response){
			echo "<html>";
			echo "<title></title>";
			echo "<b>Invalid URL !</b>";
		}
		else if(VERIFY_EMAIL_VERICODE_EXPIRED == $response){
			echo "<html>";
			echo "<title></title>";
			echo "<b>URL has expired !</b>";
		}
		else if(VERIFY_EMAIL_NOT_VERIFIED == $response){
			echo "<html>";
			echo "<title></title>";
			echo "<b>Email could not be verified !</b>";
		}
		else if(VERIFY_EMAIL_VERIFIED == $response){
			echo "<html>";
			echo "<title></title>";
			echo "<b>Email verified !</b>";
			
			//TODO: send confirmation email
		}
		else{
			echo "<html>";
			echo "<title></title>";
			echo "<b>Unknown operation !</b>";
		}
	}
	else{
		LoggerUtil::logger(__FILE__, "EmailManager", __LINE__, "E", "Error ! Unknown purpose - ".$purpose);
	}

	LoggerUtil::logger(__FILE__, "Email", __LINE__, "I", "<=====".$purpose);

	//this function triggers on every class object creation or static method calls
	function __autoload($class_name){
        //relative paths to directories to scan for autoload
        $directorys = array(
            'private/services/',
            'private/util/'
        );
		//relative paths to directories to scan for autoload
        
        //for each directory
        foreach($directorys as $directory){
			$file_path = $_SERVER['DOCUMENT_ROOT'].'/'.$directory.$class_name . '.php';
			
			//see if the file exsists
            if(file_exists($file_path)){
				require_once($file_path);
                //echo "autoloaded : ".$file_path;
                return;
            }            
        }
    }
    //this function triggers on every class object creation or static method calls
?>