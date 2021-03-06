<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="es">

<head>
<title>Estadisticas</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <%@include file = "/security/isNotLoggedIn.jsp" %>
	<%@include file = "/security/isNotAdmin.jsp" %>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
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
						<a href="indexAdmin.jsp" class="logo"> <b class="logo-icon">
								<img src="assets/images/logo-icon.png" alt="homepage"
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

					</ul>

				</div>
			</nav>
		</header>


		<%@ include file="/partials/panelAdmin.jsp"%>


		<div class="page-wrapper">
			<div class="container-fluid">


				<div class="card-deck">
					<div class="card">
						<img class="card-img-top" src="images/clientes.jpg" alt="Clientes">
						<div class="card-body" style="text-align: center">
							<h4 class="card-title">Clientes</h4>
							<p class="card-text  text-mutted">Ver estadísticas de
								nuestros clientes</p>
							<a href="EstadisticasServlet?servicio=clientes" class="btn btn-dark stretched-link"
								style="width: 100%"></a>

						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="images/pedidos.jpg"
							alt="Pedidos">
						<div class="card-body mt-6" style="text-align: center">
							<h4 class="card-title">Pedidos</h4>
							<p class="card-text text-mutted">Ver estadísticas de nuestros
								pedidos</p>
							<a href="EstadisticasServlet?servicio=pedidos" class="btn btn-warning stretched-link"
								style="width: 100%"></a>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="images/caract.png" alt="Pedidos">
						<div class="card-body mt-auto" style="text-align: center">
							<h4 class="card-title">Caracteristicas</h4>
							<p class="card-text text-mutted">Ver estadísticas de nuestras
								caracteristicas.</p>
							<a href="EstadisticasServlet?servicio=caracteristicas" class="btn btn-danger stretched-link"
								style="width: 100%"></a>
						</div>
					</div>
				</div>
			</div>


			<footer style="background: #f2f4f5;" class="footer text-center">
				Todos los derechos reservados por <a href="index.jsp">
					TekSoftware</a>.
			</footer>
		</div>
	</div>


	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/extra-libs/sparkline/sparkline.js"></script>
	<script src="dist/js/waves.js"></script>
	<script src="dist/js/sidebarmenu.js"></script>
	<script src="dist/js/custom.min.js"></script>

</body>

</html>