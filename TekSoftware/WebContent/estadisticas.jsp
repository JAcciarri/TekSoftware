<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Estadisticas</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/style.extras.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
</head>

<body>

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
			
			
			<div class="col-lg-3 col-xlg-3 col-md-5">
				<div class="card" style="background: #e4e8f0;">
					<div class="card-body">
						<h4 class="card-title m-t-10 text-center"><a href="EstadisticasServlet?servicio=clientes">Clientes</a></h4>
						<center class="m-t-30">
							<img src="images/clientes.png"
								class="rounded-circle" width="150" />
							<div class="row text-center justify-content-md-center"></div>
						</center>
					</div>
				</div>
			</div>	
			
			<div class="col-lg-3 col-xlg-3 col-md-5">
				<div class="card" style="background: #e4e8f0;">
					<div class="card-body">
						<h4 class="card-title m-t-10 text-center"><a href="EstadisticasServlet?servicio=pedidos">Pedidos</a></h4>
						<center class="m-t-30">
							<img src="images/pedidos.png"
								class="rounded-circle" width="150" />
							<div class="row text-center justify-content-md-center"></div>
						</center>
					</div>
				</div>
			</div>
	
			</div>
		</div>


	</div>


	<footer style="background: #f2f4f5;" class="footer text-center">
		Todos los derechos reservados por <a href="index.jsp"> TekSoftware</a>.
	</footer>



	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/extra-libs/sparkline/sparkline.js"></script>
	<script src="dist/js/waves.js"></script>
	<script src="dist/js/sidebarmenu.js"></script>
	<script src="dist/js/custom.min.js"></script>

</body>

</html>