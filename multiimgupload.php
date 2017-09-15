<?php

// For multiple files upload

$target_path = "/opt/lampp/htdocs/cookery/testimg/";

//$target_path = "/home/cabox/workspace/images/appuploads/";
$response = array();

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$i = 0;
	while($i < count($_FILES['images']['name']))
	{
$filescount = count($_FILES['images']['name']);
		if(move_uploaded_file($_FILES['images']['tmp_name'][$i],$target_path.$i.'.jpg'))
		{
			$response['msg'] = "uploaded successfully";
			$response['count'] = $filescount;
		}
		else
		{
			$response['msg'] = "upload Failed";
		}
		$i++;
	}
	
	echo json_encode($response);
}

?>
