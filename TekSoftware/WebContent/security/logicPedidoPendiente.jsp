<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "logica.PedidoController" %>
<%@ page import = "entidades.Usuario" %>
<%@ page import = "entidades.Pedido" %>

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
		if (request.getAttribute("pedidoJustCreated") == null) {
			PedidoController pCtrl = new PedidoController();
			Usuario user = (Usuario) request.getSession().getAttribute("usuario");
			Pedido ped = pCtrl.getPedidoPendienteByCliente(user.getIdUsuario());
			if (ped != null) {
				// ya tiene un pedido pendiente, redirigimos a su perfil
				request.getRequestDispatcher("perfilUsuario.jsp").forward(request, response);
			}
		}
	%>
</body>
</html>