<?php
session_start();
if($_SESSION['sid']==session_id())
{
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookery | User</title>
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
    <body class="skin-blue" onload="fetchUsers(2)">
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
                                <span>Cookery <i class="caret"></i></span>
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
                        Reset Password
                        <small>you can reset user password here !!!</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li>Users</li>
												<li class="active">Reset Password</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="form-group">
                       <form name='newad' method='post' enctype='multipart/form-data' action=''>
                          <table>
                            <tr>
                              <td>
                                 <div class="form-group">
                                    <label class="control-label col-sm-4" >User name:</label>
                                      <div class="col-sm-6">
                                          <select id = "users">
                                          </select>
                                      </div>
                                 </div>
                             </td>
                             </tr>
                             <tr>
                                 <td>
                                    <div class="form-group">
                                      <label class="control-label col-sm-4" >Current Password:</label>
                                      <div class="col-sm-10">
                                        <input type="password"  style="width:90%;margin-left: 40%;margin-top: -12%;" name='user_password' class="form-control" required placeholder="Current Password">
                                      </div>
                                    </div><br><br>
                                 </td>
                              </tr>
                              <tr>
                                  <td>
                                      <div class="form-group">
                                          <label class="control-label col-sm-4" >New Password:</label>
                                            <div class="col-sm-10">
                                              <input type="password"  style="width:90%;margin-left: 40%;margin-top: -12%;" name='new_password' class="form-control" required placeholder="New Password">
                                            </div>
                                      </div><br><br>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <div class="form-group">
                                        <label class="control-label col-sm-4" >Re-Type New Password:</label>
                                          <div class="col-sm-10">
                                            <input type="password"  style="width:90%;margin-left: 40%;margin-top: -12%;" name='retype_password' class="form-control" required placeholder="Re-Type Password">
                                          </div>
                                      </div><br><br>
                                  </td>
                              </tr>
                              <tr>
                                 <td>
                                    <input class="btn btn-warning btn-sm" style="margin-left:60%" id="btn-chat" name='Submit' type='submit' value='Change Password'></td>
                                 </td>
                              </tr>
                          </table>
                       </form>
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
    </body>
</html>
<?php
}
else{
    header('Location : /private/web/admincontrolpanel/web/pages/index.php' );
}
?>