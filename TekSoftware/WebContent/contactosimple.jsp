<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.Pedido" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contacto</title>
</head>
<body>

<%
	Pedido p = (Pedido)request.getAttribute("pedido");
%>

<p> Pedido del cliente: <%=p.getCliente().getFullName()%>

<form action="ContactoServlet" method="POST">
	<input style="line-height: 10; width:40%" type="text" name="mensaje" autocomplete="off" required placeholder="Deja tu mensaje aqui">
	<input hidden="true"name="idCliente"  value="<%=p.getCliente().getIdUsuario()%>" >
	<input hidden="true" name="idAdmin" value="<%=p.getAdmin().getIdUsuario()%>" >
	<input hidden="true" name="idPedido" value="<%=p.getIdPedido()%>" >
	<input type="submit" value="Enviar">
	
</form>



</body>
</html>