<?php

  $response = array();
$data['ver'] = "1.5";
$data['name'] = "cupcake";
$data['api'] = "api level 3";

$i=0;
while($i < 3)
{
  $response['android'][] = $data;
  $i++;
} 
echo json_encode($response);
?>