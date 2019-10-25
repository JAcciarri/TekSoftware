<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "datos.DataCaracteristica"
		 import = "entidades.*"
 		 import = "java.util.ArrayList" 
 		 import = "logica.PedidoController"
 		 %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pedido de Software</title>
	<meta charset="UTF-8">
	<meta name="description" content="Cloud 83 - hosting template ">
	<meta name="keywords" content="cloud, hosting, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="pedidos/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="pedidos/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="pedidos/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="pedidos/css/flaticon.css"/>
	<link rel="stylesheet" href="pedidos/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="pedidos/css/style.css"/>
    <link href="dist/css/style.extras.css" rel="stylesheet">

	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<a href="./index.jsp" class="site-logo">
			<p style="font-size:20px; color: white; margin: 20px;">
				<i class="fa fa-chevron-left"></i> TekSoftware</p></a>
		<div class="nav-switch">
			<i class="fa fa-bars"></i>
		</div>
	</header>
	<!-- Header section end -->


	<!-- Page Top section -->
	<section class="page-top-section set-bg" data-setbg="pedidos/img/page-top-bg.jpg">
		<div class="container">
			<h2>Pedidos</h2>
		</div>
	</section>
	<!-- Page Top section end -->


	<!--  SECCION DONDE MOSTRAMOS SEGUN EL ID SELECCIONADO -->
	
	
	<%  int nPaso = (int)session.getAttribute("numeroPaso"); 
	

	
	if (nPaso==4) {  
		
		PedidoController pCtrl = new PedidoController();
		ArrayList<Seleccion> selects = (ArrayList<Seleccion>)request.getSession().getAttribute("selecciones");
		Usuario usu = (Usuario)request.getSession().getAttribute("usuario");
		pCtrl.registrarPedido(selects, usu);
	%>
	
		<section class="features-section spad">
		<div class="container">
			<div class="section-title">
				<h2>Su pedido ha sido registrado con éxito</h2>
				<br>
				<p>Podra ver el detalle del pedido en la seccion <a href="perfilUsuario.jsp">Mi Perfil</a></p>
				<br><br> <br>
				<h4> El monto final del pedido de Software es de $(Calcular monto)</h4>

			</div>
		</div>
	</section>
	<% }
	else{
		
	DataCaracteristica dc = new DataCaracteristica();
	Caracteristica c = dc.getByID(nPaso);
	ArrayList<Opcion> opciones = dc.getOpcionesByIdCaracteristica(nPaso);
	%>

				<section class="features-section spad">
				<div class="container">
					<div class="section-title">
						<h2><%=c.getTitulo()%></h2>
						<p style="text-transform:uppercase;">PASO <%=nPaso%>/10</p>
					</div>
					
					<div class="row">
						<div class="col-lg-4 col-md-6 feature-item" >
							<a class="ft-icon" href="PedidoServlet?idOpcion=1">
								<i class="fa <%=opciones.get(0).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(0).getSubtitulo() %></h4>
							<p><%=opciones.get(0).getDescripcion() %></p>
						</div>
						
						<div class="col-lg-4 col-md-6 feature-item">
							<a class="ft-icon" href="PedidoServlet?idOpcion=2">
								<i class="fa <%=opciones.get(1).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(1).getSubtitulo() %></h4>
							<p><%=opciones.get(1).getDescripcion() %></p>
						</div>
						
						<div class="col-lg-4 col-md-6 feature-item">
							<a class="ft-icon" href="PedidoServlet?idOpcion=3">
								<i class="fa <%=opciones.get(2).getTextIcono()%>"></i>
							</a>
							<h4><%=opciones.get(2).getSubtitulo() %></h4>
							<p><%=opciones.get(2).getDescripcion() %></p>
						</div>
						
					</div>
				</div>
			</section>

		<% } %>
		
	<!-- Footer top section -->
	<section class="footer-top-section text-white spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-widget about-widget">
							<h4 class="fw-title">TekSoftware</h4>
						<p>Proin gravida nibh vel velit auctor aliquet, aenean sollicitudin lorem quis bibendum auctor, nisi elit consequat ipsum.Proin gravida nibh vel velit auctor aliquet, aenean sollicitudin lorem quis bibendum auctor, nisi elit consequat ipsum</p>
						<div class="fw-social social">
							<a href="#"><i class="fa fa-pinterest"></i></a>
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget">
						<h4 class="fw-title">Usefull Links</h4>
						<div class="row">
							<div class="col-sm-6">
								<ul>
									<li><a href="">Web Hosting</a></li>
									<li><a href="">WordPress Hosting</a></li>
									<li><a href="">VPS Hosting</a></li>
									<li><a href="">Cloud Server</a></li>
									<li><a href="">Reseller Package</a></li>
									<li><a href="">Dedicated Hosting</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul>
									<li><a href="">Web Hosting</a></li>
									<li><a href="">WordPress Hosting</a></li>
									<li><a href="">VPS Hosting</a></li>
									<li><a href="">Cloud Server</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4  col-md-6">
					<div class="footer-widget">
						<h4 class="fw-title">Latest Posts</h4>
						<div class="fw-latest-post-widget">
							<div class="lp-item">
								<div class="lp-content">
									<h6>Web Hosting for everyone</h6>
									<span>Oct 21, 2018</span>
								</div>
							</div>
							<div class="lp-item">
								<div class="lp-content">
									<h6>Web Hosting for everyone</h6>
									<span>Oct 21, 2018</span>
								</div>
							</div>
							<div class="lp-item">
								<div class="lp-content">
									<h6>Web Hosting for everyone</h6>
									<span>Oct 21, 2018</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer top section end -->


	<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
			<ul class="footer-menu">
				<li><a href="">Home</a></li>
				<li><a href="">About us</a></li>
				<li><a href="">Services</a></li>
				<li><a href="">News</a></li>
				<li><a href="">Contact</a></li>
			</ul>
			<div class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
		</div>
	</footer>
	<!-- Footer top section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="pedidos/js/jquery-3.2.1.min.js"></script>
	<script src="pedidos/js/bootstrap.min.js"></script>
	<script src="pedidos/js/owl.carousel.min.js"></script>
	<script src="pedidos/js/circle-progress.min.js"></script>
	<script src="pedidos/js/main.js"></script>

	</body>
</html>
