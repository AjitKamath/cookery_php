<?php
	class DatabaseUtil {
		private static $filename = "DatabaseUtil.php";
		private static $instance = NULL;
		
		public static function getInstance(){
			if(is_null(self::$instance)){
				self::$instance = new self();
			}
			return self::$instance;
		}
		
		public static function open_connection() {
			$conn = mysqli_connect(DATABASE_HOSTNAME, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME, DATABASE_PORT);

			if(! $conn) {
				logger($filename, "E", "Failed to connect to MySQL: " . mysqli_connect_error());
				echo "Failed to connect to MySQL: " . mysqli_connect_error();
				die("Failed to connect to MySQL: " . mysqli_error());
			}

			return $conn;
		}

		public static function close_connection($conn) {
			mysqli_close($conn);
		}
	}
?>





<!-- <?php
	

	
?> -->