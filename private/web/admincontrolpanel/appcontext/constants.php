<?php 

// paths

//define("HOME_DIRECTORY", $_SERVER['DOCUMENT_ROOT']."/");
//define("LOGS_FILE_PATH", HOME_DIRECTORY."logs/");
define("LOGS_FILE_NAME", $_SERVER['DOCUMENT_ROOT'] ."/private/web/admincontrolpanel/logs/log.log");
define("CSS_PATH", "http://cookery_php-dial2vishal53897.codeanyapp.com/private/web/admincontrolpanel/web/webutils/assets/css");
define("JS_PATH", "http://cookery_php-dial2vishal53897.codeanyapp.com/private/web/admincontrolpanel/web/webutils/assets/js");
define("COMMON_HEAD", $_SERVER['DOCUMENT_ROOT']."/private/web/admincontrolpanel/web/pages/commonhead.php");
define("COMMON_HEADER", $_SERVER['DOCUMENT_ROOT']."/private/web/admincontrolpanel/web/pages/commonheader.php");
define("WEB_IMPORTS", $_SERVER['DOCUMENT_ROOT']."/private/web/admincontrolpanel/web/webutils/webimportscripts.php");
define("NAVIGATOR", $_SERVER['DOCUMENT_ROOT']."/private/web/admincontrolpanel/web/webutils/navigator.php");
define("COMMON_DASHBOARD", $_SERVER['DOCUMENT_ROOT']."/private/web/admincontrolpanel/web/pages/commondashboard.php");
define("LOGIN", "/private/web/admincontrolpanel/web/pages/index.php");
define("ING_IMG_PATH" , "/home/cabox/workspace/app_data/master_data/ingredients/");
define("FOOD_TYPE_IMG_PATH" , "/home/cabox/workspace/app_data/master_data/food_type/");
define("FOOD_CUISINE_IMG_PATH" , "/home/cabox/workspace/app_data/master_data/cuisines/");
define("COMMON_IMG_UPLOAD_PATH", "/app_data/master_data/");
define("CUISINES_DIR", "cuisines/");
define("INGREDIENTS_DIR", "ingredients/");
define("FOOD_TYPE_DIR", "food_type/");

// function keys
define("AUTHENTICATE_USER", "AUTHENTICATE_USER");
define("SHOW_ALL_USERS", "SHOW_ALL_USERS");
define("SAVE_INGREDIENT", "SAVE_INGREDIENT");
define("SAVE_FOOD_TYPE", "SAVE_FOOD_TYPE");
define("SAVE_FOOD_CUISINE", "SAVE_FOOD_CUISINE");
define("FETCH_INGREDIENTS", "FETCH_INGREDIENTS");
define("FETCH_FOOD_CUISINE", "FETCH_FOOD_CUISINE");
define("FETCH_FOOD_TYPE", "FETCH_FOOD_TYPE");
define("EDIT_FOOD_TYPE", "EDIT_FOOD_TYPE");
define("EDIT_FOOD_CUISINE", "EDIT_FOOD_CUISINE");
define("EDIT_INGREDIENT", "EDIT_INGREDIENT");
define("UPDATE_INGREDIENTS", "UPDATE_INGREDIENTS");
define("UPDATE_FOOD_TYPE", "UPDATE_FOOD_TYPE");
define("UPDATE_FOOD_CUISINE", "UPDATE_FOOD_CUISINE");
define("LOGOUT", "LOGOUT");
define("MULTI_FOOD_CUISINE_DELETE", "MULTI_FOOD_CUISINE_DELETE");
define("MULTI_FOOD_TYPE_DELETE", "MULTI_FOOD_TYPE_DELETE");
define("MULTI_INGREDIENT_DELETE", "MULTI_INGREDIENT_DELETE");
define("DELETE_INGREDIENT", "DELETE_INGREDIENT");
define("DELETE_FOOD_TYPE", "DELETE_FOOD_TYPE");
define("DELETE_FOOD_CUISINE", "DELETE_FOOD_CUISINE");
define("ADMIN_SAVE_USER", "ADMIN_SAVE_USER");
define("ADMIN_FETCH_USERS", "ADMIN_FETCH_USERS");
define("DELETE_ADMIN_USER", "DELETE_ADMIN_USER");
define("UPDATE_ADMIN_USER_ROLE", "UPDATE_ADMIN_USER_ROLE");
define("SETUP_FOOD_CUISINE_DASHBOARD", "SETUP_FOOD_CUISINE_DASHBOARD");
define("SETUP_FOOD_TYPE_DASHBOARD", "SETUP_FOOD_TYPE_DASHBOARD");
define("SETUP_INGREDIENTS_DASHBOARD", "SETUP_INGREDIENTS_DASHBOARD");
define("SEARCH_FOOD_TYPE", "SEARCH_FOOD_TYPE");
define("SEARCH_FOOD_CUISINE", "SEARCH_FOOD_CUISINE");
define("SETUP_MAIN_DASHBOARD", "SETUP_MAIN_DASHBOARD");
define("FETCH_ING_CATEGORY", "FETCH_ING_CATEGORY");
define("FETCH_ING_BY_CATEGORY", "FETCH_ING_BY_CATEGORY");
define("SEARCH_INGRIDIENTS", "SEARCH_INGRIDIENTS");
define("SETUP_USERS_DASHBOARD", "SETUP_USERS_DASHBOARD");
define("SEARCH_USER", "SEARCH_USER");
define("MULTI_ADMIN_USER_DELETE", "MULTI_ADMIN_USER_DELETE");
define("CREATE", "CREATE");
define("READ", "READ");
define("UPDATE", "UPDATE");
define("DELETE", "DELETE");
define("ADMIN", "Admin");
define("EMPLOYEE", "Employee");
define("INGREDIENT_IMAGE", "INGREDIENT_IMAGE");
define("FOOD_TYPE_IMAGE", "FOOD_TYPE_IMAGE");
define("FOOD_CUISINE_IMAGE", "FOOD_CUISINE_IMAGE");

// Role based Access Specifiers
define("ADMIN_ACCESS", serialize(array("CREATE", "READ", "UPDATE", "DELETE")));
define("EMPLOYEE_ACCESS", serialize(array("CREATE", "READ")));




?>