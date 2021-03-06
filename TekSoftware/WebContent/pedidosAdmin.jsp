<%@page import="entidades.MyResult.results"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.*" %>    
<%@ page import = "datos.*" %>
<%@ page import = "logica.PedidoController" %>   
<%@ page import = "java.util.ArrayList" %>   
<!DOCTYPE html>
<html dir="ltr" lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Pedidos</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link href="dist/css/style.extras.css" rel="stylesheet">
   
</head>

<body>
    
	<%@ include file = "/security/isNotLoggedIn.jsp" %>
    <%@ include file = "/security/isNotAdmin.jsp" %>
	
	<%			 
		
	   PedidoController pController = new PedidoController();
	   ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
	   
	   if (request.getAttribute("pedidosDelCliente") != null){
		   //entonces quiere ver los pedidos de un cliente particular
		    pedidos = (ArrayList<Pedido>)request.getAttribute("pedidosDelCliente");
	   } else{
		   if (request.getAttribute("pedidosPendientes") != null){
			   // entonces quiere ver solo los pendientes
			   pedidos = (ArrayList<Pedido>)request.getAttribute("pedidosPendientes");
		   } else{
		   // entonces quiere ver todos
		   pedidos = pController.getAllPedidos();
	   	}
	   }
	
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
                                <div class="d-flex align-items-center">
                                    <i class="mdi mdi-magnify font-20 mr-1"></i>
                                    <div class="ml-1 d-none d-sm-block">
                                        <span>Search by Cliente</span>
                                    </div>
                                </div>
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
                        <h4 class="page-title">Lista de Pedidos</h4>
                    </div>
                </div>
                <br>
                <form action="PedidoServlet" METHOD="POST">
                <button class="btn btn-warning">Ver solo los Pendientes</button>
                <input hidden="true" name="see" value="pendientes">
            	</form>

				<%
					// recuperamos si hubo un error o si se actualizo correctamente
					if (request.getAttribute("result") != null) {
						MyResult res = (MyResult) request.getAttribute("result");
						if (res.getResult().equals(results.OK)) {
				%>
				<p style="color: green;"><%=res.getErr_message()%></p>
				<%
					} else {
				%>
				<p style="color: red;"><%=res.getErr_message()%></p>
				<%
					}
				}
				%>
			</div>
           
            <div class="container-fluid">
                            <div class="table-responsive">
                               
<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Cliente</th>
					<th scope="col">Fecha Pedido</th>
					<th scope="col">Estado</th>
					<th scope="col">Monto</th>
					<th scope="col">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<% //SI NO HAY NINGUN PEDIDO MOSTRAMOS CARTEL "No hay Resultados"
				   if (pedidos.isEmpty()){ %> <p> No hay resultados </p>
	                <% } 
						// y sino mostramos todos los pedidos
					   else { 
	                	  for (Pedido p : pedidos) {
	                  %>
	                  
					<tr>
						<td scope="row"><%=p.getIdPedido() %></td>
						<td><%=p.getCliente().getFullName() %></td>
						
						<% String fecha;
							if (p.getFechaPedido() == null){
						  %>
						<td> <%=("No especificado")%></td>
						<%} else {%>  
						<td> <%=p.getFechaPedido().toString().substring(0, 10)%></td>
						<%} %>
						
						<%
											if (p.getEstado().equals("Pendiente")) {
										%>
										<td><span class="label label-info label-rounded"
											style="color: #7a7c80;">Pendiente</span></td>
										<%
											} else  
												if (p.getEstado().equals("Aprobado")){
										%>
										<td><span class="label label-success label-rounded"
											style="color: #000">Aprobado</span></td>
										<%
											} else
												if (p.getEstado().equals("Rechazado")){
										%>
										<td><span class="label label-danger label-rounded"
											style="color: #000">Rechazado</span></td>
										<%
											}
										%>
						
						<td>$<%=p.getMontoTotal() %></td>
						<td>
		               <a class="editbutton" href="PedidoServlet?idPedido=<%=p.getIdPedido()%>"> Ver </a>                                    
	                    </td>
					</tr>
					<% }
					}	
					%> 
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
