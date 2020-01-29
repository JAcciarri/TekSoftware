<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    
<title></title>
</head>
<body>
  <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                
                
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                    
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="AbmUsuariosServlet" aria-expanded="false">
                               <i class="mdi mdi-account"></i>
                                <span class="hide-menu">ABM Usuarios</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="AbmCaracteristicasServlet" aria-expanded="false">
                          	<i class="mdi mdi-cards"></i>
                                <span class="hide-menu">ABM Caracteristicas</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pedidosAdmin.jsp" aria-expanded="false">
                               <i class="mdi mdi-cart"></i>
                                <span class="hide-menu">Pedidos</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="estadisticas.jsp" aria-expanded="false">
                               <i class="mdi mdi-chart-line"></i>
                                <span class="hide-menu">Estadisticas</span>
                            </a>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="LoginServlet" aria-expanded="false">
                               <i class="mdi mdi-close-circle"></i>
                                <span class="hide-menu">Cerrar Sesion</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
</body>
</html>