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
    <body class="skin-blue" onload="setUpIngredients()">
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
                        Manage Ingredients
                        <small>you can review and modify ingredients here !!!</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li>Ingredients</li>
												<li class="active">Manage ingredients</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                  <?php include_once(COMMON_DASHBOARD); ?>
                    <div class="col-md-10" >
                      <span style="color: darkviolet;font-family: initial;"><?php $msg = isset($_GET['msg']) ? $_GET['msg'] : ''; echo $msg?></span><br>  
                        <form action="/private/web/admincontrolpanel/appcontext/controller.php" method="post" enctype="multipart/form-data">
                              <div class="form-group">
                                <label class="control-label col-sm-1" >Ingredient Name</label>
                                  <div class="col-sm-2">
                                    <input type="text" id="ing_name" name="ing_name" class="form-control" required placeholder="Ingredient Name">
                                  </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-1" >Select Category</label>
                                  <div class="col-sm-1">
                                     <select id = "category" name="category" onchange="fetchIngByCat()">
                                     </select>
                                  </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-sm-1"  style="margin-left:5%;">Available Ingredients</label>
                                  <div class="col-sm-1">
                                     <select id = "availableingredientsunderselectedcategory" name="availableingredientsunderselectedcategory">
                                     </select>
                                  </div>
                              </div>
                              <div class="form-group">
                                <input type="hidden" name="function_key" id="function_key" value="SAVE_INGREDIENT">
                                <label class="control-label col-sm-1"  style="margin-left:5%;">Ingredient Image</label>
                                  <div class="col-sm-2">
                                     <input type="file" name="photo" id="fileSelect">
                                  </div>
                              </div>
                              <input class="btn btn-success btn-sm" id="btn-chat" type='submit' value='Save Ingredient'>
                          </form>
                      </div>
                      <br><br><hr>
                      <div class="col-md-10">
                        <form>
                           <label class="control-label col-sm-2" >Looking for</label>
                           <div class="col-sm-3">
                            <input type="text" id="ing_name_search" class="form-control" required placeholder="Search for..">
                           </div>
                           <div class="col-sm-3">
                            <input class="btn btn-success btn-sm"  onclick="searchIngredient()" type='button' value='Search'>
                           </div>
                          </form>
                           <div class="col-sm-3">
                            <input class="btn btn-primary btn-sm" onclick="multipleIngredientDelete('ing_id');" type='submit' value='Delete'>
                           </div>
                      </div>
                  <br><br><hr>
                	<div style="display: block; height: 400px; overflow-y: auto;">
                    <table id="dataTableReport" class="table table-bordered table-hover">
                        <thead>
                          <tr class="bg-blue">
                            <th class="col-sm-2" style="text-align:center;">SELECT</th>
                            <th class="col-sm-6" style="text-align:center;">INGREDIENT</th>
                            <th class="col-sm-3" style="text-align:center;">REGULARISED</th>
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
																		<div class="col-sm-offset-2 col-sm-10" style="margin-left:80%; margin-top:-5%">
																			<button class="btn btn-primary btn-sm" name="submit" value="update" onclick="updateIngredient()" class="btn btn-default">Update</button>
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
    header('Location : '.LOGIN );
}
?>