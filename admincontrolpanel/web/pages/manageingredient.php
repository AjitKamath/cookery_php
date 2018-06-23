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
                      <span style="color: white;font-family: initial;"><?php $msg = isset($_GET['msg']) ? $_GET['msg'] : ''; echo $msg?></span><br>  
                    </div>   
                      <br><br><hr>
                      <div>
                        <label class="control-label col-sm-1" >Looking for</label>
                         <div class="col-sm-3">
                          <input type="text" id="ing_name_search" class="form-control" required placeholder="Search for..">
                         </div>
                         <div class="col-sm-3">
                          <input class="btn btn-success btn-sm"  onclick="searchIngredient()" type='button' value='Search'>
                         </div>
                         <div class="col-sm-1">
                          <input class="btn btn-danger btn-sm" onclick="multipleIngredientDelete('ing_id');" type='submit' value='Delete'>
                         </div>
                         <div class="col-sm-3">
                          <input class="btn btn-primary btn-sm" onclick="showAddIngredient();" type='submit' value='Add Ingredient'>
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
                        <div class="modal fade" id="AddIngredientModal" role="dialog">
                    `		<div class="modal-dialog">
                          <!-- Modal content-->
                          <div class="modal-content">
                             <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                                 <h4 class="modal-title">Add Ingredient</h4>
                             </div>
                              <div class="modal-body">
                                <form action="<?php echo CONTROLLER; ?>" method="post" enctype="multipart/form-data">
                                  <div class="form-group">
                                    <label class="control-label col-sm-3" >Ingredient Name</label>
                                      <div class="col-sm-4">
                                        <input type="text" id="ing_name" name="ing_name" class="form-control" required placeholder="Ingredient Name">
                                      </div>
                                  </div><br><br><br>
                                  <div class="form-group">
                                    <label class="control-label col-sm-3" >Select Category</label>
                                      <div class="col-sm-4">
                                         <select id = "category" name="category" onchange="fetchIngByCat()">
                                         </select>
                                      </div>
                                  </div><br><br>
                                  <div class="form-group">
                                    <label class="control-label col-sm-3">Available Ingredients</label>
                                      <div class="col-sm-4">
                                         <select id = "availableingredientsunderselectedcategory" name="availableingredientsunderselectedcategory">
                                         </select>
                                      </div>
                                  </div><br><br>
                                  <div class="form-group">
                                    <input type="hidden" name="function_key" id="function_key" value="SAVE_INGREDIENT">
                                    <label class="control-label col-sm-3">Ingredient Image</label>
                                      <div class="col-sm-4">
                                         <input type="file" name="photo" id="fileSelect">
                                      </div>
                                  </div><br><br>

                                  <div style="width: 90%;">
                                    <table id="myTable" class=" table order-list">
                                    <thead>
                                        <tr>
                                            <td>NUTRITION CATEGORY</td>
                                            <td>NUTRITION</td>
                                            <td>UNIT OF MEASUREMENT</td>
                                            <td>NUTRITION VALUE</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="5" style="text-align: left;">
                                                <input type="button" class="btn btn-lg btn-block" onclick="addRow('AFTERLOAD');" id="addrow" value="Add Row" />
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </tfoot>
                                </table>
                                </div>  
                             <div class="col-sm-3">
                                <input class="btn btn-success btn-sm" id="btn-chat" type='submit' value='Save Ingredient'>
                              </div><br><br>
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