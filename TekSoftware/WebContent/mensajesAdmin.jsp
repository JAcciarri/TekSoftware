<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.Usuario"   
  import = "entidades.Pedido" 
  import = "entidades.Mensaje" 
  import = "logica.ChatController"
  import = "java.util.ArrayList"   
  import = "logica.PedidoController" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mensajes - CHAT</title>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/chat/styles.css" rel="stylesheet" >
</head>
<body>

	<%// @include file = "/security/isLoggedIn.jsp" %>
	<%// @include file = "/security/isAdmin.jsp" %>
	<%
	Usuario admin = (Usuario)session.getAttribute("usuario");
	ChatController chat = new ChatController();
	PedidoController pCtrl = new PedidoController();
	ArrayList<Pedido> pedidos = pCtrl.getPedidosByAdmin(admin);
	ArrayList<Mensaje> mensajes = null;
	if (request.getAttribute("mensajes")!=null){
		 mensajes = (ArrayList<Mensaje>)request.getAttribute("mensajes");
	}
	%>

<div class="container">
	<div class="row">
                 <div class="col-sm-4">
                  <div class="panel panel-primary">
		    <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-book"></span>Mensajes</h3>
                    </div>
                </div>
		    <table class="table table-striped table-hover">
		        <tbody>
		        <% for (Pedido ped : pedidos) { %>
		            <tr>
		                <td><%=ped.getIdPedido()%></td>
		                <td><%=ped.getCliente().getFullName()%></td>
		                <td><a href="ContactoServlet?chat=<%=ped.getIdPedido()%>" class="editbutton">Ver</a></td>
		            </tr>
		        <% } %>
		          
		        </tbody>
		    </table>
		</div>
                 </div>
                 
                 
                 
                 <div class="col-sm-8">
                  <div class="chatbody">
                  <div class="panel panel-primary">
                <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> Chat</h3>
                    </div>
                </div>
                
                
                <% if (mensajes!=null)
                	for (Mensaje m : mensajes) {
                %>
                <div class="panel-body msg_container_base">
                     <% if (m.getUser().isAdmin()){ %>
                    <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_sent">
                                <p><%=m.getMensaje() %></p>
                                <time datetime="2009-11-13T20:00">Admin <%=m.getFecha_hora()%></time>
                           
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>
                     <%} %>
                    
                      <% if (!m.getUser().isAdmin()){ %>
                    <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_receive">
                               
                                <p><%=m.getMensaje() %></p>
                                <time datetime="2009-11-13T20:00">User <%=m.getFecha_hora()%></time>
                        
                            </div>
                        </div>
                    </div>
                 <%} %>
                 
                </div>
                <%} 
                %>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat"><i class="fa fa-send fa-1x" aria-hidden="true"></i></button>
                        </span>
                    </div>
                </div>
    		</div>

                 </div>
             </div>
</div>

</div>

</body>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</html>