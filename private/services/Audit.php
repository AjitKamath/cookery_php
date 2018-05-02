<?php
	class Audit{
		public static function submitAudit($clientIP, $apiKey, $clientOS, $clientBrowser, $clientIdentifier, 
										   $httpStatusCode, $functionKey, $country, $city, $responseTime){
			try{
                $con = DatabaseUtil::getInstance()->open_connection();

				$query = "INSERT INTO `AUDIT` (`CLNT_ID`, `RESPONSE_TIME`, `CLNT_IP_ADD`, `API_KEY` , `CLNT_OS`, `CLNT_BROWSER`, 
						`HTTP_STAT_CD`, `FUNC_KEY`, `COUNTRY`, `CITY`, `CREATE_DTM`) 
						VALUES ('".$clientIdentifier."', '".$responseTime."', '".$clientIP."', '".$apiKey."', '".$clientOS."', '".$clientBrowser."', 
						'".$httpStatusCode."', '".$functionKey."', '".$country."', '".$city."', CURRENT_TIMESTAMP)";
				
				if(mysqli_query($con, $query)){
					$auditId = mysqli_insert_id($con);
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "Registered request into the Audit table with AUDIT_ID : ".$auditId);
				}
				else{
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "Failed to register the request into the Audit table");
				}
            }
            catch(Exception $e){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
            }
            finally{
                DatabaseUtil::getInstance()->close_connection($con);
            }
		}		
	}
?>