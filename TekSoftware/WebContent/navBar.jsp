<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Perfil de Usuario%></title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<% Usuario u = (Usuario)session.getAttribute("usuario");
  				if (u != null) { %>

	<header role="banner">
		<nav class="navbar navbar-expand-lg  bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand " href="index.jsp">TekSoftware</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarsExample05" aria-controls="navbarsExample05"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>


				<div class="collapse navbar-collapse" id="navbarsExample05">
					<ul class="navbar-nav pl-md-5 ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="perfilUsuario.jsp">Mi Perfil</a></li>
						<li class="nav-item"><a class="nav-link" href="LoginServlet">Cerrar
								Sesión</a></li>
					</ul>

				</div>
			</div>
		</nav>
	</header>

	<% } else { %>



	<header role="banner">
		<nav class="navbar navbar-expand-lg  bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand " href="index.jsp">TekSoftware</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarsExample05" aria-controls="navbarsExample05"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>


				<div class="collapse navbar-collapse" id="navbarsExample05">
					<ul class="navbar-nav pl-md-5 ml-auto">
						<li class="nav-item"><a class="nav-link" href="login.jsp">Iniciar
								Sesión</a></li>
						<li class="nav-item"><a class="nav-link" href="signin.jsp">Registrarse</a>
						</li>
					</ul>

				</div>
			</div>
		</nav>
	</header>

	<%} %>
	<!-- END header -->

</body>
</html>