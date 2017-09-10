<?php

// For multiple files upload

$target_path = "/opt/lampp/htdocs/cookery/testimg/";

if($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$i = 0;
	while($i < count($_FILES['images']['name']))
	{

		if(move_uploaded_file($_FILES['images']['tmp_name'][$i],$target_path.$i))
		{
			echo "uploaded";
		}
		else
		{
			echo "error";
		}
		$i++;
	}
}

?>
