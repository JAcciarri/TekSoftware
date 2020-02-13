<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.Mensaje"%>
<%@ page import="entidades.Pedido"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mensajes</title>

<link href="dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link href="css/chat.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" >

</head>
<body>

	<%@ include file="/security/isNotLoggedIn.jsp"%>
	<%@ include file="/security/isAdmin.jsp"%>

	<%	
	   ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>();
	   int idPedido, idAdmin, idCliente;
	
	   if (request.getAttribute("mensajes") != null){
		   // si hay muchos mensajes los recuperamos
		   mensajes = (ArrayList<Mensaje>)request.getAttribute("mensajes");
		   idPedido = mensajes.get(0).getPedido().getIdPedido();
		   idCliente = mensajes.get(0).getPedido().getCliente().getIdUsuario();
		   idAdmin = mensajes.get(0).getPedido().getAdmin().getIdUsuario();
	   } 
	   else {
		   // si nunca se habia dejado uno entonces mostramos el chat vacio
		   Mensaje men = (Mensaje)request.getAttribute("msj");
		   idPedido = men.getPedido().getIdPedido();
		   idCliente = men.getPedido().getCliente().getIdUsuario();
		   idAdmin = men.getPedido().getAdmin().getIdUsuario();
	   }
	   
	%>
	
	
	<%@ include file = "/partials/navBar.jsp" %>

	<div class="slider-item overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_2.jpg');">

		<br> <br> <br>
		<div class="container-fluid" style="padding: 0">
			<div class="row">
				<div class="col-12">
					<div class="card" style=padding:5px>
						<div class="card-body">
							<h6 class="card-title">
								<strong>Bienvenido al chat</strong>. Te responderemos a la brevedad
							</h6>
						</div>
						
						<% if (request.getAttribute("exito") != null) {%>
					<p style="color:green; margin-left:5px;"> <%=request.getAttribute("exito")%>
				<%} %>
				
				
				<%  if (mensajes.size() > 0) { %>
					<!-- //  CHAT SIMPLE  //  -->	
				<% for (Mensaje msj : mensajes) {

							if (msj.getIsFromUser()) {
				%>
				<!--  Chat para user comun -->
				<div class="container">
					<img src="assets/images/users/userdefault.png" alt="Avatar">
					<p><%=msj.getMensaje()%></p>
					<span class="time-left"><%=msj.getFecha_hora()%></span>
				</div>
				<%
					} else {
				%>
				<!--  Chat para admin -->
				<div class="container darker">
					<img src="assets/images/users/admin.png" alt="Avatar">
					<p><%=msj.getMensaje()%></p>
					<span class="time-left"><%=msj.getFecha_hora()%></span>
				</div>

				<%
						}
					}
				}
				%>
					
				<form action="ContactoServlet" method="POST">
					<div class="panel-footer">
	                    <div class="input-group">
	                        <input name="mensajeUserComun" id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Deja tu mensaje aqui..." autocomplete="off" required />
	                        <span class="input-group-btn">
	                        <input hidden="true"name="idCliente"  value="<%=idCliente%>" >
							<input hidden="true" name="idAdmin" value="<%=idAdmin%>" >
							<input hidden="true" name="idPedido" value="<%=idPedido%>" >
	                        </span>
	                        <button class="btn btn-primary btn-sm" id="btn-chat">Enviar</button>
	                    </div>
	                     
	                </div>
                </form>  		
						
						</div>

					</div>
				</div>

		</div>
		
		<footer style="background: white;" class="footer text-center">
		Todos los derechos reservados por <a href="index.jsp">
			TekSoftware</a>.
	</footer>
	
	</div>
	
</body>
</html>