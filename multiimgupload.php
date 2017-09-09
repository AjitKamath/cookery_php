<?php

include 'application_context.php';

if(!empty($_FILES['image']['name']['0']))
{
	$files= $_FILES['image'];
	$uploaded = array();
	$failed = array();

	$allowed = array('jpg','jpeg','png');

	foreach($files['name'] as $obj => $file_name)
	{
	
		$file_tmp = $files['tmp_name'][$obj];
		$file_size = $files['size'][$obj];
		$file_error = $files['error'][$obj];
		
		$file_ext = explode('.', $file_name);
		$file_ext = strtolower(end($file_ext));
		//print_r($file_ext);
		if(in_array($file_ext,$allowed ))
		{
			if($file_error === 0)
			{
				if($file_size <= 2097152 )
				{
					$file_name_new = uniqid('',true). '.' . $file_ext;
					$file_destination = 'images/uploaded/'. $file_name_new;
					
					if(move_uploaded_file($file_tmp, $file_destination))
					{
						$uploaded[$obj] = $file_destination;
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
		else
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

}

?>