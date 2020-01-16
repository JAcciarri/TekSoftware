<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "entidades.Usuario" %>
    <%@ page import = "logica.PedidoController" %>
	<%@ page import = "java.util.ArrayList" %>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="perfil-usuario/assets/images/favicon.png">
    <title>Mi Perfil</title>
    <!-- Custom CSS -->
    <link href="perfil-usuario/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	
	
      <%@ include file="/partials/navBar.jsp" %>
      <% PedidoController pCtrl = new PedidoController();
      	 ArrayList<Pedido> pedidos = pCtrl.getPedidosAprobadosByCliente(u.getIdUsuario());
      %>  
        
        
        <div  class="slider-item overlay"  data-stellar-background-ratio="0.5" 
        style="background-image: url('images/hero_2.jpg');">
        
            <div class="container-fluid">
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5"></div>
                    <div class="col-lg-4 col-xlg-3 col-md-5"  style=margin-top:7%;>
                        <div class="card" style=background:#e4e8f0;>
                            <div class="card-body">
                            	<h4 class="card-title m-t-10 text-center">¡Bienvenido de nuevo!</h4>
                                <center class="m-t-30"> <img src="assets/images/users/userdefault.png" class="rounded-circle" width="150" />
                                    <h4 class="card-title m-t-10"><%=u.getUsername()%></h4>
                                    <div class="row text-center justify-content-md-center">
                                    </div>
                                </center>
                            </div>
                            <div>
                                <hr> </div>
                            <div class="card-body"> <small class="text-muted"><center><strong><%=u.getFullName()%></strong></center> </small>
                            	<small class="text-muted"><center><%=u.getEmail()%></center> </small>
                            </div>
                        </div>
                    </div>
                  
                  
                    <div class="row">
                      <div class="col-2"></div>

                      <div class="col-8">
                          <div class="card">
                              <div class="card-body">
                                  <h4 class="card-title" >¡Crea tu pedido!</h4>
                                  <h6 >No tienes ningún pedido en estado <strong>Pendiente</strong>. Realiza uno nuevo dando click <a href="pedido.jsp">aquí</a> y nosotros nos encargaremos de revisarlo lo antes posible para comenzar a llevarlo a cabo.</h6>
                              </div>
                          </div>
                      </div>

                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Últimos pedidos</h4>
                                    <h6 class="card-subtitle">Aquí se encuentran los pedidos que has realizado con anterioridad.</h6>
                                </div>
                                
                                <% if (pedidos.isEmpty()) { %>
                                	<p style=text-align:center;>No se encontraron pedidos aprobados</p>
                                	<p style=text-align:center;><a href="pedido.jsp">¡Crea uno!</a></p>
                                <%} else{ %>
                                
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Número de pedido</th>
                                                <th scope="col">Fecha de pedido</th>
                                                <th scope="col">Fecha de aprobación</th>
                                                <th scope="col">Monto total</th>
                                                <th scope="col">Estado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <% for (Pedido p : pedidos){ %>
                                          <tr>
                                              <th scope="row"><%=p.getIdPedido()%></th>
                                              <td><%=p.getFechaPedido()%></td>
                                              <td><%=p.getFechaAprobacion()%></td>
                                              <td><%=p.getMontoTotal() %></td>
                                              <td><span class="label label-rounded label-primary"><%=p.getEstado()%></span></td>
                                          </tr>
                                          <%} %>
                                        </tbody>
                                    </table>
                                </div>
                                 <%}  //FIN DEL ELSE%>
                                
                            </div>
                        </div>
                    </div>
                  
            </div>
        </div>  
 
    
           <%@include file="/partials/footer.jsp" %>
        
       </div>

    <script src="perfil-usuario/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="perfil-usuario/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="perfil-usuario/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="perfil-usuario/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="perfil-usuario/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="perfil-usuario/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="perfil-usuario/dist/js/custom.min.js"></script>
</body>

</html>
