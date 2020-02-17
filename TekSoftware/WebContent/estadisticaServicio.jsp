<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.*" %>    
<%@ page import = "datos.*" %>
<%@ page import = "logica.PedidoController" %>   
<%@ page import = "java.util.ArrayList" %>   
<%@ page import = "java.util.HashMap" %>   
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
    <title>Estadisticas</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link href="dist/css/style.extras.css" rel="stylesheet">
   
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
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin5">
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<div class="navbar-brand">
						<a href="indexAdmin.jsp" class="logo"> <b class="logo-icon">
								<img src="assets/images/logo-icon.png" alt="homepage"
								class="dark-logo" /> <img
								src="assets/images/logo-light-icon.png" alt="homepage"
								class="light-logo" />
						</b> <span class="logo-text"> <img
								src="assets/images/logo-text.png" alt="homepage"
								class="dark-logo" /> <img
								src="assets/images/logo-light-text.png" class="light-logo"
								alt="homepage" />
						</span>
						</a>
					</div>
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"> <i class="ti-more"></i>
					</a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin6"></div>
			</nav>
		</header>


		<%@ include file="/partials/panelAdmin.jsp"%>





		<%			 
		String servicio = (String)request.getAttribute("servicio");
		
		switch(servicio){
		
		case "pedidos":{
			ArrayList<Pedido> pedidos = (ArrayList<Pedido>)request.getAttribute("pedidos");
			double[] numeros = (double[])request.getAttribute("numeros");
			%>

		<div class="page-wrapper">

			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">Estadisticas de pedidos</h4>

					</div>

				</div>
			</div>

			<div class="container-fluid">
				<div class="table-responsive">
				
				<div>
				<hr>
					<h4>El mayor monto de un pedido fue de $<%=request.getAttribute("maxMonto")%></h4>
					<h5>¡Nada mal!</h5>
				<hr>
				</div>
				<div>
					 <h4>Dias de demora en aprobar un pedido</h4>
				</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Fecha Pedido</th>
								<th scope="col">Fecha Aprobacion</th>
								<th scope="col">Demora</th>
							</tr>
						</thead>
						<tbody>
							<% for (Pedido p : pedidos){
							%>
							<tr>
								<td><%=p.getIdPedido()%></td>
								<td><%=p.getFechaPedido()%></td>
								<td><%=p.getFechaAprobacion()%></td>
								<% int dias = p.getDiferenciaDias(); 
								if (dias==0){%>
								   <td>En el día</td>
								<% } else{%>
								<td><%=dias%> días</td>
								<%}%>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive">
				<div>
					 <hr>
					 <h4>Promedio de dias de demora en aprobar un pedido</h4>
				</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">Total de dias</th>
								<th scope="col">Promedio</th>
								<th scope="col">Observacion</th>
							</tr>
							<tr>
								<td><%=(int)numeros[0]%></td>
								<td><%=numeros[1]%></td>
								<td>¡¡Felicitaciones!!</td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

				</div>
				
				
			</div>
		</div>
	</div>

	<%
	break;	}  // fin del case pedidos

		case "clientes":{ 

			 Usuario clientePedidor = (Usuario)request.getAttribute("clientePedidor");
			 Usuario ultCliente = (Usuario)request.getAttribute("ultimoCliente");
			 HashMap<String, Integer> map = (HashMap<String,Integer>)request.getAttribute("map");
			 
			%>
		
			<div class="page-wrapper">

			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">Estadisticas de clientes</h4>

					</div>

				</div>
			</div>

			<div class="container-fluid">
				<div class="table-responsive">
					<div>
					    <hr>
						<h4>Nuestro mejor cliente</h4>
					</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Cliente</th>
								<th scope="col">Usuario</th>
								<th scope="col">Pedidos hechos</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=clientePedidor.getIdUsuario()%></td>
								<td><%=clientePedidor.getFullName()%></td>
								<td><%=clientePedidor.getUsername()%></td>
								<td><%=clientePedidor.getPedidosHechos()%></td>
								
							</tr>
							
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive">
					<div>
					    <hr>
						<h4>Nuestros usuarios</h4>
					</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">Cantidad total de usuarios</th>
								<th scope="col">Administradores</th>
								<th scope="col">Clientes</th>
							</tr>
							<tr>
								<td><%=map.get("total")%></td>
								<td><%=map.get("admins")%></td>
								<td><%=map.get("users")%></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				
				<div class="table-responsive">
					<div>
					    <hr>
						<h4>Ultimo usuario registrado</h4>
					</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">Nombre y apellido</th>
								<th scope="col">Email</th>
								<th scope="col">Telefono</th>
								<th scope="col">Username</th>
							</tr>
							<tr>
								<td><%=ultCliente.getFullName()%></td>
								<td><%=ultCliente.getEmail()%></td>
								<td><%=ultCliente.getTelefono()%></td>
								<td><%=ultCliente.getUsername()%></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
		</div>
			
	<%		
	break; }	// fin del case clientes
		
		
		case "caracteristicas":{
		
			ArrayList<Opcion> opciones = (ArrayList<Opcion>)request.getAttribute("opciones");
			
			%>

		<div class="page-wrapper">

			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title">Estadisticas de caracteristicas</h4>

					</div>

				</div>
			</div>

			<div class="container-fluid">
				<div class="table-responsive">
				
				<div>
				<hr>
					<h4>Ranking de nuestras caracteristicas</h4>
					<h5>Las opciones mas elegidas</h5>
				<hr>
				</div>
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">Caracteristica</th>
								<th scope="col">Opcion mas elegida</th>
								<th scope="col">Descripcion</th>
								<th scope="col">Veces elegida</th>
							</tr>
						</thead>
						<tbody>
							<% for (Opcion op : opciones){
								%>
								<tr>
									<td><%=op.getCaractPerteneciente().getTitulo()%></td>
									<td><%=op.getSubtitulo()%></td>
									<td><%=op.getDescripcion()%></td>
								    <td><%=op.getVecesElegida()%></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
				
				
			</div>
		</div>
	
	<% 		
	break; }// fin del case caracteristicas
		
		} // fin del switch
	%>


		
	
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
