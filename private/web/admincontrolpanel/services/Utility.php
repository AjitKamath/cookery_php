<?php
	class Utility{
    
   	public static function check_for_null($value) {
			if (is_array($value)) {
				if (count($value) > 0) {
					return TRUE;
				} else {
					return FALSE;
				}
			} else {
				if (($value != '') && ($value !== NULL) && (strlen(trim($value)) > 0)) {
					return TRUE;
				} else {
					return FALSE;
				}
			}
		}
    
    
    public static function logger($class, $method, $line, $type, $msg)
		{
      $file = fopen(LOGS_FILE_NAME,"a");
      fwrite($file,"\n".$class."__".$method."__".$line."__".$type."__".$msg);
      fclose($file);
    }
    
    public static function check_user_access($operation)
    {
     //check for null/empty
			if(!Utility::check_for_null($operation)){
					Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", "Error ! null/empty operation");
					return FALSE;
			}
      session_start();
      if($_SESSION['role'] == ADMIN)
      {
        if (in_array($operation, unserialize(ADMIN_ACCESS))) {
            return TRUE;
        }else{
          return FALSE;
        }
      }
      else if($_SESSION['role'] == EMPLOYEE)
      {
        if (in_array($operation, unserialize(EMPLOYEE_ACCESS))) {
            return TRUE;
        }else{
          return FALSE;
        }
      }
    }
    
    
    public static function uploadImage($category)
    {
      try
      {
        if(INGREDIENT_IMAGE == $category)
        {
          $path = ING_IMG_PATH;
          $message = "Ingredient";
        }
        else if(FOOD_TYPE_IMAGE == $category)
        {
          $path = FOOD_TYPE_IMG_PATH;
          $message = "Food Type";
        }
        else if(FOOD_CUISINE_IMAGE == $category)
        {
          $path = FOOD_CUISINE_IMG_PATH;
          $message = "Food Cuisine";
        }
        
        
        $validextensions = array("jpeg", "jpg", "png");
        $temporary = explode(".", $_FILES["photo"]["name"]);
        $file_extension = end($temporary);
        
        if ((($_FILES["photo"]["type"] == "image/png") || ($_FILES["photo"]["type"] == "image/jpg") || ($_FILES["photo"]["type"] == "image/jpeg")
            ) && ($_FILES["photo"]["size"] < 2097152)//Approx. 2 megabytes files can be uploaded.
              && in_array($file_extension, $validextensions)) 
        {
          if ($_FILES["photo"]["error"] > 0)
          {
            Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", $message." image uploading error - Return Code: " . $_FILES["photo"]["error"]);
          }
          else
          {
            if (file_exists($path.$_FILES["photo"]["name"])) 
            {
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $message." image already exists " .$_FILES["photo"]["name"]);
              return "EXISTS";
            }
            else
            {
              $sourcePath = $_FILES["photo"]["tmp_name"]; // Storing source path of the file in a variable
              $targetPath = $path.$_FILES["photo"]["name"]; // Target path where file is to be stored
              move_uploaded_file($sourcePath,$targetPath) ; // Moving Uploaded file
              Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $message." image Uploaded successfully");
              return $_FILES["photo"]["name"];
            }
          }
        }
        else
        {
         Utility::logger(__CLASS__, __METHOD__, __LINE__, "I", $message." image is to large");
        }
      }
      catch(Exception $e)
      {
        Utility::logger(__CLASS__, __METHOD__, __LINE__, "E", 'Message: ' .$e->getMessage());
        mysqli_rollback($connection);
			}
    }
    
    
  }

?>