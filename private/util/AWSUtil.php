<?php
	include_once 'Constants.php';

	use Aws\S3\S3Client;
	use Aws\S3\Exception\S3Exception;

	class AWSUtil{
		public static function getAWSConnection(){
			try {
				// Set Amazon S3 Credentials
				$s3 = S3Client::factory(
					array(
						'credentials'	=> array(
							'key' 		=> AWS_IAM_KEY,
							'secret' 	=> AWS_IAM_SECRET
						),
						'version' 		=> 'latest',
						'region'  		=> AWS_IAM_REGION
					)
				);

				// The region matters. I'm using "US Ohio" so "us-east-2" is the corresponding
				// region code. You can google it or upload a file to the S3 bucket and look at
				// the public url. It will look like:
				// https://s3.us-east-2.amazonaws.com/YOUR_BUCKET_NAME/image.png
				// 
				// As you can see the us-east-2 in the url.

				return $s3;
			}
			catch (S3Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			} catch (Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
			}
		}
		
		public static function uploadFilesToS3($s3, $files, $index, $s3Path){
			//check for null/empty
			if(!Util::check_for_null($s3Path)){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."s3Path");
				return;
			}
			
			if(count($files['name']) == 0){
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, NULL_OR_EMPTY."files");
				return;
			}
			//check for null/empty
			
			try {
				// So you need to move the file on $file to a temporary place.
				// The solution being used: http://stackoverflow.com/questions/21004691/downloading-a-file-and-saving-it-locally-with-php
				if (!file_exists(TEMP_DIRECTORY)) {
					mkdir(TEMP_DIRECTORY);
				}
				
				$array = explode(".",$files['name'][$index]);
				$tmpFileName = $array[0].uniqid().'.'.$array[1];
				$tempFilePath = TEMP_DIRECTORY.$tmpFileName;
				
				if (isset($files['tmp_name'][$index])){
					$tmp_name = $files['tmp_name'][$index];
					
					move_uploaded_file($tmp_name, $tempFilePath);
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "File(".$tmpFileName.") has been moved to ".TEMP_DIRECTORY);
				}

				// Put on S3
				$result = $s3->putObject(
					array(
						'Bucket'		=> AWS_BUCKET,
						'Key' 			=> $s3Path.$tmpFileName,
						'SourceFile' 	=> $tempFilePath,
						'ACL'    		=> 'public-read'
					)
				);
				
				$response = $result['ObjectURL'];
				
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "File(".$tempFilePath.") has been uploaded to AWS S3(".$response.")");
				
				if (!unlink($tempFilePath)){
					LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, "File(".$tempFilePath.") could no be deleted");
			  	}
				else{
				  	LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_INFO, "File(".$tempFilePath.") has been been deleted");
			  	}
				
				return $response;
			} catch (S3Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				echo $e;
				echo "\n";
			} catch (Exception $e) {
				LoggerUtil::logger(__CLASS__, __METHOD__, __LINE__, LOG_TYPE_ERROR, EXCEPTION_MESSAGE .$e->getMessage());
				echo $e;
				echo "\n";
			}
		}
	}
?>