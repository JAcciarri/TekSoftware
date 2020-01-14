<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "entidades.*" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Nice admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
     <link href="dist/css/style.extras.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    
  
     
     
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <a href="index.html" class="logo">
                            <!-- Logo icon -->
                            <b class="logo-icon">
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item search-box">
                            <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                              
                            </a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter">
                                <a class="srh-btn">
                                    <i class="ti-close"></i>
                                </a>
                            </form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                      
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        	
        	
        	
        	<%@ include file = "panelAdmin.jsp" %>
        	
        	
        	
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
           
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                   
                    
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body">
                              
                              
                                <form action="AddCaracteristicaServlet" METHOD="POST" class="form-horizontal form-material">
                                   
                                     <div class="form-group">
                                        <label class="col-md-12">Titulo</label>
                                        <div class="col-md-12">
                                            <input type="text" name="titulo" autocomplete="off" required="" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">ID Opcion 1</label>
                                        <div class="col-md-12">
                                            <input type="text" name="idopcion1" readonly value="1" autocomplete="off" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Subtitulo</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="subtitulo-1" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                    				<div class="form-group">
				                                        <label class="col-md-12">Icono</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="icono-1" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Descripcion</label>
				                                        <div class="col-md-12">
				                                            <input style="line-height: 5;" type="text" name="descripcion-1" autocomplete="off" required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                                    
				                      <br>              
				                                 
				                      <div class="form-group">
                                        <label for="example-email" class="col-md-12">ID Opcion 2</label>
                                        <div class="col-md-12">
                                            <input type="text" name="idopcion2" readonly value="2" autocomplete="off" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Subtitulo</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="subtitulo-2" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                    				<div class="form-group">
				                                        <label class="col-md-12">Icono</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="icono-2" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Descripcion</label>
				                                        <div class="col-md-12">
				                                            <input style="line-height: 5;" type="text" name="descripcion-2" autocomplete="off" required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                   
				                   <br><br>                                 
                                   <div class="form-group">
                                        <label for="example-email" class="col-md-12">ID Opcion 3</label>
                                        <div class="col-md-12">
                                            <input type="text" name="idopcion3" readonly value="3" autocomplete="off" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Subtitulo</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="subtitulo-3" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                    				<div class="form-group">
				                                        <label class="col-md-12">Icono</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="icono-3" autocomplete="off"  required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Descripcion</label>
				                                        <div class="col-md-12">
				                                            <input style="line-height: 5;" type="text" name="descripcion-3" autocomplete="off" required="" class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                   
                                   
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                        
                                            <button class="addbutton" >Crear Caracteristica</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Nice admin. Designed and Developed by
                <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
</body>

</html>