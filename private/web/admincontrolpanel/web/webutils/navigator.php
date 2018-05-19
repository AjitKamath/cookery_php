  <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="<?php echo USER_IMAGE; ?>" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, <?php echo $_SESSION['username']  ?></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="dashboard.php">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-briefcase"></i>
                                <span>Ingredients</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="manageingredient.php"><i class="fa fa-angle-double-right"></i> Manage Ingredient</a></li>
                            </ul>
                        </li>
												<li class="treeview">
															<a href="#">
																	<i class="fa fa-cutlery"></i>
																	<span>Food Type</span>
																	<i class="fa fa-angle-left pull-right"></i>
															</a>
															<ul class="treeview-menu">
																	<li><a href="managefoodtype.php"><i class="fa fa-angle-double-right"></i> Manage Food Type</a></li>
															</ul>
													</li>
												<li class="treeview">
															<a href="#">
																	<i class="fa fa-globe"></i>
																	<span>Food Cuisine</span>
																	<i class="fa fa-angle-left pull-right"></i>
															</a>
															<ul class="treeview-menu">
																	<li><a href="managefoodcuisine.php"><i class="fa fa-angle-double-right"></i> Manage Food Cuisine</a></li>
															</ul>
													</li>
													<li class="treeview">
															<a href="#">
																	<i class="fa fa-users"></i>
																	<span>Users</span>
																	<i class="fa fa-angle-left pull-right"></i>
															</a>
															<ul class="treeview-menu">
																	<li><a href="manageuser.php"><i class="fa fa-angle-double-right"></i> Manage User</a></li>
															</ul>
													</li>
									</ul>
							</section>
					  </aside>