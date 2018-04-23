<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ControllerUtil.php');
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/AuditUtil.php');

	//echo "Hi";
	//echo json_encode($_FILES);
	//return;

	ControllerUtil::serviceController();
	AuditUtil::registerAuditData();
?>