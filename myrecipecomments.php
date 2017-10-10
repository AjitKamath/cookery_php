<?php
include 'application_context.php';

$filename = "myrecipecomments.php";

$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '';
$rcp_id = isset($_POST['rcp_id']) ? $_POST['rcp_id'] : '';
$comment = isset($_POST['comment']) ? $_POST['comment'] : '';

        try{
             $commentsql = "INSERT INTO `COMMENTS` (`RCP_ID`, `USER_ID`, `COMMENT` , `CREATE_DTM`, `MOD_DTM`) VALUES 
                                             ('$rcp_id', '$user_id', '$comment',  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";                         

             $q0_ok = true;
             $mysqli->query($commentsql) ? null : $q0_ok=false;

                if(!$q0_ok)
                {
                    errlogger($filename, "E", "Query failure : ".$commentsql);
                    throw new Exception("Query failure : ".$commentsql);
                }
               else
               {
                    infologger($filename, "I" , "Comment added Successfully as ".$comment);
                    $success = "Comment Added Successfully";
                    echo $success;
                 
               }
                
            }
            catch(Exception $e)
            {
                $isError = true;
                $errorMessage = 'Query Failed';
                $exception = $e."MYSQL ERROR:";
                $userMessage = 'Could not add Comment. Please try again.';
                errlogger($filename, "E", $userMessage." Error ".$exception);
            }

?>