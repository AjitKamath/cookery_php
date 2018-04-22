<?php
session_start();
if($_SESSION['sid']==session_id())
{
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookery | Users</title>
						<meta name="viewport" content="width=device-width, initial-scale=1">
						<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
						<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        		<!-- bootstrap 3.0.2 -->
							<?php include_once($_SERVER['DOCUMENT_ROOT'].'/private/web/admincontrolpanel/web/webutils/webimportscripts.php'); ?>
						<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
						<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
						<!--[if lt IE 9]>
							<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
							<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
						<![endif]-->
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="dashboard.php" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Cookery
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                       
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Admin <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="/private/web/admincontrolpanel/appcontext/controller.php?function_key=LOGOUT" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
             <?php include_once($_SERVER['DOCUMENT_ROOT'].'/private/web/admincontrolpanel/web/webutils/navigator.php'); ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Add User
                        <small>you can add user here !!!</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li>Users</li>
												<li class="active">Add User</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- top row -->
                    <div class="row"style="margin-left: 5%; margin-top: 5%; ">
                        <form method='post' enctype='multipart/form-data'>
                           <table>
                             <tr>
                                <td>
                                  <div class="form-group">
                                    <label class="control-label col-sm-4" >User name:</label>
                                      <div class="col-sm-10">
                                        <input type="text" style="width: 90%;margin-left: 40%;margin-top: -12%;" id='user_name' class="form-control" required placeholder="User Name">
                                      </div>
                                    </div><br><br>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                   <div class="form-group">
                                      <label class="control-label col-sm-4" >Password:</label>
                                        <div class="col-sm-10">
                                          <input type="password"  style="width:90%;margin-left: 40%;margin-top: -12%;" id='user_password' class="form-control" required placeholder="Password">
                                        </div>
                                   </div><br><br>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                   <div class="form-group">
                                      <label class="control-label col-sm-4" >Role:</label>
                                        <select id='user_role' >
                                        <option value="Admin">Admin</option>
                                        <option value="Employee">Employee</option>
                                        </select>
                                   </div><br><br>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <div class="form-group">
                                      <label class="control-label col-sm-4" >Mobile:</label>
                                        <div class="col-sm-10">
                                          <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="10" style="width:90%;margin-left: 40%;margin-top: -12%;" id='user_mobile' class="form-control" required placeholder="Mobile">
                                        </div>
                                    </div><br><br>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                    <div class="form-group">
                                      <label class="control-label col-sm-4" >Email:</label>
                                        <div class="col-sm-10">
                                          <input type="email"  style="width:90%;margin-left: 40%;margin-top: -12%;" id='user_email' class="form-control" required placeholder="Email">
                                        </div>
                                    </div><br><br>
                                  </td>
                              </tr>
                              <tr>
                                 <td>
                                  <input class="btn btn-success btn-sm" style="margin-left: 4%;margin-top: 5%;width: 97%;" id="btn-chat" onclick="saveUser();" type='submit' value='Add User'>
                                 </td>
                              </tr>
                           </table>
                        </form>
                    </div>
								</section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div> <!-- ./wrapper -->
    </body>
</html>
<?php
}
else{
    header('Location : /private/web/admincontrolpanel/web/pages/index.php' );
}
?>