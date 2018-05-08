<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');
	
	$function_key = isset($_POST['function_key']) ? $_POST['function_key'] : '';
	$from = isset($_POST['from']) ? $_POST['from'] : '';
	$recipientEmails = isset($_POST['recipient_emails']) ? $_POST['recipient_emails'] : '';
	$recipientNames = isset($_POST['recipient_names']) ? $_POST['recipient_names'] : '';
	$subject = isset($_POST['subject']) ? $_POST['subject'] : '';
	$bodies = isset($_POST['bodies']) ? $_POST['bodies'] : '';
	$attachments = isset($_FILES['attachments']) ? $_FILES['attachments'] : '';
	
 	$purpose = isset($_GET['purpose']) ? $_GET['purpose'] : '';
	$email = isset($_GET['email']) ? $_GET['email'] : '';
	$veri_code = isset($_GET['veri_code']) ? $_GET['veri_code'] : '';
	$name = isset($_GET['name']) ? $_GET['name'] : '';

	//check for null/empty
    /*if(!Util::check_for_null($function_key) && !Util::check_for_null($purpose)){
        LoggerUtil::logger(__FILE__, "EmailController", __LINE__, "E", "Error ! null/empty purpose");
		LoggerUtil::logger(__FILE__, "EmailController", __LINE__, "E", "Error ! null/empty function_key");
        return;
    }*/
	//check for null/empty
	
	LoggerUtil::logger(__FILE__, "Email", __LINE__, "I", "");
	LoggerUtil::logger(__FILE__, "Email", __LINE__, "I", "=====>".$purpose);

	if($function_key == SEND_EMAIL){
		echo MailUtil::sendMailFrom($from, $recipientEmails, $recipientNames, $subject, $bodies, $attachments); 
	}
	else if($purpose == USER_VERIFY_EMAIL){
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
			/*echo "<html>";
			echo "<title></title>";
			echo "<b>Email verified !</b>";*/
			$url = "http://cookery_php-dial2vishal53897.codeanyapp.com/public/confirm_redirect_temp.html";
			header('Location: '.$url);
			// send confirmation email
			MailUtil::userConfirmationEmail(USER_EMAIL_CONFIRM, $email, $name, "Congratulations");
			
		}
		else{
			echo "<html>";
			echo "<title></title>";
			echo "<b>Unknown operation !</b>";
		}
	}
	else{
		LoggerUtil::logger(__FILE__, "EmailController", __LINE__, "E", "Error ! Unknown purpose - ".$purpose);
	}

	LoggerUtil::logger(__FILE__, "EmailController", __LINE__, "I", "<=====".$purpose);

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