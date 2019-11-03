<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="datos.DataPedido"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidades.Pedido"%>
<!DOCTYPE html>
<html>
<head>
<link href="dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/style.extras.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Pedidos de Software</title>
</head>
<body>
	Aqui estan los pedidos:

	<% DataPedido dp = new DataPedido();
	ArrayList<Pedido> pedidos = dp.getAllPedidos();
		
%>

	<div class="table-responsive">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Cliente</th>
					<th scope="col">Fecha Pedido</th>
					<th scope="col">Estado</th>
					<th scope="col">Monto</th>
				</tr>
			</thead>
			<tbody>
				<% 
                
                   
                    for (Pedido p : pedidos) {%>
				<tr>
					<td scope="row"><%=p.getIdPedido() %></td>
					<td><%=p.getCliente().getFullName() %></td>
					<td><%=p.getFechaPedido() %></td>
					<td><%=p.getEstado()%></td>
					<td><%=p.getMontoTotal() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>

</body>
</html>