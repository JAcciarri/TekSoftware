<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="logica.PedidoController"%>
<%@ page import="entidades.Pedido"%>    
<%@ page import="entidades.Usuario"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">
<title>Editar Pedido</title>
</head>
<body>
	<%  
		
		Pedido p = (Pedido)request.getAttribute("pedido");
		
	%>
	
	<h4> Este es el pedido del cliente <%=p.getCliente().getFullName()%></h4>
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
						<td scope="row"><%=p.getIdPedido() %></td>
						<td><%=p.getCliente().getFullName() %></td>
						
						<% String fecha;
							if (p.getFechaPedido() == null){
						  %>
						<td> <%=("No especificado")%></td>
						<%} else {%>  
						<td> <%=p.getFechaPedido()%></td>
						<%} %>
						
						<% if (p.getEstado().equals("Pendiente")){ %>
						<td><span class="label label-info label-rounded" style=color:#7a7c80;>Pendiente</span></td>
						<% } else {%>
						<td><span class="label label-success label-rounded" style=color:#000>Aprobado</span></td>
						<%} %>
						
						<td><%=p.getMontoTotal() %></td>
						
				</tbody>
		</table>
		
		<a class="addbutton" href="indexAdmin.jsp">Volver</a>
		
</body>
</html>