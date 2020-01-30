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
    <title>Agregar Caracteristica</title>
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
   
   <%@ include file = "/security/isNotLoggedIn.jsp" %>
    <%@ include file = "/security/isNotAdmin.jsp" %>
    
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                    <div class="navbar-brand">
                        <a href="indexAdmin.jsp" class="logo">
                            <!-- Logo icon -->
                            <b class="logo-icon">
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
                    
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <ul class="navbar-nav float-left mr-auto">
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
                    <ul class="navbar-nav float-right">
                    </ul>
                </div>
            </nav>
        </header>
        	
        	<%@ include file = "/partials/panelAdmin.jsp" %>
        	
        	
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body" style=background:#e4e8f0;>
                              
                              
                                <form action="AddCaracteristicaServlet" METHOD="POST" class="form-horizontal form-material">
                                     <div class="form-group">
                                        <label class="col-md-12">Titulo</label>
                                        <div class="col-md-12">
                                            <input type="text" name="titulo" autocomplete="off" required="" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
                                   <div class="simple-container">
                                   
                                    <div class="form-group">
                                        <label class="col-md-12">ID Opcion 1</label>
                                        <div class="col-md-12">
                                            <input type="text" name="idopcion1" readonly value="1" autocomplete="off" class="form-control form-control-line" name="example-email" id="example-email">
                                        </div>
                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Subtitulo</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="subtitulo-1" autocomplete="off"  required class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                    				<div class="form-group">
				                                        <label class="col-md-12">Icono</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="icono-1" autocomplete="off"  required placeholder="Ejemplo: fa-twitter" class="form-control form-control-line">
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-md-12">Descripcion</label>
				                                        <div class="col-md-12">
				                                            <input style="line-height: 5;" type="text" name="descripcion-1" autocomplete="off" required class="form-control form-control-line">
				                                        </div>
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
				                                            <input type="text" name="icono-2" autocomplete="off"  required placeholder="Ejemplo: fa-folder" class="form-control form-control-line">
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
				                                            <input type="text" name="subtitulo-3" autocomplete="off"  required  class="form-control form-control-line">
				                                        </div>
				                                    </div>
                                    				<div class="form-group">
				                                        <label class="col-md-12">Icono</label>
				                                        <div class="col-md-12">
				                                            <input type="text" name="icono-3" autocomplete="off"  required placeholder="Ejemplo: fa-globe" class="form-control form-control-line">
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
                                        	<!--  Este boton redirige a AddCaracteristicaServlet por formulario -->
                                            <button class="addbutton" >Crear Caracteristica</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            </div>
		
        </div>
    </div>
    
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="dist/js/waves.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
    <script src="dist/js/custom.min.js"></script>
</body>

</html>