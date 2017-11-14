<?php
include_once("../util/import_util.php");


$class_obj = db_util::getInstance();
$con = $class_obj::open_connection();
echo $con;

?>