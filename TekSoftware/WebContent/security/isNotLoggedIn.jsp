<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  JSP diseñado para proteger las rutas
	Por ejemplo, un usuario loggeado no deberia poder ver la pagina 
	de registro o la pagina de login -->
					
		<% 
			Usuario userNotLoggedIn = (Usuario)request.getSession().getAttribute("usuario"); 
			if (userNotLoggedIn == null){
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		%>
</body>
</html>