<?php
session_start();
if($_SESSION['sid']==session_id())
{
include_once($_SESSION['webimports']);
?>
<!DOCTYPE html>
<html>
    <head>
        <?php include_once(COMMON_HEAD); ?>
    </head>
    <body class="skin-blue" onload="setUpUsers()">
        <!-- header logo: style can be found in header.less -->
        <?php include_once(COMMON_HEADER); ?>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
             <?php include_once(NAVIGATOR); ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Manage Users
                        <small>you can review and modify users here !!!</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li>Users</li>
												<li class="active">Manage Users</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                  <?php include_once(COMMON_DASHBOARD); ?>
                  <div class="row" style="margin-left: 5%;">
                        <form method='post' enctype='multipart/form-data'>
                          <div class="form-group">
                              <label class="control-label col-sm-1" >User name:</label>
                                <div class="col-sm-2">
                                  <input type="text" id='user_name_add' class="form-control" required placeholder="User Name">
                                </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-sm-1" >Password:</label>
                                <div class="col-sm-2">
                                  <input type="password" id='user_password' class="form-control" required placeholder="Password">
                                </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-1" >Role:</label>
                              <select id='user_role' >
                              <option value="Admin">Admin</option>
                              <option value="Employee">Employee</option>
                            </select>
                          </div><br>
                          <div class="form-group">
                           <label class="control-label col-sm-1" >Mobile:</label>
                            <div class="col-sm-2">
                              <input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="10" id='user_mobile' class="form-control" required placeholder="Mobile">
                            </div>
                          </div>
                          <div class="form-group">
                           <label class="control-label col-sm-1" >Email:</label>
                            <div class="col-sm-2">
                              <input type="email" id='user_email' class="form-control" required placeholder="Email">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-2">
                               <input class="btn btn-success btn-sm" id="btn-chat" onclick="saveUser();" type='button' value='Add User'>
                            </div>
                          </div>
                        </form>
                    </div>
                      <br><br><hr>
                      <div class="row" style="margin-left: 5%;">
                        <form>
                           <label class="control-label col-sm-1" >Looking for</label>
                           <div class="col-sm-2">
                            <input type="text" id="user_name_search" class="form-control" required placeholder="Search for..">
                           </div>
                           <div class="col-sm-2">
                            <input class="btn btn-success btn-sm"  onclick="searchUser()" type='button' value='Search'>
                           </div>
                          </form>
                           <div class="col-sm-2">
                            <input class="btn btn-primary btn-sm" onclick="multipleUserDelete('user_id');" type='submit' value='Delete'>
                           </div>
                           <div class="col-sm-2">
                            <input class="btn btn-primary btn-sm" onclick="multipleUserDelete('user_id');" type='submit' value='Reset Password'>
                           </div>
                      </div>
                  <br><br><hr>
                	<div style="display: block; height: 400px; overflow-y: auto;">
                    <table id="dataTableReport" class="table table-bordered table-hover">
                        <thead>
                          <tr class="bg-blue">
                            <th class="col-sm-2" style="text-align:center;">SELECT</th>
                            <th class="col-sm-6" style="text-align:center;">USER</th>
                            <th class="col-sm-3" style="text-align:center;">ROLE</th>
                            <th class="col-sm-3" style="text-align:center;">STATUS</th>
                            <th class="col-sm-2" style="text-align:center;">EDIT</th>
                          </tr>
                        </thead>
                        <tbody class="dataTableReport">
                          <tr>
                          </tr>
                         </tbody>
                    </table>
                  </div>
                  <div class="modal fade" id="myModal" role="dialog">
								`		<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												 <div class="modal-header">
														 <button type="button" class="close" data-dismiss="modal">&times;</button>
														 <h4 class="modal-title">Manage User</h4>
												 </div>
													<div class="modal-body">
														<form  class="form-horizontal" role="form">
																	<div class="form-group">
																					<div class="col-sm-10">
																						<input type="hidden" style="width:20%;" id="user_id" class="form-control" name="user_id">
																					</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-sm-2" for="user_name">User Name:</label>
																		<div class="col-sm-10">
																			<input type="text" style="width:50%;" id="user_name_edit" class="form-control" required placeholder="User Name">
																		</div>
																	</div>
                                  <label class="control-label col-sm-3" >Role:</label>
                                  <div class="col-sm-10">
                                      <select id='edituser_role' style="margin-left:35%;" >
                                      <option value="Admin">Admin</option>
                                      <option value="Employee">Employee</option>
                                      </select>
                                  </div>
                                  <div class="form-group">        
																		<div class="col-sm-offset-2 col-sm-10" style="margin-left:80%; margin-top:-5%">
																			<button class="btn btn-primary btn-sm" name="submit" value="update" onclick="updateUser()" class="btn btn-default">Update</button>
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
    include_once('../../appcontext/constants.php');
    header(LOGIN);
}
?>