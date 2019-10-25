<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "entidades.Usuario" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Mi Perfil</title>
<% Usuario u = (Usuario)session.getAttribute("usuario"); %>
</head>
<body>
	<% if (u != null) {%>
		<h2> Bienvenido a tu perfil asqueroso, <%=u.getNombre() %> </h2>
	<%} else 
		request.getRequestDispatcher("index.jsp").forward(request, response);%>
	
</body>
</html>