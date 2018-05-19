<?php
	//due to some conflict between composer autoload and our autoload function, some php files are not importing
	//to fix it temporarily, we are importing required php's again wherever we are going to use AWSUtil.php
	
	include_once '../vendor/autoload.php';	
	
	include_once '../private/util/AWSUtil.php';	
	include_once '../private/util/DatabaseUtil.php';	
	include_once '../private/util/MailUtil.php';	
	
	include_once '../private/services/Timeline.php';
	include_once '../private/services/Like.php';
	include_once '../private/services/Comment.php';
	include_once '../private/services/Milestone.php';
	include_once '../private/services/Review.php';
	include_once '../private/services/Recipe.php';
	include_once '../private/services/User.php';
	include_once '../private/services/Audit.php';
?>