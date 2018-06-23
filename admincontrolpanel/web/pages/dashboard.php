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
    <body class="skin-blue" onload="setUpMainDashboard()">
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
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-4 col-xs-8">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3 id="recipecount">
                                    </h3>
                                    <p>
                                        Active Recipes
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-4 col-xs-8">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3 id="liveusers">
                                    </h3>
                                    <p>
                                        Version 1 Users
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-4 col-xs-8">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3 id="registercount">
                                    </h3>
                                    <p>
                                        User Registrations
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="#" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div><!-- ./col -->
                  <div class="row">
                  
                  <div class="col-md-4">
                    <!-- Widget: user widget style 1 -->
                    <div class="box box-widget widget-user-2">
                      <!-- Add the bg color to the header using any of the bg-* classes -->
                      <div class="widget-user-header bg-yellow">
                         <div class="icon">
                              <i class="ion ion-stats-bars"></i>
                         </div>
                        <!-- /.widget-user-image -->
                        <h3 class="widget-user-username">Internet Protocol Address</h3>
                        <h5 class="widget-user-desc">Requesting IPs</h5>
                      </div>
                      <div class="box-footer no-padding">
                        <ul class="nav nav-stacked">
                          <li><a href="#">Highest<span class="pull-right badge bg-blue" id="ipaddhighest"></span><span class="pull-right badge bg-blue" id="ipaddhighestcount"></span></a></li>
                          <li><a href="#">Second highest<span class="pull-right badge bg-aqua" id="ipaddsecondhighest"></span><span class="pull-right badge bg-aqua" id="ipaddsecondhighestcount"></span></a></li>
                          <li><a href="#">Third highest<span class="pull-right badge bg-green" id="ipaddthirdhighest"></span><span class="pull-right badge bg-green" id="ipaddthirdhighestcount"></span></a></li>
                          <li><a href="#">Total<span class="pull-right badge bg-red" id="ipaddtotalcount"></span></a></li>
                        </ul>
                      </div>
                    </div>
                    <!-- /.widget-user -->
                  </div>
                    
                    <div class="col-md-4">
                    <!-- Widget: user widget style 1 -->
                    <div class="box box-widget widget-user-2">
                      <!-- Add the bg color to the header using any of the bg-* classes -->
                      <div class="widget-user-header bg-aqua">
                        <div class="icon">
                              <i class="ion ion-location"></i>
                         </div>
                        <!-- /.widget-user-image -->
                        <h3 class="widget-user-username">Country</h3>
                        <h5 class="widget-user-desc">Requesting countries</h5>
                      </div>
                      <div class="box-footer no-padding">
                        <ul class="nav nav-stacked">
                          <li><a href="#">Highest<span class="pull-right badge bg-blue" id="areahighest"></span><span class="pull-right badge bg-blue" id="areahighestcount"></span></a></li>
                          <li><a href="#">Second highest<span class="pull-right badge bg-aqua" id="areasecondhighest"></span><span class="pull-right badge bg-aqua" id="areasecondhighestcount"></span></a></li>
                          <li><a href="#">Third highest<span class="pull-right badge bg-green" id="areathirdhighest"></span><span class="pull-right badge bg-green" id="areathirdhighestcount"></span></a></li>
                          <li><a href="#">Total<span class="pull-right badge bg-red" id="areatotalcount"></span></a></li>
                        </ul>
                      </div>
                    </div>
                    <!-- /.widget-user -->
                  </div>
                    
                    <div class="col-md-4">
                    <!-- Widget: user widget style 1 -->
                    <div class="box box-widget widget-user-2">
                      <!-- Add the bg color to the header using any of the bg-* classes -->
                      <div class="widget-user-header bg-aqua">
                        <div class="icon">
                              <i class="ion ion-ios7-recording"></i>
                         </div>
                        <!-- /.widget-user-image -->
                        <h3 class="widget-user-username">City</h3>
                        <h5 class="widget-user-desc">Requesting cities</h5>
                      </div>
                      <div class="box-footer no-padding">
                        <ul class="nav nav-stacked">
                          <li><a href="#">Highest<span class="pull-right badge bg-blue" id="cityhighest"></span><span class="pull-right badge bg-blue" id="cityhighestcount"></span></a></li>
                          <li><a href="#">Second highest <span class="pull-right badge bg-blue" id="citysecondhighest"></span><span class="pull-right badge bg-aqua" id="citysecondhighestcount"></span></a></li>
                          <li><a href="#">Third highest <span class="pull-right badge bg-blue" id="citythirdhighest"></span><span class="pull-right badge bg-green" id="citythirdhighestcount"></span></a></li>
                          <li><a href="#">Total<span class="pull-right badge bg-red" id="citytotalcount"></span></a></li>
                        </ul>
                      </div>
                    </div>
                    <!-- /.widget-user -->
                  </div>
                 
         
                     <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                          <div class="inner">
                            <h3 id="useronedaycount"></h3>
                            <p>Users in Last 24 hours</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                          </div>
                          <a href="#" class="small-box-footer">
                            More info <i class="fa fa-arrow-circle-right"></i>
                          </a>
                        </div>
                      </div>
                                       <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                          <div class="inner">
                            <h3 id="useroneweekcount"></h3>
                            <p>Users in Last 7 Days</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                          </div>
                          <a href="#" class="small-box-footer">
                            More info <i class="fa fa-arrow-circle-right"></i>
                          </a>
                        </div>
                      </div>
                    
                       <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                          <div class="inner">
                            <h3 id="useronemonthcount"></h3>

                            <p>Users in Last 30 Days</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                          </div>
                          <a href="#" class="small-box-footer">
                            More info <i class="fa fa-arrow-circle-right"></i>
                          </a>
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