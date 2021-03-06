<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.*" %>    
<%@ page import = "datos.*" %>   
<%@ page import = "java.util.ArrayList" %>   
<!DOCTYPE html>
<html dir="ltr" lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>ABM Usuarios</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <link href="dist/css/style.extras.css" rel="stylesheet">
   
</head>

<body>
    
	<%@ include file = "/security/isNotLoggedIn.jsp" %>
    <%@ include file = "/security/isNotAdmin.jsp" %>
    
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
                        <i class="ti-menu ti-close"></i>
                    </a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <a href="indexAdmin.jsp" class="logo">
                            <!-- Logo icon -->
                            <b class="logo-icon">
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="ti-more"></i>
                    </a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item search-box">
                            <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                                <div class="d-flex align-items-center">
                                    <i class="mdi mdi-magnify font-20 mr-1"></i>
                                    <div class="ml-1 d-none d-sm-block">
                                        <span>Search by username or email</span>
                                    </div>
                                </div>
                            </a>
                            <form class="app-search position-absolute" action="AbmUsuariosServlet" method="POST">
                                <input type="text" name="datosParciales" class="form-control" placeholder="Ingrese usuario o email">
                                <a class="srh-btn">
                                    <i class="ti-close"></i>
                                </a>
                            </form>
                        </li>
                    </ul>
                  
                </div>
            </nav>
        </header>
      
    
    	<%@ include file = "/partials/panelAdmin.jsp" %>
    
    
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">Lista de Usuarios</h4>
                        
                    </div>
                    <div class="col-5 align-self-left">
                 
                        <a class="addbutton" href="addUsuario.jsp">+ Añadir Usuario</a>
                    </div>
                </div>
            </div>
           
           
            <div class="container-fluid">
            
              <% if (request.getAttribute("result")!=null) {
        	   MyResult res = (MyResult)request.getAttribute("result");
        	   if(res.getResult().equals(MyResult.results.OK)){
        		   %>
                   <p style="color:green"><%=res.getErr_message()%></p>
                  <%
        	   } else {
        	      %>
                   <p style="color:red"><%=res.getErr_message()%></p>
                   <%}
                   }
                 %>
            
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Apellido</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Admin</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <% 
                    ArrayList<Usuario> list = (ArrayList<Usuario>)request.getAttribute("listaUsuarios");
                   
                    if(list == null){
                    	  list = new ArrayList<Usuario>();
                    	  list = (ArrayList<Usuario>)request.getAttribute("listaParcial");
                   }
                	   
                    for (Usuario u : list) {%> 
                                        <tr>
                                            <td scope="row"><%=u.getIdUsuario() %></td>
                                            <td><%=u.getNombre() %></td>
                                            <td><%=u.getApellido() %></td>
                                            <td><%=u.getEmail() %></td>
                                            <td><%=u.getUsername()%>
                                           	<% if (u.isAdmin()){%>
                                            	<td>Si</td>
                                            <%} else {%>
                                            	<td>No</td>
                                            <%} %>
                                         <td>
	                                     <a class="editbutton" href="EditUserServlet?id=<%=u.getIdUsuario()%> "> Editar </a>
	                                     <a class="deletebutton" href="DeleteUserServlet?id=<%=u.getIdUsuario()%>"> Eliminar </a>
                                            </td>
                                        </tr>
                    <%} %>
                                    </tbody>
                                </table>
                             <% if (list.isEmpty()) {
                             	 %><p style="font-size:16px;"> No hay resultados </p>
                             <%} %>
                            </div>
                        </div>
                    </div>
            </div>
            
         
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
</body>

</html>