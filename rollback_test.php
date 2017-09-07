<?php
include 'config_roll.php';

//$mysqli = new mysqli("localhost", "root", "", "bmb");


$all_query_ok=true; // our control variable


$SQL1 = "INSERT INTO `BOOK` (`TITLE`, `COUNT`, `CTGRY_ID`, `AUTHOR`, `PUBLICATION`, `DESCRIPTION`, `IMAGE`, `CREATE_DTM`) VALUES ('title',2,26, 'author', 'publication', 'description', 'target_path', CURRENT_TIMESTAMP)";

$mysqli->autocommit(FALSE);

$mysqli->query($SQL1) ? null : $all_query_ok=false;

if(!$all_query_ok)
{
	echo "SQL1 Failed";
	echo "<br>";
	echo $SQL1;
}

  $SQL2 = "INSERT INTO `USER_BOOK_SHARE` (`USER_ID`, `BOOK_ID`, `RENT`, `MIN_DURATION`, `MAX_DURATION`, `ACTIVE`) VALUES (8, 2, 220, 1, 1, 'Y')";

$mysqli->query($SQL2) ? null : $all_query_ok=false;

if(!$all_query_ok)
{
	echo $all_query_ok;
	echo "SQL2 Failed";
	echo "<br>";
	echo $SQL2;
}
/*
//we make 4 inserts, the last one generates an error
//if at least one query returns an error we change our control variable
$mysqli->query("INSERT INTO myCity (id) VALUES (100)") ? null : $all_query_ok=false;
$mysqli->query("INSERT INTO myCity (id) VALUES (200)") ? null : $all_query_ok=false;
$mysqli->query("INSERT INTO myCity (id) VALUES (300)") ? null : $all_query_ok=false;
$mysqli->query("INSERT INTO myCity (id) VALUES (100)") ? null : $all_query_ok=false; //duplicated PRIMARY KEY VALUE

*/
//now let's test our control variable
$all_query_ok ? $mysqli->commit() : $mysqli->rollback();

$mysqli->close();
?>
