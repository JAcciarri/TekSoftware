<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="logica.PedidoController"%>
<%@ page import="entidades.Pedido"%>    
<%@ page import="entidades.Usuario"%>   
<%@ page import="entidades.Seleccion"%> 
<%@ page import="java.util.ArrayList"%> 
    <%@ page import = "logica.ChatController" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >

<title>Editar Pedido</title>
</head>
<body>

	<%  PedidoController pc = new PedidoController();
		ChatController chat = new ChatController();
		Pedido p = (Pedido)request.getAttribute("pedido");
		ArrayList<Seleccion> selecciones = pc.getSeleccionesByIDPedido(p.getIdPedido());
	%>
	
	<%@ include file = "/partials/navBar.jsp" %>

	<div class="slider-item overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_2.jpg');">

		<br> <br> <br>
		<div class="container-fluid" style="padding: 0">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h6 class="card-title">
								Aquí esta tu pedido,
								<%=user.capitalizeAnything(user.getUsername()) %></h6>
						</div>


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
										<% if (!p.getEstado().equals("Pendiente")){ %>
											<a href="ContactoServlet?idPedido=<%=p.getIdPedido()%>" class="editbutton"> Contactar</a>
										<%} %>
											</td>
										</tr>
								</tbody>
							</table>
						</div>


						<% if (p.getEstado().equals("Rechazado")){%>
						<div class="col-12">
							<h6>Motivo de rechazo:</h6>
							<p><%=p.getMotivoRechazo() %></p>
						</div>
						<%} %>

						<div class="table-responsive">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">Titulo</th>
										<th scope="col">Opcion elegida</th>
										<th scope="col">Descripcion</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Seleccion s : selecciones) {
									%>
									<tr>
										<td scope="row"><%=s.getCaracteristica().getTitulo()%></td>
										<td><%=s.getOpcion().getSubtitulo()%></td>
										<td><%=s.getOpcion().getDescripcion()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
							<br>
							<div class="col-12">
								<div style="text-align: center;">
									<a class="editbutton" href="perfilUsuario.jsp">Volver</a>
									<% if (!p.getEstado().equals("Aprobado")){%>
									<a class="deletebutton"
										href="DeletePedidoServlet?id=<%=p.getIdPedido()%>">
										Eliminar pedido</a>
									<%
										}
									%>
									<br> <br>
								</div>
							</div>

						</div>

					</div>
				</div>

			</div>
		</div>
		<%@ include file="/partials/footer.jsp"%>
	</div>

</body>
</html>