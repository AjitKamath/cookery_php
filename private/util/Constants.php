<?php
    //php code version (note : in prod, increment it on each code commit)
    define("APP_VERSION", "0.1");
    define("APP_NAME", "Cookery");

    //paths
    define("HOME_DIRECTORY", $_SERVER['DOCUMENT_ROOT']."/");
    define("LOGS_DIRECTORY", HOME_DIRECTORY."logs/");
    define("APP_DATA_DIRECTORY", HOME_DIRECTORY."app_data/");
    define("APP_DATA_USERS_DIRECTORY", APP_DATA_DIRECTORY."users/");
	define("APP_DATA_TEMP_DIRECTORY", APP_DATA_DIRECTORY."temp/");
    define("APP_DATA_PROFILE_DIRECTORY", "profile/");
    define("APP_DATA_PROFILE_IMAGES_DIRECTORY", "images/");
    define("APP_DATA_RECIPES_DIRECTORY", "recipes/");
    define("APP_DATA_RECIPES_IMAGES_DIRECTORY", "images/");
	define("STATS_DIRECTORY", HOME_DIRECTORY."private/stats/");
    define("STATS_DATABASE_FILE", "database_stats.ini");
    define("WEB_DIRECTORY", HOME_DIRECTORY."private/web/");
    define("MAIL_TEMPLATES_DIRECTORY", WEB_DIRECTORY."templates/");
    define("MAIL_TEMPLATES_EMAILS_DIRECTORY", MAIL_TEMPLATES_DIRECTORY."emails/");
    define("FILE_SERVER_PATH", "www.finappl.com/");
    define("SERVER_PATH","http://cookery_php-dial2vishal53897.codeanyapp.com/");
    define("EMAIL_CONTROLLER_PATH", SERVER_PATH."public/EmailController.php");

    //logs
    define("LOGS_SWITCH", "ALL");       //OFF,ALL,INFO,ERROR
    define("LOGS_MAX_HISTORY", "7");    //in days
    define("LOGS_TIMEZONE", "Asia/Kolkata");  
    define("LOGS_TIMESTAMP_FORMAT", "d-m-y H:i:s"); 
    define("LOGS_FILE_FORMAT", "Y-m-d"); 
    define("LOG_TYPE_INFO", "I"); 
    define("LOG_TYPE_ERROR", "E"); 

    //email
    define("VERIFY_EMAIL_VERI_CODE_EXPIRE", "1");   //in days
    define("VERIFY_EMAIL_INVALID_URL", "VERIFY_EMAIL_INVALID_URL");
    define("VERIFY_EMAIL_VERICODE_EXPIRED", "VERIFY_EMAIL_VERICODE_EXPIRED");
    define("VERIFY_EMAIL_VERIFIED", "VERIFY_EMAIL_VERIFIED");
    define("VERIFY_EMAIL_NOT_VERIFIED", "VERIFY_EMAIL_NOT_VERIFIED");
    define("MAIL_FROM_TEAM_COOKERY", "MAIL_FROM_TEAM_COOKERY");
    
    //admins
    define("MAIL_RECEPIENT_ADMIN_EMAIL_1", "ajitkamathk@gmail.com");
    define("MAIL_RECEPIENT_ADMIN_NAME_1", "Ajit Kamath");

    define("MAIL_RECEPIENT_ADMIN_EMAIL_2", "dial2vishal@gmail.com");
    define("MAIL_RECEPIENT_ADMIN_NAME_2", "Vishal Varshney");
    //admins

    //---------------------mail templates---------------------
    define("MAIL_TEMPLATE_ERROR_CRITICAL_CONTENT", "error_critical.html");
    define("MAIL_TEMPLATE_ERROR_CRITICAL_SUBJECT", "Critical Error Alert !");

    define("MAIL_TEMPLATE_ERROR_MODERATE_CONTENT", "error_moderate.html");
    define("MAIL_TEMPLATE_ERROR_MODERATE_SUBJECT", "Moderate Error Alert !");

    define("MAIL_TEMPLATE_RECIPE_CONTENT", "recipe.html");
    define("MAIL_TEMPLATE_USER_CONTENT", "user.html");
    define("MAIL_TEMPLATE_EMAIL_CONFIRMATION_CONTENT", "emailconfirmation.html");
    //---------------------mail templates---------------------
    
    //---------------------mail server config---------------------
    define("MAIL_USERNAME", "teamcookery@gmail.com");
    define("MAIL_PASSWORD", "cookery@3912");

    define("MAIL_FROM_INFO_EMAIL", "info@cookery.com");
    define("MAIL_FROM_INFO_NAME", "Team Cookery");
    
    define("MAIL_REPLY_EMAIL", "support@cookery.com");
    define("MAIL_REPLY_NAME", "Support Team Cookery");
    
    define("MAIL_ENCRYPTION", "tls"); 
    define("MAIL_HOST", "smtp.gmail.com");
    define("MAIL_PORT", "587");
    define("MAIL_DEBUG", "0");          //0-prod, 1-client messages, 2-client and server messages
    //---------------------mail server config---------------------

    //---------------------database config---------------------
    define("DATABASE_HOSTNAME", "db4free.net");
    define("DATABASE_USER", "cookeryuser");
    define("DATABASE_PASSWORD", "cookeryuser");
    define("DATABASE_NAME", "cookery");
    define("DATABASE_PORT", "3306");
	
	define("DATABASE_TIMEZONE_OFFSET", "+5:30");	//this is relative to UTC timezone. For eg: IST is +5:30

    define("DATABASE_CONNECTION_COUNTER", "database.connection.counter");
    define("DATABASE_CONNECTION_LEAK_TIMESTAMP", "database.connection.leak.timestamp");

    define("DATABASE_TRANSACTION_COUNTER", "database.transaction.counter");
    define("DATABASE_TRANSACTION_LEAK_TIMESTAMP", "database.transaction.leak.timestamp");
    //---------------------database config---------------------

    //---------------------------API----------------------------
    define("API_KEY_IDENTFIER", "x-api-key");
    define("API_KEY_ANDROID", "AIzaSyAxI2I8Wvt784ExlS_BBHY8uWPakM7XRBo");
    define("API_KEY_WEB", "AIzaSyB6K3ksqK8KAH5GBuf2RWqtoEG7qYvOEu0");
    //---------------------------API----------------------------

    //---------------------------SONAR CLOUD----------------------------
    define("SONAR_PROJECT_KEY_IDENTFIER", "X-SonarQube-Project");
    define("SONAR_PROJECT_KEY_ANDROID", "Cookery_Android_DEV_Key");
    define("SONAR_PROJECT_KEY_PHP", "");
    //---------------------------SONAR CLOUD----------------------------

    //---------------------timeline---------------------
    //timelines count to load at a time
    define("TIMELINES_COUNT","5");

    //recipes count to load at a time
    define("RECIPES_COUNT","5");

    //comments count to load at a time   
    define("COMMENTS_COUNT","5");

    //reviews count to load at a time   
    define("REVIEWS_COUNT","5");

    //users to load at a time
    define("USERS_COUNT","10");

    //--------------------TIMELINE/STORY Keys Starts here-----------------
    //Note: Addition/modification/deletion of timeline/story keys should be followed with careful updation of query in Timeline::fetchUserStories function 'NOT IN' part

    //user
    define("USER_ADD","USER_ADD");
    define("USER_PHOTO_MODIFY","USER_PHOTO_MODIFY");
    define("USER_FOLLOW","USER_FOLLOW");
    define("USER_UNFOLLOW","USER_UNFOLLOW");
	define("USER_BIO_ADD","USER_BIO_ADD");
	define("USER_BIO_UPDATE","USER_BIO_UPDATE");
    //user

    //recipe
    define("RECIPE_ADD","RECIPE_ADD");
    define("RECIPE_MODIFY","RECIPE_MODIFY");
    define("RECIPE_REMOVE","RECIPE_REMOVE");
    //recipe

    //comment
    define("COMMENT_RECIPE_ADD","COMMENT_RECIPE_ADD");
    define("COMMENT_RECIPE_REMOVE","COMMENT_RECIPE_REMOVE");
    define("COMMENT_RECIPE_IMG_ADD","COMMENT_RECIPE_IMG_ADD");
    define("COMMENT_RECIPE_IMG_REMOVE","COMMENT_RECIPE_IMG_REMOVE");
    define("COMMENT_USER_ADD","COMMENT_USER_ADD");
    define("COMMENT_USER_REMOVE","COMMENT_USER_REMOVE");
    //comment

    //like
    define("LIKE_RECIPE_ADD","LIKE_RECIPE_ADD");
    define("LIKE_RECIPE_REMOVE","LIKE_RECIPE_REMOVE");
    define("LIKE_RECIPE_IMG_ADD","LIKE_RECIPE_IMG_ADD");
    define("LIKE_RECIPE_IMG_REMOVE","LIKE_RECIPE_IMG_REMOVE");
    
    define("LIKE_COMMENT_ADD","LIKE_COMMENT_ADD");
    define("LIKE_COMMENT_REMOVE","LIKE_COMMENT_REMOVE");

    define("LIKE_REVIEW_ADD","LIKE_REVIEW_ADD");
    define("LIKE_REVIEW_REMOVE","LIKE_REVIEW_REMOVE");

    define("LIKE_USER_ADD","LIKE_USER_ADD");
    define("LIKE_USER_REMOVE","LIKE_USER_REMOVE");
    //like

    //review
    define("REVIEW_RECIPE_ADD","REVIEW_RECIPE_ADD");
    define("REVIEW_RECIPE_REMOVE","REVIEW_RECIPE_REMOVE");
    //review
    //--------------------TIMELINE/STORY Keys ends here-----------------
    //---------------------timeline---------------------

    //----------------------TRENDS--------------------------------------
    define("RECIPES_OF_THE_MONTH","RECIPES_OF_THE_MONTH");
    define("USER_OF_THE_WEEK","USER_OF_THE_WEEK");
    define("RECIPE_OF_THE_DAY","RECIPE_OF_THE_DAY");
    //----------------------TRENDS--------------------------------------

    //----------------------DEFAULTS--------------------------------------
    define("DEFAULT_SCOPE_ID","1");
    define("DEFAULT_INGREDIENT_ID","99");
    //----------------------DEFAULTS--------------------------------------

    //----------------------HTTP ERROR CODES---------------------------
    define("HTTP_OK", 200);
    define("HTTP_FORBIDDEN", 403);
    define("HTTP_INTERNAL_ERROR", 500);
    define("HTTP_NOT_IMPLEMENTED", 501);
    //----------------------HTTP ERROR CODES---------------------------

    //Constants
    define("CONTROLLER_SERVICE", "Controller");
    
?>