<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>404 Error </title>
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="404-page/css/style.css" />
</head>

<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404"></div>
			<h1>404</h1>
			<h2>Oops! Página no encontrada</h2>
			<p>Lo sentimos. La página solicitada no existe, ha sido cambiada o está temporalmente inhabilitada.</p>
			<a href=<%=request.getAttribute("url")%>>Volver al inicio</a>
		</div>
	</div>
</body>
</html>
