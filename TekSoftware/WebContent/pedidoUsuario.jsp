<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="logica.PedidoController"%>
<%@ page import="entidades.Pedido"%>    
<%@ page import="entidades.Usuario"%>   
<%@ page import="entidades.Seleccion"%> 
<%@ page import="java.util.ArrayList"%> 

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
								<%=user.getUsername() %></h6>
						</div>


						<div class="table-responsive">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th scope="col">ID Pedido</th>
										<th scope="col">Cliente</th>
										<th scope="col">Fecha Pedido</th>
										<th scope="col">Estado</th>
										<th scope="col">Monto</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row"><%=p.getIdPedido()%></td>
										<td><%=p.getCliente().getFullName()%></td>

										<%
											if (p.getFechaPedido() == null) {
										%>
										<td><%=("No especificado")%></td>
										<%
											} else {
										%>
										<td><%=p.getFechaPedido().toString().substring(0, 10)%></td>
										<%
											}
										%>

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

										<td><%=p.getMontoTotal()%></td>
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