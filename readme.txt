*** PRODUCTION TIPS ***
1. Ensure that the .htpasswd file is in the /secure directory.
2. Ensure that the absolute path of the .htpassword file is in all the .htaccess file of the directories which we want to be protected.
3. Ensure that the version is incremented in Constants.php file.
4. Ensure that the /app_data/users/, /logs directories are present in the root directory.
5. Check all the directories for public access. Only /app_data/users/* & /public/* must be accessible for public.