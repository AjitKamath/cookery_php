<?php

// Path to move uploaded files
$target_path = "/home/cabox/workspace/images/appuploads/";
 
// array for final json response
$response = array();
if (isset($_FILES['images'])) 
{
    move_uploaded_file($_FILES['images']['tmp_name'], $target_path.'test.jpg');
    //echo "moved";
	$response['message'] = 'Received file!';
} 
else {
    // File parameter is missing
    $response['error'] = true;
    $response['message'] = 'Not received any file!';
    print_r($_FILES);
}
 
// Echo final json response to client
echo json_encode($response);

/*
include 'application_context.php';

if(!empty($_FILES['images']['name']['0']))
{
	$files= $_FILES['images'];
	$uploaded = array();
	$failed = array();

	$allowed = array('jpg','jpeg','png','bmp');

	foreach($files['name'] as $obj => $files)
	{
	
		$file_tmp = $files['tmp_name'][$obj];
		$file_size = $files['size'][$obj];
		$file_error = $files['error'][$obj];
		
		$file_ext = explode('.', $file_name);
		$file_ext = strtolower(end($file_ext));
		//print_r($file_ext);
		//if(in_array($file_ext,$allowed ))
		//{
			if($file_error === 0)
			{
				if($file_size <= 2097152 )
				{
					$file_name_new = uniqid('',true). '.' . $file_ext;
					$file_destination = 'images/appuploads/'. $file_name_new;
					
					if(move_uploaded_file($file_tmp, $file_destination))
					{
						$uploaded[$obj] = $file_destination;
						//$message = "test";
						//json_encode($message);
					}
					else
					{
						$failed[$obj] = "[{$file_name}] failed to upload.";
					}
					
				}
				else
				{
					$failed[$obj] = "[{$file_name}] is too large.";
				}
			}
			else
			{
				$failed[$obj] = "[{$file_name}] errored with code {$file_error}"; 
			}
		}
		/*else
		{
			$failed[$obj] = "[{$file_name}] file extension '{$file_ext}' is not allowed";
		}
	}


	if(!empty($uploaded))	
	{
		json_encode($uploaded);
		//print_r($uploaded);
	}

	if(!empty($failed))
	{
		json_encode($failed);
		//print_r($failed);
	}

//}
else
{
	$failedimage = "failedimages";
	json_encode($failedimage);
}
*/
?>