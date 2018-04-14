<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="http://cookery_php-dial2vishal53897.codeanyapp.com/private/web/admincontrolpanel/web/webutils/assets/css/style.css">
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  </head>
  <body>
    <div class="wrapper">
			<div class="container">
				<h3><?php $msg = isset($_GET['msg']) ? $_GET['msg'] : ''; echo $msg?>
				</h3><br><br>
				<h1>Welcome Admin !!!</h1>
					<form action="/private/web/admincontrolpanel/appcontext/controller.php" method="post" class="form">
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
