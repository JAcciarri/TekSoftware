<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.Mensaje"%>
<%@ page import="entidades.Pedido"%>
<%@ page import="entidades.MyResult"%>
<%@ page import="logica.ChatController"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta>
<title>Mensajes</title>

<link href="dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link href="css/chat.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >

</head>
<body>

	<%@ include file="/security/isNotLoggedIn.jsp"%>
	<%@ include file="/security/isNotAdmin.jsp"%>

	<%	
	   ArrayList<Mensaje> mensajes = null;
	   LinkedList<Pedido> ids = null;	
	   String titulo = null;
	   
	   if (request.getAttribute("mensajes") != null ){
		   mensajes = (ArrayList<Mensaje>)request.getAttribute("mensajes");
		   titulo = "Chat - " + mensajes.get(0).getPedido().getCliente().getFullName();
	   } else {
	    ids = (LinkedList<Pedido>)request.getAttribute("ids");
	    titulo = "Mensajes";
	   }
	%>
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
					data-navbarbg="skin6">
					<ul class="navbar-nav float-left mr-auto">
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)"> </a>
							<form class="app-search position-absolute" action="PedidoServlet"
								method="POST">
								<input type="text" name="datosParciales" class="form-control"
									placeholder="Ingrese cliente"> <a class="srh-btn">
									<i class="ti-close"></i>
								</a>
							</form></li>
					</ul>

				</div>
			</nav>
		</header>


		<%@ include file="/partials/panelAdmin.jsp"%>


		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="page-title"><%=titulo%></h4>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				
				<%
							if (request.getAttribute("result") != null) {
								MyResult res = (MyResult) request.getAttribute("result");
								if (res.getResult().equals(MyResult.results.OK)) {
						%>
						<p style="color: green"><%=res.getErr_message()%></p>
						<%
							} else {
						%>
						<p style="color: red"><%=res.getErr_message()%></p>
						<%
							}
						}
						%>
				
				<% if (ids != null) {
				%>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">ID Pedido</th>
								<th scope="col">Cliente</th>
								<th scope="col">Mensajes</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody>
							<% //SI NO HAY NINGUN PEDIDO MOSTRAMOS CARTEL "No hay Resultados"
				   if (ids.isEmpty()){ %>
							<p>No tienes mensajes</p>
							<% } 
							// y sino mostramos todos los pedidos
				   else { 
                	  for (Pedido p : ids) {
                		  ChatController chat = new ChatController();
                		  String msj;
                		  if (chat.hasMensajesNoLeidosByPedido(p)){
                			  msj = ("Hay mensajes nuevos");
                		  }
                		  else msj = ("No hay mensajes sin leer");
                		  
                  %>

						<tr>
							<td scope="row"><%=p.getIdPedido()%></td>
							<td scope="row"><%=p.getCliente().getFullName()%></td>
							<td scope="row"><%=msj%></td>
							<td><a class="editbutton"
								href="ContactoServlet?chat=<%=p.getIdPedido()%>">Ver Chat</a></td>
							<% } 
				   		}
                    %>
						</tr>

					</tbody>
				</table>

			</div>

				<%
					} else {
						//  CHAT SIMPLE  //	
						
						for (Mensaje msj : mensajes) {

							if (msj.getIsFromUser()) {
				%>
				<!--  Chat para user comun -->
				<div class="container">
					<img src="assets/images/users/userdefault.png" alt="Avatar">
					<p><%=msj.getMensaje()%></p>
					<span class="time-left"><%=msj.getFechaHoraString()%></span>
				</div>
				<%
					} else {
				%>
				<!--  Chat para admin -->
				<div class="container darker">
					<img src="assets/images/users/admin.png" alt="Avatar">
					<p><%=msj.getMensaje()%></p>
					<span class="time-left"><%=msj.getFechaHoraString()%></span>
				</div>

				<%
					}
						}
				%>	
				<form action="ContactoServlet" method="POST">
					<div class="panel-footer">
	                    <div class="input-group">
	                        <input name="mensajeAdmin" id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Deja tu mensaje aqui..." autocomplete="off" required />
	                        <span class="input-group-btn">
	                        <input hidden="true"name="idCliente"  value="<%=mensajes.get(0).getPedido().getCliente().getIdUsuario()%>" >
							<input hidden="true" name="idAdmin" value="<%=mensajes.get(0).getAdmin().getIdUsuario()%>" >
							<input hidden="true" name="idPedido" value="<%=mensajes.get(0).getPedido().getIdPedido()%>" >
	                        </span>
	                         <button class="btn btn-primary btn-sm" id="btn-chat">Enviar</button>
	                    </div>
	                </div>
                </form>  		
				<%
				}
				%>
			</div>
		</div>
	</div>
	<footer style="background: #f2f4f5;" class="footer text-center">
		Todos los derechos reservados por <a href="indexAdmin.jsp">
			TekSoftware</a>.
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
