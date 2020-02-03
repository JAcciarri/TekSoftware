<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.Mensaje" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mensajes </title>

<link href="dist/css/style.min.css" rel="stylesheet">
    <link href="dist/css/style.extras.css" rel="stylesheet">
</head>
<body>

	<%@ include file = "/security/isNotLoggedIn.jsp" %>
    <%@ include file = "/security/isNotAdmin.jsp" %>
	
	<%			 

	   ArrayList<Mensaje> mensajes = (ArrayList<Mensaje>)request.getAttribute("mensajes");
	   
	%>
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
                        <a href="indexAdmin.jsp" class="logo">
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
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="ti-more"></i>
                    </a>
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
                            <form class="app-search position-absolute" action="PedidoServlet" method="POST">
                                <input type="text" name="datosParciales" class="form-control" placeholder="Ingrese cliente">
                                <a class="srh-btn">
                                    <i class="ti-close"></i>
                                </a>
                            </form>
                        </li>
                    </ul>
                  
                </div>
            </nav>
        </header>
      
    
    	<%@ include file = "/partials/panelAdmin.jsp" %>
    
    
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">Mensajes</h4>
                        
                    </div>
                   
                </div>
            </div>
           
            <div class="container-fluid">
                            <div class="table-responsive">
                               
<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">ID Pedido</th>
					<th scope="col">Cliente</th>
					<th scope="col">Mensaje</th>
					<th scope="col">Fecha y Hora</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<% //SI NO HAY NINGUN PEDIDO MOSTRAMOS CARTEL "No hay Resultados"
				   if (mensajes.isEmpty()){ %> <p> No tienes mensajes </p>
	                <% } 
						// y sino mostramos todos los pedidos
					   else { 
	                	  for (Mensaje m : mensajes) {
	                  %>
	                  
					<tr>
						<td scope="row"><%=m.getPedido().getIdPedido()%></td>
						<td><%=m.getCliente().getFullName() %></td>
						
						<td> <%=m.getMensaje()%> </td>
						<td> <%=m.getFecha_hora()%></td>
						<td>
		               <a class="editbutton" href="#"> Contestar</a>                                    
	                    </td>
	                    <% } 
	                    }%>
					</tr>
					 
				</tbody>
		</table>
                            
                            </div>
                        </div>
                    </div>
            </div>
            <footer style="background: #f2f4f5;" class="footer text-center">
                Todos los derechos reservados por <a href="index.jsp"> TekSoftware</a>.
            </footer>
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