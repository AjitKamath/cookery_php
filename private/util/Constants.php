<?php
    //php code version (note : in prod, increment it on each code commit)
    define("APP_VERSION", "0.1");

    //paths
    define("HOME_DIRECTORY", $_SERVER['DOCUMENT_ROOT']."/");
    define("LOGS_DIRECTORY", HOME_DIRECTORY."logs/");
    define("APP_DATA_DIRECTORY", HOME_DIRECTORY."app_data/");
    define("APP_DATA_USERS_DIRECTORY", APP_DATA_DIRECTORY."users/");
    define("APP_DATA_PROFILE_DIRECTORY", "profile/");
    define("APP_DATA_PROFILE_IMAGES_DIRECTORY", "images/");
    define("APP_DATA_RECIPES_DIRECTORY", "recipes/");
    define("APP_DATA_RECIPES_IMAGES_DIRECTORY", "images/");

    //logs
    define("LOGS_SWITCH", "ALL");       //OFF,ALL,INFO,ERROR
    define("LOGS_MAX_HISTORY", "7");    //in days

    //email verification
    define("VERIFY_EMAIL_VERI_CODE_EXPIRE", "1");   //in days
    define("VERIFY_EMAIL_INVALID_URL", "VERIFY_EMAIL_INVALID_URL");
    define("VERIFY_EMAIL_VERICODE_EXPIRED", "VERIFY_EMAIL_VERICODE_EXPIRED");
    define("VERIFY_EMAIL_VERIFIED", "VERIFY_EMAIL_VERIFIED");
    define("VERIFY_EMAIL_NOT_VERIFIED", "VERIFY_EMAIL_NOT_VERIFIED");

    //---------------------database config---------------------
    define("DATABASE_HOSTNAME", "db4free.net");
    define("DATABASE_USER", "cookeryuser");
    define("DATABASE_PASSWORD", "cookeryuser");
    define("DATABASE_NAME", "cookery");
    define("DATABASE_PORT", "3307");
    //---------------------database config---------------------

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
    define("USERS_COUNT","5");

    //user
    define("USER_ADD","USER_ADD");
    define("USER_PHOTO_MODIFY","USER_PHOTO_MODIFY");
    define("USER_FOLLOW","USER_FOLLOW");
    define("USER_UNFOLLOW","USER_UNFOLLOW");
    //user

    //recipe
    define("RECIPE_ADD","RECIPE_ADD");
    define("RECIPE_MODIFY","RECIPE_MODIFY");
    define("RECIPE_REMOVE","RECIPE_REMOVE");
    //recipe

    //comment
    define("COMMENT_RECIPE_ADD","COMMENT_RECIPE_ADD");
    define("COMMENT_RECIPE_REMOVE","COMMENT_RECIPE_REMOVE");
    //comment

    //like
    define("LIKE_RECIPE_ADD","LIKE_RECIPE_ADD");
    define("LIKE_RECIPE_REMOVE","LIKE_RECIPE_REMOVE");

    define("LIKE_COMMENT_ADD","LIKE_COMMENT_ADD");
    define("LIKE_COMMENT_REMOVE","LIKE_COMMENT_REMOVE");

    define("LIKE_REVIEW_ADD","LIKE_REVIEW_ADD");
    define("LIKE_REVIEW_REMOVE","LIKE_REVIEW_REMOVE");
    //like

    //review
    define("REVIEW_RECIPE_ADD","REVIEW_RECIPE_ADD");
    define("REVIEW_RECIPE_REMOVE","REVIEW_RECIPE_REMOVE");
    //review
    //---------------------timeline---------------------

    define("DEFAULT_SCOPE_ID","1");
?>