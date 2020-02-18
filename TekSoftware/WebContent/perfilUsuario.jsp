	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "entidades.Usuario" %>
    <%@ page import = "entidades.MyResult" %>
    <%@ page import = "logica.PedidoController" %>
    <%@ page import = "logica.ChatController" %>
    <%@ page import = "logica.CaracteristicaController" %>
	<%@ page import = "java.util.ArrayList" %>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="perfil-usuario/assets/images/favicon.png">
    <title>Mi Perfil</title>
    <!-- Custom CSS -->
    <link href="perfil-usuario/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link
	href="https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="dist/css/style.extras.css">
<link rel="stylesheet" href="dist/css/style.min.css">

</head>

<body>

	   <%@ include file = "/security/isNotLoggedIn.jsp" %>
	   <%@ include file = "/security/isAdmin.jsp" %>
       <%@ include file="/partials/navBar.jsp" %>
      
      
      <% PedidoController pCtrl = new PedidoController();
         ChatController chat = new ChatController();
         int IDCliente = user.getIdUsuario();
         Pedido pedidoPendiente = pCtrl.getPedidoPendienteByCliente(IDCliente);
      	 ArrayList<Pedido> pedidos = pCtrl.getPedidosByCliente(IDCliente);
      	 String msg= null; String color = null;
      	 if (pedidoPendiente != null) {
      		 pedidos.add(pedidoPendiente);
      	 }
      	 if (request.getAttribute("result")!=null){
      		 MyResult res = (MyResult)request.getAttribute("result");
      		 msg = res.getErr_message();
      		 if (res.getResult().equals(MyResult.results.OK)){
      			  color = "green";
      		 } else  color = "red";
      	 }
      	 
      %>

	<div class="slider-item overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_2.jpg');">

		<div class="container-fluid">
			<div class="row">
				<!-- Column -->
				<div class="col-lg-4 col-xlg-3 col-md-5"></div>
				<div class="col-lg-4 col-xlg-3 col-md-5" style="margin-top: 7%;">
					<div class="card" style="background: #e4e8f0;">
						<div class="card-body">
							<h4 class="card-title m-t-10 text-center">¡Bienvenido de
								nuevo!</h4>
							<center class="m-t-30">
								<img src="assets/images/users/userdefault.png"
									class="rounded-circle" width="150" />
								<h4 class="card-title m-t-10"><%=user.capitalizeAnything(user.getUsername())%></h4>
								<% if (request.getAttribute("result")!=null){ %>
									<h6 style=color:<%=color%>> <%=msg%></h6>
								<% }
								%>
								
								<div class="row text-center justify-content-md-center"></div>
							</center>
						</div>
						<div>
							<hr>
						</div>
						<div class="card-body">
							<small class="text-muted"><center>
									<strong><%=user.getFullName()%></strong>
								</center> </small> <small class="text-muted"><center><%=user.getEmail()%></center>
							</small>
						</div>
					</div>
				</div>

				<div class="row">
					<%
						if (pedidoPendiente == null) {
					%>
					<div class="col-2"></div>
					<div class="col-8">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">¡Crea tu pedido!</h4>
								<h6>
									No tienes ningún pedido en estado <strong>Pendiente</strong>.
									Realiza uno nuevo dando click <strong> 
								<%
						 		CaracteristicaController carCtrl = new CaracteristicaController();
						 		session.setAttribute("caracteristicas", carCtrl.getAllCaracteristicas());
						 		session.setAttribute("numeroPaso", 1);
						 		session.setAttribute("selecciones", new ArrayList<Seleccion>());
						 		%> 
 								<a href="pedido.jsp">aquí</a>
									</strong> y nosotros nos encargaremos de revisarlo lo antes posible para
									comenzar a llevarlo a cabo.
								</h6>
							</div>
						</div>
					</div>

					<%
						} else {
					%>
					<div class="col-2"></div>
					<div class="col-8">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Máximos pedidos pendientes
									alcanzados</h4>
								<h6>
									Ya tienes un pedido en estado <strong>Pendiente</strong>.
									Puedes revisarlo justo aquí debajo, y en caso de querer hacer
									uno nuevo, primero debes cancelar el mismo.
								</h6>
							</div>
						</div>
					</div>
					<%
						//FIN DEL ELSE 
						}
					%>

					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Últimos pedidos</h4>
								<h6 class="card-subtitle">Aquí se encuentran los pedidos
									que has realizado con anterioridad.</h6>
							</div>
							
								
							<%
								if (pedidos.isEmpty()) {
							%>
							<p style="text-align: center;">No se encontraron pedidos
								aprobados o rechazados</p>
							<%
								} else {
							%>
							<div class="table-responsive">
								<table class="table">
									<thead class="thead-light">
										<tr>
											<th scope="col">Cliente</th>
											<th scope="col">Fecha de pedido</th>
											<th scope="col">Fecha aprobación/rechazo</th>
											<th scope="col">Estado</th>
											<th scope="col">Monto total</th>
											<th scope="col">Revisado por</th>
											<th scope="col">Acciones</th>
											
										</tr>
									</thead>
									<tbody>
									<% for (Pedido p : pedidos){ %>
										<tr>
					<!-- cliente -->		<th scope="row"><%=p.getCliente().getFullName()%></th>
					<!-- Fecha pedido -->	<td><%=p.getFechaPedido().toString().substring(0, 10)%></td>

					<!-- Estados -->		<% if (p.getEstado().equals("Aprobado")){ 
											%>
					<!-- y fechas -->		<td><%=p.getFechaAprobacion().toString().substring(0, 10)%></td>
											<td><span class="label label-success label-rounded" style="color: #000">Aprobado</span></td>
										
										<% } else if (p.getEstado().equals("Rechazado")){%>
											<td><%=p.getFechaCancelacion().toString().substring(0, 10)%></td>
											<td><span class="label label-danger label-rounded" style="color: #000">Rechazado</span></td>
										
										<%} else { %>
											<td><%=("Pendiente")%></td>
											<td><span class="label label-info label-rounded" style="color: #000">Pendiente</span></td>
										<%} %>
											
					<!-- Monto -->			<td>$<%=p.getMontoTotal() %></td>
											<% if (p.getAdmin()!=null){%>
				<!-- Admin que reviso -->		<td><%=p.getAdmin().getFullName() %></td>
											<%} else {%>
												<td><%=("Aún no revisado")%></td>
											<%} %>
					<!-- Acciones -->		<td>
											<a href="PedidoServlet?idPedido=<%=p.getIdPedido()%>" class="editbutton" > Ver</a>
										<% if (!p.getEstado().equals("Pendiente")){ %>
											<a href="ContactoServlet?idPedido=<%=p.getIdPedido()%>" class="editbutton">Chatear</a>
										<%} %>
											</td>
										</tr>
										<%} %>
									</tbody>
								</table>
								
							</div>
							<% } // FIN DEL ELSE%>

						</div>
					</div>
				</div>

			</div>
		</div>


		<%@include file="/partials/footer.jsp"%>

	</div>

	<script src="perfil-usuario/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="perfil-usuario/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="perfil-usuario/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="perfil-usuario/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="perfil-usuario/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="perfil-usuario/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="perfil-usuario/dist/js/custom.min.js"></script>
</body>

</html>
