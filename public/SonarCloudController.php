<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	if(!Security::authenticateSonar(apache_request_headers())){
		return;
	}

	echo $_POST;
?>