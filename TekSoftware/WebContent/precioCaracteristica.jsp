<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="logica.CaracteristicaController"%>

<!DOCTYPE html>
<html dir="ltr" lang="es">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Editar Caracteristica</title>
<link href="dist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" href="pedidos/css/bootstrap.min.css" />
<link rel="stylesheet" href="pedidos/css/font-awesome.min.css" />
<link rel="stylesheet" href="pedidos/css/flaticon.css" />
<link rel="stylesheet" href="pedidos/css/owl.carousel.min.css" />
<link rel="stylesheet" href="pedidos/css/style.css" />
<link href="dist/css/style.extras.css" rel="stylesheet">
</head>

<body>

	<%@ include file="/security/isNotLoggedIn.jsp"%>
	<%@ include file="/security/isNotAdmin.jsp"%>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<% 
     CaracteristicaController cc = new CaracteristicaController();
     Caracteristica c = (Caracteristica)request.getAttribute("caracteristicaAEditar"); 
     ArrayList<Opcion> opciones = cc.getOpcionesByIdCaracteristica(c.getIdCaracteristica());
 
     %>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin5">
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<div class="navbar-brand">
						<a href="index.html" class="logo"> <b class="logo-icon"> <img
								src="assets/images/logo-icon.png" alt="homepage"
								class="dark-logo" /> <img
								src="assets/images/logo-light-icon.png" alt="homepage"
								class="light-logo" />
						</b> <span class="logo-text"> <img
								src="assets/images/logo-text.png" alt="homepage"
								class="dark-logo" /> <img
								src="assets/images/logo-light-text.png" class="light-logo"
								alt="homepage" />
						</span>
						</a>
					</div>
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"> <i class="ti-more"></i>
					</a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin6">
					<ul class="navbar-nav float-left mr-auto">
						<li class="nav-item search-box"></li>
					</ul>
					<ul class="navbar-nav float-right">
					</ul>
				</div>
			</nav>
		</header>

		<%@ include file="/partials/panelAdmin.jsp"%>


		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-4 col-xlg-3 col-md-5">
						<div class="card">
							<div class="card-body" style="background: #e4e8f0;">
								<% String id = "Caracteristica " + c.getIdCaracteristica(); %>
								<i class="fa fa-bookmark"></i>
								<h4 class="card-title m-t-10"><%=id%></h4>
								<h6 class="card-subtitle"><%=c.getTitulo() %></h6>
							</div>
							<div></div>
						</div>
					</div>
				</div>


				<form action="EditPrecioServlet" METHOD="POST">
				<input hidden="true" name="idCaracteristica" value=<%=c.getIdCaracteristica()%>>
					<div class="row">
						<div class="col-lg-4 col-md-6 feature-item">
							<a class="ft-icon"> <i
								class="fa <%=opciones.get(0).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(0).getSubtitulo()%></h4>
							<p><%=opciones.get(0).getDescripcion()%></p>
							<input type="text" placeholder="Precio" name="precio1" pattern="[0-9]{1,10}" title="Solo numeros enteros. Máximo: 10 digitos" required
								class="form-control form-control-line">
						</div>

						<div class="col-lg-4 col-md-6 feature-item">
							<a class="ft-icon"> <i
								class="fa <%=opciones.get(1).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(1).getSubtitulo()%></h4>
							<p><%=opciones.get(1).getDescripcion()%></p>
							<input type="text" placeholder="Precio" name="precio2" pattern="[0-9]{1,10}" title="Solo numeros enteros. Máximo: 10 digitos" required
								class="form-control">
						</div>

						<div class="col-lg-4 col-md-6 feature-item">
							<a class="ft-icon"> <i
								class="fa <%=opciones.get(2).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(2).getSubtitulo()%></h4>
							<p><%=opciones.get(2).getDescripcion()%></p>
							<input type="text" placeholder="Precio" name="precio3" pattern="[0-9]{1,10}" title="Solo numeros enteros. Máximo: 10 digitos" required
								class="form-control">
						</div>

						<br>
						<div class="form-group">
							<div class="col-sm-12">
								<button class="btn btn-success">Actualizar
									Caracteristica</button>
							</div>
						</div>
					</div>
				</form>


			</div>
		</div>
	</div>
	</div>
	</div>
	<footer class="footer text-center"> </footer>
	</div>
	</div>
	
	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/extra-libs/sparkline/sparkline.js"></script>
	<script src="dist/js/waves.js"></script>
	<script src="dist/js/sidebarmenu.js"></script>
	<script src="dist/js/custom.min.js"></script>
	<script src="pedidos/js/jquery-3.2.1.min.js"></script>
	<script src="pedidos/js/bootstrap.min.js"></script>
	<script src="pedidos/js/owl.carousel.min.js"></script>
	<script src="pedidos/js/circle-progress.min.js"></script>
	<script src="pedidos/js/main.js"></script>
</body>

</html>