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

<title>Editar Pedido</title>
</head>
<body>


	<%  
		PedidoController pc = new PedidoController();
		Pedido p = (Pedido)request.getAttribute("pedido");
		ArrayList<Seleccion> selecciones = pc.getSeleccionesByIDPedido(p.getIdPedido());
	%>



	<div class="slider-item overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_2.jpg');">

		<br> <br> <br>
		<div class="container-fluid" style="padding: 0">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h6 class="card-title">
								Este es el pedido de <strong><%=p.getCliente().getFullName()%></strong>
							</h6>
							<h6 class="card-title">Puedes aprobarlo, rechazarlo o simplemente verlo</h6>
							
						</div>

						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">Cliente</th>
										<th scope="col">Fecha de pedido</th>
										<th scope="col">Fecha aprobación/rechazo</th>
										<th scope="col">Estado</th>
										<th scope="col">Monto total</th>
										<th scope="col">Revisado por</th>
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
					<!-- Acciones -->		
										</tr>
								</tbody>
						</table>

						<% if (p.getEstado().equals("Rechazado")){ %>
						<div class="col-12 center">
							<h6>Motivo del rechazo:</h6>
							<p><%=p.getMotivoRechazo()%></p>
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
							<div></div>


							<%
								if (p.getEstado().equals("Pendiente")) {
							%>
							<form action="DeletePedidoServlet" METHOD="POST">
								<div class="form-group">
									<label class="col-md-12">¿Deseas rechazar este pedido?</label>
									<div class="col-md-12">
										<input style="line-height: 10;" type="text"
											name="motivoRechazo" autocomplete="off" required
											placeholder="Motivo de rechazo"
											class="form-control form-control-line"> <input
											hidden="true" name="idRechazado" value="<%=p.getIdPedido()%>">
									</div>
								</div>
								<%
									}
								%>
								<div class="form-group" style="text-align: center;">
									<a class="editbutton" href="pedidosAdmin.jsp">Volver</a>
									<%
										if (p.getEstado().equals("Pendiente")) {
									%>

									<button class="deletebutton">Rechazar Pedido</button>
									<a class="addbutton"
										href="EditPedidoServlet?idPedido=<%=p.getIdPedido()%>">
										Aprobar Pedido</a>
									<%
										}
									%>
								</div>
								<br>
							</form>


						</div>
					</div>
				</div>
			</div>
			<%@ include file="/partials/footer.jsp"%>
		</div>

	</div>



</body>
</html>