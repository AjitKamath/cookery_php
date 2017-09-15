<?php

//function sendResponse($iserror , $errorcode, $errormessage)
{
 $response = array();
  
  $response['IS_ERRORED'] = "Y";
  $response['ERR_CODE'] = "123";
  $response['ERR_MSG'] = "No Connection";
  
  echo json_encode($response);
  
}


?>