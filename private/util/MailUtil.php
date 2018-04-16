<?php
	//reference : https://github.com/PHPMailer/

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require $_SERVER['DOCUMENT_ROOT'].'/'.'private/libraries/PHPMailer/src/Exception.php';
    require $_SERVER['DOCUMENT_ROOT'].'/'.'private/libraries/PHPMailer/src/PHPMailer.php';
    require $_SERVER['DOCUMENT_ROOT'].'/'.'private/libraries/PHPMailer/src/SMTP.php';

	//SMTP needs accurate times, and the PHP time zone MUST be set
	//This should be done in your php.ini, but this is how to do it if you don't have access to that
	date_default_timezone_set('Etc/UTC');

	//TODO: This class must be equipped to handle the misusing of this service as a spam gateway
	//https://github.com/PHPMailer/PHPMailer/blob/master/examples/simple_contact_form.phps
    class MailUtil{
		public static function userEmail($type, $recipientMail, $veri_code, $recipientName, $subject){
			if(USER_REGISTER == $type){
				//emails
				$recepientEmails = array();
				$recepientEmails[count($recepientEmails)] = $recipientMail;

				//names
				$recepientNames = array();
				$recepientNames[count($recepientNames)] = $recipientName;

				//bodies
				$bodies = array();
				$temp = file_get_contents(MAIL_TEMPLATES_EMAILS_DIRECTORY.MAIL_TEMPLATE_USER_CONTENT);
				for ($i = 0; $i < count($recepientEmails); $i++) {
					$body = $temp;
					$body = str_replace("[APP_NAME]", APP_NAME, $body);
					$body = str_replace("[USER_NAME]", $recipientName, $body);
					$body = str_replace("[SUPPORT_EMAIL]", MAIL_REPLY_EMAIL, $body);
					$body = str_replace("[USER_VERI_CODE]", EMAIL_CONTROLLER_PATH."?purpose=USER_VERIFY_EMAIL&email=".$recipientMail."&veri_code=".$veri_code, $body);
					$bodies[$i] = $body;
				}

				self::sendMailFrom(MAIL_FROM_TEAM_COOKERY, $recepientEmails, $recepientNames, $subject, $bodies, null);
				//emails
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! Could not identify the email type : ".$type);
			}
		}
			
		public static function userConfirmationEmail($type, $recipientMail, $recipientName, $subject){
			if(USER_EMAIL_CONFIRM == $type){
				//emails
				$recepientEmails = array();
				$recepientEmails[count($recepientEmails)] = $recipientMail;

				//names
				$recepientNames = array();
				$recepientNames[count($recepientNames)] = $recipientName;

				//bodies
				$bodies = array();
				$temp = file_get_contents(MAIL_TEMPLATES_EMAILS_DIRECTORY.MAIL_TEMPLATE_EMAIL_CONFIRMATION_CONTENT);
				for ($i = 0; $i < count($recepientEmails); $i++) {
					$body = $temp;
					$body = str_replace("[APP_NAME]", APP_NAME, $body);
					$body = str_replace("[SUPPORT_EMAIL]", MAIL_REPLY_EMAIL, $body);
					$bodies[$i] = $body;
				}

				self::sendMailFrom(MAIL_FROM_TEAM_COOKERY, $recepientEmails, $recepientNames, $subject, $bodies, null);
				//emails
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not identify the email type : ".$type);
			}
		}
		
		public static function recipeEmail($type, $recipientMail, $recipientName, $subject, $recipeImage, $recipeName){
			if(RECIPE_SUBMIT == $type || RECIPE_MODIFY == $type || RECIPE_REMOVE == $type){
				//emails
				$recepientEmails = array();
				$recepientEmails[count($recepientEmails)] = $recipientMail;

				//names
				$recepientNames = array();
				$recepientNames[count($recepientNames)] = $recipientName;

				//bodies
				$bodies = array();
				$temp = file_get_contents(MAIL_TEMPLATES_EMAILS_DIRECTORY.MAIL_TEMPLATE_RECIPE_CONTENT);
				for ($i = 0; $i < count($recepientEmails); $i++) {
					$body = $temp;
					$body = str_replace("[APP_NAME]", APP_NAME, $body);
					
					if(RECIPE_SUBMIT == $type){
						$body = str_replace("[TITLE]", "Woohoo ! We got your Recipe.<br/>Yes, we are excited too ! Lets roll !", $body);
					}
					else if(RECIPE_MODIFY == $type){
						$body = str_replace("[TITLE]", "You just made your recipe more tasty !", $body);
					}
					else if(RECIPE_REMOVE == $type){
						$body = str_replace("[TITLE]", "That's sad ! Let us know if we can help you improve your recipe", $body);
					}
					else{
						$body = str_replace("[TITLE]", "Oops !", $body);
					}
					
					$body = str_replace("[RECIPE_IMAGE]", $recipeImage, $body);
					$body = str_replace("[RECIPE_NAME]", $recipeName, $body);
					$body = str_replace("[SUPPORT_EMAIL]", MAIL_REPLY_EMAIL, $body);
					$bodies[$i] = $body;
				}

				self::sendMailFrom(MAIL_FROM_TEAM_COOKERY, $recepientEmails, $recepientNames, $subject, $bodies, null);
				//emails
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not identify the email type : ".$type);
			}
		}
		
		public static function databaseEmail($type){
			//emails
			$recepientEmails = array();
			$recepientEmails[count($recepientEmails)] = MAIL_RECEPIENT_ADMIN_EMAIL_1;
			$recepientEmails[count($recepientEmails)] = MAIL_RECEPIENT_ADMIN_EMAIL_2;

			//names
			$recepientNames = array();
			$recepientNames[count($recepientNames)] = MAIL_RECEPIENT_ADMIN_NAME_1;
			$recepientNames[count($recepientNames)] = MAIL_RECEPIENT_ADMIN_NAME_2;

			//attachments
			date_default_timezone_set(LOGS_TIMEZONE);
			$today = date(LOGS_FILE_FORMAT);
			$now = date(LOGS_TIMESTAMP_FORMAT);

			$attachments = array();

			LoggerUtil::checkFile("info");
			$file = LOGS_DIRECTORY.$today."_info.log";
			$attachments[count($attachments)] = $file;

			LoggerUtil::checkFile("error");
			$file = LOGS_DIRECTORY.$today."_error.log";
			$attachments[count($attachments)] = $file;

			LoggerUtil::checkFile("all");
			$file = LOGS_DIRECTORY.$today."_all.log";
			$attachments[count($attachments)] = $file;
			//attachments
			
			if(DATABASE_CONNECTION_LEAK == $type){
				//bodies
				$bodies = array();
				$temp = file_get_contents(MAIL_TEMPLATES_EMAILS_DIRECTORY.MAIL_TEMPLATE_ERROR_MODERATE_CONTENT);
				for ($i = 0; $i < count($recepientEmails); $i++) {
					$body = $temp;
					$body = str_replace("[USERNAME]", $recepientNames[$i], $body);
					$body = str_replace("[PRIMARY_CONTENT_ERROR_CRITICAL]", "<font style=\"color: red\">There seems to be a moderate error. It may need your attention.</font>", $body);
					$body = str_replace("[SECONDARY_CONTENT_ERROR_CRITICAL]", "<br/>
					<b>What happened ? </b>
					<br/>
					Database connections were leaked. Found multiple connections being open.
					<br/>
					<br/>
					<b>Why it happened ? </b>
					<br/>
					This generally happens if the connection was not closed after opening it. 
					Ensure that there are no more than one connection opened per service request & connection is closed in the finally block of each service request. 
					See attached log files to identify the crime scene.
					<br/><br/>
					<b>When it happened ? </b><br/>This happened at ".$now, $body);
					$body = str_replace("[TERTIARY_CONTENT_ERROR_CRITICAL]", "", $body);
					$bodies[$i] = $body;
				}
			}
			else if(DATABASE_TRANSACTION_LEAK == $type){
				//bodies
				$bodies = array();
				$temp = file_get_contents(MAIL_TEMPLATES_EMAILS_DIRECTORY.MAIL_TEMPLATE_ERROR_MODERATE_CONTENT);
				for ($i = 0; $i < count($recepientEmails); $i++) {
					$body = $temp;
					$body = str_replace("[USERNAME]", $recepientNames[$i], $body);
					$body = str_replace("[PRIMARY_CONTENT_ERROR_CRITICAL]", "<font style=\"color: red\">There seems to be a moderate error. It may need your attention.</font>", $body);
					$body = str_replace("[SECONDARY_CONTENT_ERROR_CRITICAL]", "<br/>
					<b>What happened ? </b>
					<br/>
					Database transactions were leaked. Found multiple transactions being started.
					<br/>
					<br/>
					<b>Why it happened ? </b>
					<br/>
					This generally happens if the transaction was started and was never ended. 
					Ensure that there are no more than one transaction opened per service request & transaction is ended in the finally block of each service request. 
					See attached log files to identify the crime scene.
					<br/><br/>
					<b>When it happened ? </b><br/>This happened at ".$now, $body);
					$body = str_replace("[TERTIARY_CONTENT_ERROR_CRITICAL]", "", $body);
					$bodies[$i] = $body;
				}
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not identify the email type : ".$type);
				return;
			}
			
			self::sendMailFrom(MAIL_FROM_TEAM_COOKERY, $recepientEmails, $recepientNames, MAIL_TEMPLATE_ERROR_MODERATE_SUBJECT, $bodies, $attachments);
			//emails
		}
		
		public static function sendMailFrom($from, $recipientEmails, $recipientNames, $subject, $bodies, $attachments){
			//request
            for ($i = 0; $i < count($recipientEmails); $i++) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST PARAM : recipientEmails[".$i."](".$recipientEmails[$i].")");
			}
            for ($i = 0; $i < count($recipientNames); $i++) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST PARAM : recipientNames[".$i."](".$recipientNames[$i].")");
			}
			for ($i = 0; $i < count($attachments); $i++) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST PARAM : attachments[".$i."](".$attachments[$i].")");
			}
            LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST PARAM : subject(".$subject.")");
			LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "REQUEST PARAM : from(".$from.")");
            //request
            
            //check for null/empty
			if(!Util::check_for_null($from)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."from");
				return;
			}
			
            if(count($recipientEmails) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."recipientEmails");
				return;
			}
            if(count($recipientNames) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."recipientNames");
				return;
			}
			if(Util::check_for_null($attachments)){
				if(count($attachments) == 0){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "null/empty attachments");
				}
			}
            if(!Util::check_for_null($subject)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."subject");
				return;
			}
            if(!Util::check_for_null($bodies)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."body");
				return;
			}
            
            if(count($recipientEmails) != count($recipientNames)){
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Recipient Emails count :"+count($recipientEmails));
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Recipient Names count :"+count($recipientNames));
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Recipient Emails count & Recipient Names count should match");
				return;
            }
			
			if(count($recipientEmails) != count($bodies)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Recipient Emails count :"+count($recipientEmails));
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Bodies count :"+count($bodies));
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Recipient Emails count & Recipient Names count should match");
				return;
			}
            //check for null/empty
			
			if(MAIL_FROM_TEAM_COOKERY == $from){
				if(self::sendMails(MAIL_FROM_INFO_EMAIL, MAIL_FROM_INFO_NAME, $recipientEmails, $recipientNames, $subject, $bodies, $attachments)){
					$temp['err_code'] = 0;
					$temp['isError'] = false;
					$temp['err_message'] = $subject;
				}
				else{
					$temp['err_code'] = 1;
					$temp['isError'] = true;
					$temp['err_message'] = $subject;
				}
				
				return json_encode($temp);
			}
			else{
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Could not identify from whom the email has to be sent : ".$from);
			}
		}
		
        private static function sendMails($fromEmail, $fromName, $recipientEmails, $recipientNames, $subject, $bodies, $attachments) {
           	// Passing `true` enables exceptions
            $mail = new PHPMailer(true);                              
            try {
                //Server settings
				$mail->SMTPDebug = MAIL_DEBUG;
                $mail->isSMTP();        
				$mail->SMTPAuth = true;
                $mail->Host = MAIL_HOST;	// can specify main and backup SMTP servers
                $mail->Port = MAIL_PORT;
				$mail->SMTPSecure = MAIL_ENCRYPTION; 
				$mail->Username = MAIL_USERNAME;                 
				$mail->Password = MAIL_PASSWORD;  
				//Server settings
				
                $mail->setFrom($fromEmail, $fromName);
                $mail->addReplyTo(MAIL_REPLY_EMAIL, MAIL_REPLY_NAME);
                                
                //Recipients
                for($i = 0; $i < count($recipientEmails); $i++){
                    $mail->addAddress($recipientEmails[$i], $recipientNames[$i]);     // Optional name
					
					//Attachments
					for($j = 0; $j < count($attachments); $j++){
						if(file_exists($attachments[$j])){
							$mail->addAttachment($attachments[$j], basename($attachments[$j]));
						} else {
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! File does not exist " . $attachments[$j]);
						}
					}
					//Attachments

					//Content
					$mail->isHTML(true);                                  // Set email format to HTML
					$mail->Subject = $subject;
					//Content

					//body
					$mail->Body = $bodies[$i];
					$mail->send();
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Email sent with subject('".$subject."') to email -> '".$recipientEmails[$i]."'");
					//body
				}
				//Recipients
                
                return true;
            } catch (Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, $mail->ErrorInfo);
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Email(s) failed to send with subject('".$subject."') to ".count($recipientEmails)." emails -> '".json_encode($recipientEmails)."'");
            }
			
			return false;
        }
		
		 private static function sendMail($fromEmail, $fromName, $recipientEmail, $recipientName, $subject, $body, $attachments) {
           	// Passing `true` enables exceptions
            $mail = new PHPMailer(true);                              
            try {
                //Server settings
				$mail->SMTPDebug = MAIL_DEBUG;
                $mail->isSMTP();        
				$mail->SMTPAuth = true;
                $mail->Host = MAIL_HOST;	// can specify main and backup SMTP servers
                $mail->Port = MAIL_PORT;
				$mail->SMTPSecure = MAIL_ENCRYPTION; 
				$mail->Username = MAIL_USERNAME;                 
				$mail->Password = MAIL_PASSWORD;  
				//Server settings
				
                $mail->setFrom($fromEmail, $fromName);
                $mail->addReplyTo(MAIL_REPLY_EMAIL, MAIL_REPLY_NAME);
                                
                //Recipient
                $mail->addAddress($recipientEmail, $recipientName);     // Optional name
				//Recipient
                
                //Attachments
				if(Util::check_for_null($attachments)){
					for($i = 0; $i < count($attachments['tmp_name']); $i++){
						$uploadfile = tempnam(sys_get_temp_dir(), hash('sha256', $attachments['name'][$i]));
						$filename = $attachments['name'][$i];
						if (move_uploaded_file($attachments['tmp_name'][$i], $uploadfile)) {
							$mail->addAttachment($uploadfile, $filename);
						} else {
							LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Failed to attach file to email by moving file to " . $uploadfile);
						}
						
						//$mail->addAttachment("tmp/".$attachments['name'][$i], 'Attachment-'.($i+1));         // Optional name
					}
				}
				//Attachments
                
                //Content
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = $subject;
                $mail->Body    = $body;
                //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
				//Content

                $mail->send();
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Email(s) sent with subject('".$subject."') to ".count($recipientEmails)." emails -> '".json_encode($recipientEmails)."'");
                return true;
            } catch (Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, $mail->ErrorInfo);
                LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Error ! Email(s) failed to send with subject('".$subject."') to ".count($recipientEmails)." emails -> '".json_encode($recipientEmails)."'");
            }
			
			return false;
        }
    }
?>

