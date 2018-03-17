<?php
	// !!! This file is public !!! Make sure no sensitive info's are recorded here. !!!	

	include_once($_SERVER['DOCUMENT_ROOT'].'/'.'private/util/ImportUtil.php');

	
	$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
	if(count($config) == 0){
		$config['database.connection.counter'] = 0;
	}	


	$config['database.connection.counter'] = $config['database.connection.counter']+1;
	DatabaseUtil::put_ini_file($config, STATS_DIRECTORY.STATS_DATABASE_FILE);

	$config = parse_ini_file(STATS_DIRECTORY.STATS_DATABASE_FILE, true);
	echo json_encode($config);

	//this function triggers on every class object creation or static method calls
	function __autoload($class_name){
        //relative paths to directories to scan for autoload
        $directorys = array(
            'private/services/',
            'private/util/'
        );
		//relative paths to directories to scan for autoload
        
        //for each directory
        foreach($directorys as $directory){
			$file_path = $_SERVER['DOCUMENT_ROOT'].'/'.$directory.$class_name . '.php';
			
			//see if the file exsists
            if(file_exists($file_path)){
				require_once($file_path);
                //echo "autoloaded : ".$file_path;
                return;
            }            
        }
    }
    //this function triggers on every class object creation or static method calls
?>