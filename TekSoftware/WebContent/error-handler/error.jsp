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
	<link type="text/css" rel="stylesheet" href="error-handler/css/style.css" />
</head>

<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404"></div>
			<h1><%=request.getAttribute("status_code")%></h1>
			<h2>Lo sentimos. Ha ocurrido un error</h2>
			<p>Podemos redirigirte al inicio si así lo deseas</p>
			<a href=<%=request.getAttribute("url")%>>Volver</a>
		</div>
	</div>
</body>
</html>
