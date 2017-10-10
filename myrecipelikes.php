<?php
include 'application_context.php';

$filename = "myrecipelikes.php";

$user_id = isset($_POST['user_id']) ? $_POST['user_id'] : '1';
$type = isset($_POST['type']) ? $_POST['type'] : 'recipe';
$type_id = isset($_POST['type_id']) ? $_POST['type_id'] : '2';

        try{
          
          // Check for if already liked
            $checklike = "Select LIKE_ID,USER_ID,TYPE,TYPE_ID from LIKES where USER_ID = '$user_id' AND TYPE = '$type' AND TYPE_ID = '$type_id'";

            $likecheck = mysqli_query($db,$checklike);
            $row = $likecheck->fetch_row();

              if($row[1]==$user_id && $row[2]==$type && $row[3]==$type_id)
              {
                $sql = "DELETE FROM `LIKES` WHERE LIKE_ID = '$row[0]' ";

                try
                {
                $cat_data = mysqli_query($db,$sql);
                infologger($filename, "I", "Like unliked successfully with user id as ".$user_id);
                echo "Unliked Successful";
                }
                catch(Exception $e)
                {
                    errlogger($filename, "E", 'Message: ' .$e->getMessage());
                    echo $e->getMessage();
                }


              }
             else
             {
             $likesql = "INSERT INTO `LIKES` (`USER_ID`, `TYPE`, `TYPE_ID` , `CREATE_DTM`, `MOD_DTM`) VALUES 
                                             ('$user_id', '$type', '$type_id',  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";                         

             $q0_ok = true;
             $mysqli->query($likesql) ? null : $q0_ok=false;

                if(!$q0_ok)
                {
                    errlogger($filename, "E", "Query failure : ".$likesql);
                    throw new Exception("Query failure : ".$likesql);
                }
               else
               {
                    infologger($filename, "I" , "Like added Successfully with type as ".$type);
                    $success = "Like Added Successfully";
                    echo $success;
                 
               }
                
            }
            }
            catch(Exception $e)
            {
                $isError = true;
                $errorMessage = 'Query Failed';
                $exception = $e."MYSQL ERROR:";
                $userMessage = 'Could not add like. Please try again.';
                errlogger($filename, "E", $userMessage." Error ".$exception);
            }

?>