<?php
	//!!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	
	
	include_once './private/util/ControllerUtil.php';
	include_once './private/util/AuditUtil.php';
		
	ControllerUtil::serviceController();
	AuditUtil::registerAuditData();
?>
