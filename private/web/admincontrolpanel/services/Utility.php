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
    
    
  }

?>