<?php
    //php version (note : increment it on each code commit)
    define("APP_VERSION", "0.1");

    //paths
    define("HOME_DIRECTORY", "/home/cabox/workspace/");
    define("LOGS_DIRECTORY", HOME_DIRECTORY."logs/");
    define("APP_DATA_DIRECTORY", HOME_DIRECTORY."app_data/");
    define("APP_DATA_USERS_DIRECTORY", APP_DATA_DIRECTORY."users/");
    define("APP_DATA_RECIPES_DIRECTORY", "recipes/");
    define("APP_DATA_RECIPES_IMAGES_DIRECTORY", "images/");

    //logs
    define("LOGS_MAX_HISTORY", "7");    //in days

    //---------------------database config---------------------
    define("DATABASE_HOSTNAME", "db4free.net");
    define("DATABASE_USER", "cookeryuser");
    define("DATABASE_PASSWORD", "cookeryuser");
    define("DATABASE_NAME", "cookery");
    define("DATABASE_PORT", "3307");
    //---------------------database config---------------------

    //---------------------timeline---------------------
    //timelines count to load at a time
    define("TIMELINES_COUNT","10");

    //user
    define("USER_ADD","USER_ADD");
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
    define("REVIEW_RECIPE_REMOVE","REVIEW_RECIPE_ADD");
    //review
    //---------------------timeline---------------------
?>