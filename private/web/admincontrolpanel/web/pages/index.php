<?php
include_once($_SERVER['DOCUMENT_ROOT'].'/private/web/admincontrolpanel/appcontext/constants.php');
?>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="<?php echo INDEX_CSS_PATH ?>" rel="stylesheet" type="text/css" />
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  </head>
  <body>
    <div class="wrapper">
			<div class="container">
				<h3><?php $msg = isset($_GET['msg']) ? $_GET['msg'] : ''; echo $msg?>
				</h3><br><br>
				<h1>Welcome Admin !!!</h1>
					<form action="<?php echo CONTROLLER; ?>" method="post" class="form">
						<input type="text" name="username" required id="username" placeholder="Username">
						<input type="password" name="password" required id="password" placeholder="Password">
						<input type="hidden" name="function_key" id="function_key" value="AUTHENTICATE_USER">
						<button type="submit"  name="submit"  value="submit" id="submit">Login</button>
					</form>
			</div>
			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</body>
</html>
