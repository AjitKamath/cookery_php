<?php

// For multiple files upload

<<<<<<< HEAD
$target_path = "/opt/lampp/htdocs/cookery/testimg/";

//$target_path = "/home/cabox/workspace/images/appuploads/";
=======
//$target_path = "/opt/lampp/htdocs/cookery/testimg/";

//$target_path = "/home/cabox/workspace/images/appuploads/";
//=======
//$target_path = "/opt/lampp/htdocs/cookery/testimg/";

$target_path = "/home/cabox/workspace/images/appuploads/";
>>>>>>> ba6fc1868a6d7aa97ae65645561e53c68dbd54b1
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
