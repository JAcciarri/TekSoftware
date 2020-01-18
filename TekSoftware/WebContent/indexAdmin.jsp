<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "entidades.Usuario" %>
    <%@ page import = "datos.DataUsuario" %>
     <%@ page import = "java.util.ArrayList" %>
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
    <title>Admin Panel</title>
    <!-- Custom CSS -->
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
   
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
                        <a  class="logo">
                            <b class="logo-icon">
                                <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo">
                                <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo"> 
                            </b>
                            <span class="logo-text">
                                <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo">
                                <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage"> 
                            </span>
                        </a>
                    </div>
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="ti-more"></i>
                    </a>
                </div>
            </nav>
        </header>
        
      <!-- ============================================================== -->
      <!-- PANEL BY JOSHUA AND PATRICIO -->
      <!-- ============================================================== -->
       <%@ include file = "/partials/panelAdmin.jsp"  %>
        
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                    <% Usuario u = (Usuario)session.getAttribute("usuario"); %>
                        <h4 class="page-title">Bienvenido, <%=u.getNombre()%></h4>
                    </div>
                   
                </div>
            </div>
            <div class="container-fluid">
               
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Nuestros Administradores</h4>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">ADMIN</th>
                                            <th class="border-top-0">EMAIL</th>
                                            <th class="border-top-0">TELEFONO</th>
                                            <th class="border-top-0">Fecha de inicio (Prox.)</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                     <% DataUsuario du = new DataUsuario(); 
                                     	ArrayList<Usuario> admins = du.getAllAdmins(); 
                                     	for(Usuario adm : admins) {
                                     		String telefono;
                                     		if(adm.getTelefono() == null)
                                     		 {telefono = ("No especificado");}
                                     		else {telefono = adm.getTelefono();}
                                     %>
                                    	 <tr>
                                            <td class="txt-oflo"><%=adm.getApellido()+" "+adm.getNombre()%></td>
                                            <td><%=adm.getEmail()%></td>
                                            <td class="txt-oflo"><%=telefono%></td>
                                            <td><span class="font-medium"></span></td>
                                        </tr>
                                        
                                     <% } %>
                                    </tbody>
                                        <!--     ESTO LO PODEMOS USAR PARA LOS ESTADOS
                                        	<td><span class="label label-success label-rounded">ACTIVO</span> </td>
                                          
                                            <td><span class="label label-info label-rounded">SUSPENDIDO</span></td>
                                      
                                            <td><span class="label label-danger label-rounded">DESPEDIDO</span> </td>
                                           -->
                                 
                                </table>
                            </div>
                        </div>
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
    <script src="assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="dist/js/pages/dashboards/dashboard1.js"></script>
</body>

</html>