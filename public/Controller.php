<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ControllerUtil.php');
	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/AuditUtil.php');

	ControllerUtil::serviceController();
	AuditUtil::registerAuditData();
?>