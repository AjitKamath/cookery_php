<?php
session_start();
if($_SESSION['sid']==session_id())
{
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cookery | Ingredients</title>
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
    <body class="skin-blue" onload="fetchIngredients(1)">
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
                        Modify Ingredients
                        <small>you can modify ingredients here !!!</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li>Ingredients</li>
												<li class="active">Modify Ingredient</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                	<table id="dataTableReport"  class="table table-bordered table-hover" style="width: 100%;">
											<thead>
												<tr class="bg-blue" style="display:block;" >
													<th style="width:10%; text-align:center;">Select</th>
													<th style="width:38%; text-align:center;">Ingredient</th>
													<th style="width:38%; text-align:center;">Ingredient AKA</th>
													<th style="width:20%; text-align:center;">Status</th>
													<th style="width:10%; text-align:center;">Edit</th>
													<th style="width:10%; text-align:center;">Delete</th>
												</tr>
											</thead>
											<tbody  class="dataTableReport" style="display: block; width:100%; overflow: scroll; height: 420px;">
												<tr>
												</tr>
											 </tbody>
									</table>
									<input class="btn btn-primary btn-sm" style="margin-left: 36%;margin-top: 3%;width: 25%;" id="btn-chat" onclick="multipleIngredientDelete('ing_id');" type='submit' value='Delete Multiple'>
              <div class="modal fade" id="myModal" role="dialog">
								`		<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												 <div class="modal-header">
														 <button type="button" class="close" data-dismiss="modal">&times;</button>
														 <h4 class="modal-title">Edit Ingredient</h4>
												 </div>
													<div class="modal-body">
														<form  class="form-horizontal" role="form">
																	<div class="form-group">
																					<div class="col-sm-10">
																						<input type="hidden" style="width:20%;" id="ing_id" class="form-control" name="ing_id">
																					</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-2" for="ing_name">Ingredient Name:</label>
																		<div class="col-sm-10">
																			<input type="text" style="width:50%;" id="ing_name" class="form-control" required placeholder="Ingredient Name">
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-2" for="ing_aka_name">Ingredient AKA Name:</label>
																		<div class="col-sm-10">
																			<input type="text" style="width:50%;" id="ing_aka_name" class="form-control" required placeholder="Ingredient AKA Name">
																		</div>
																	</div>
																	<div class="form-group">        
																		<div class="col-sm-offset-2 col-sm-10" style="margin-left:80%; margin-top:-5%">
																			<button class="btn btn-primary btn-sm" name="submit" value="update" onclick="updateIngredients()" class="btn btn-default">Update</button>
																		</div>
																	</div>
														</form>        
													</div>
												</div>	
											</div>
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