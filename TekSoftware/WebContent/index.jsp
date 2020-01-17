<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.*"%>
<%@ page import="datos.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="es">

<head>
<title>TekSoftware &mdash;</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">


<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">

<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">

</head>

<body>

	<%@ include file="/partials/navBar.jsp"%>

	<div class="slider-item overlay" data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_2.jpg');">
		<div class="container">
			<div
				class="row slider-text align-items-center justify-content-center">
				<div class="col-lg-9 text-center col-sm-12 element-animate">
					<h1 class="mb-4">Tu software a medida</h1>

					<div class="btn-play-wrap mx-auto">

						<!--  EL USUARIO ES RECUPERADO EN EL ARCHIVO NAVBAR.JSP  (DE EXISTIR)-->
						<%
							if (user != null) {
						%>

						<!-- SI EL USUARIO ESTA LOGGEADO REDIRIGIR AL PEDIDO -->
						<a href="pedido.jsp" <%session.setAttribute("numeroPaso", 1);%>
							<%session.setAttribute("selecciones", new ArrayList<Seleccion>());%>
							class="btn-play"><span class="ion ion-ios-play"></span> </a>
						<%
							} else {
						%>

						<!-- --SINO REDIRIGIRLO AL LOGIN -->
						<a href="login.jsp" class="btn-play"><span
							class="ion ion-ios-play"></span> </a>
						<%
							}
						%>

					</div>
					<span>Comienza ya!</span>

				</div>
			</div>
		</div>
	</div>



	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 mr-auto mb-5">
					<span class="d-block text-uppercase text-secondary">Quiénes
						Somos</span> <span class="divider my-4"></span>
					<h2 class="mb-4 section-title">
						SOMOS <strong>Tek Software</strong>
					</h2>
					<p>Somos una compañía que desarrolla soluciones de software
						innovadoras para audiencias globales, basándonos en las
						tecnologías y tendencias emergentes. Combinamos el rigor de la
						ingeniería y la tecnología de los proveedores TI con la mirada
						creativa y cultural de las agencias digitales. TekSoftware es el
						lugar donde la ingeniería, el diseño y la innovación se unen para
						llegar a gran escala.</p>
				</div>
				<div class="col-lg-6">
					<figure class="img-dotted-bg">
						<img src="images/index_2.jpg" alt="Image" class="img-fluid">
					</figure>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 mr-auto mb-3">
					<span class="d-block text-uppercase text-secondary">Servicios
						Destacados</span> <span class="divider my-4"></span>
					<h2 class="mb-4 section-title">
						Los <strong>Servicios</strong> Que Proveemos
					</h2>
					<p>Ayudamos a nuestros clientes a superar los retos más
						complejos a través de nuestros servicios líderes en estrategia,
						consultoría, digital, tecnología y operaciones. Con experiencia en
						más de cuarenta sectores y en todas las áreas de negocio de la
						empresa, ofrecemos resultados en transformación para el exigente
						nuevo mundo digital.</p>

				</div>
				<div class="col-lg-6">
					<div class="row mt-5">
						<div class="col-lg-6 col-md-6 mb-4">
							<div class="service">
								<span class="icon icon-shield mb-4 d-block"></span>
								<h3>Branding</h3>
								<p>Creación de marca. Diferenciación de la competencia.</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 mb-4">
							<div class="service">
								<span class="icon icon-screen-desktop mb-4 d-block"></span>
								<h3>Web Design</h3>
								<p>Interfaz amigable con el usuario. Diseño ágil e
									intuitivo.</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 mb-4">
							<div class="service">
								<span class="icon icon-screen-smartphone mb-4 d-block"></span>
								<h3>App Design</h3>
								<p>Diseños a medida. Funcionalidad y estetica en todos los
									dispositivos.</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 mb-4">
							<div class="service">
								<span class="icon icon-rocket mb-4 d-block"></span>
								<h3>Despegue</h3>
								<p>Utilización de las técnicas de marketing más recientes
									para lograr un mejor posicionamiento.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="/partials/footer.jsp"%>


	<!-- END footer -->

	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#f4b214" /></svg>
	</div>

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
