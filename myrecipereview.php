<?php
include 'application_context.php';

$filename = "myrecipereview.php";

$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
$rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
$review = isset($_POST['review']) ? $_POST['review'] : '';
$rating = isset($_POST['rating']) ? $_POST['rating'] : '';

        try{
             $reviewsql = "INSERT INTO `REVIEWS` (`RCP_ID`, `USER_ID`, `REVIEW`, `RATING`, `CREATE_DTM`, `MOD_DTM`) VALUES 
                                             ('$rcp_id', '$user_id', '$review', '$rating', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";                         

             $q0_ok = true;
             $mysqli->query($reviewsql) ? null : $q0_ok=false;

                if(!$q0_ok)
                {
                    errlogger($filename, "E", "Query failure : ".$reviewsql);
                    throw new Exception("Query failure : ".$reviewsql);
                }
               else
               {
                    infologger($filename, "I" , "Review added Successfully as ".$review);
                    $success = "Review Added Successfully";
                    echo $success;
                 
               }
                
            }
            catch(Exception $e)
            {
                $isError = true;
                $errorMessage = 'Query Failed';
                $exception = $e."MYSQL ERROR:";
                $userMessage = 'Could not add Review. Please try again.';
                errlogger($filename, "E", $userMessage." Error ".$exception);
            }











?>