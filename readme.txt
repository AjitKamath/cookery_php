*** PRODUCTION TIPS ***
1.  Ensure that the .htpasswd file is in the /secure directory.
2.  Ensure that the absolute path of the .htpassword file is in all the .htaccess file of the directories which we want to be protected.
3.  Ensure that the version is incremented in Constants.php file.
4.  Ensure that the /app_data/users/, /logs directories are present in the root directory.
5.  Ensure that the writable directories such as /app_data/*, logs/*, private/stats/database_stats.ini have read/write permissions(777).
6.  Check all the directories for public access. Only /app_data/users/* & /public/* must be accessible for public.
7.  Ensure that the LOGS_SWITCH is set as ERROR in prod and ALL in dev.
8.  Ensure that the LOGS_MAX_HISTORY is set to atleast 5.
9.  Ensure that the /app_data/master_data/cuisines, /app_data/master_data/food_type & /app_data/master_data/ingredients directories are present in the root directory.
10. Ensure that the SONAR_PROJECT_KEY in Constants.php is same as the Project Key in https://sonarcloud.io
11. Ensure that the WebHook URL in https://sonarcloud.io is correct(It must point to the <URL>/SonarCloudController.php)
12. Configure GitHub WebHooks
