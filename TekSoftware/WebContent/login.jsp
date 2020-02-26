<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html dir="ltr" lang="es">

<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap" rel="stylesheet">

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

	<%@ include file = "/security/isLoggedIn.jsp" %>
    
	<%@ include file ="/partials/navBar.jsp" %>
	
	<% MyResult res = (MyResult)request.getAttribute("result");
	
	 %>
	
  <div class="inner-page">
    <div class="slider-item overlay" style="background-image: url('images/hero_2.jpg');"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
          <div class="col-lg-9 text-center col-sm-12 element-animate">
            <h1 class="mb-4">Iniciar Sesión</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-3 mb-5 order-2">
        </div>
        <div class="col-md-6 mb-5 order-2">
          
          
          <form action="LoginServlet" method="POST">
	           <% if (res != null){ 
	           	
	        	   if (res.getResult().equals(MyResult.results.OK)){
	           %>
	            <div class="row">
	              <div class="col-md-12 form-group">
	                <label style="color:green"><%=res.getErr_message()%></label>
	              </div>
	            </div>
	            <%} else { %>
	            <div class="row">
	              <div class="col-md-12 form-group">
	                <label style="color:red"><%=res.getErr_message()%></label>
	              </div>
	            </div>
	            <%}
	         }%>
	            
	          
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="user">Usuario</label>
                <input type="text" name="usuario" id="user" required  pattern="[A-Za-z0-9]{5,15}" title="No utilices espacios o caracteres especiales. Longitud mínima: 5 caracteres" class="form-control ">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="pass">Contraseña</label>
                <input type="password" name="password" id="pass" required pattern="[A-Za-z0-9]{8,15}" title="La longitud mínima debe ser de 8 caracteres" class="form-control ">
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 form-group">
                <input type="submit" value="Iniciar Sesión" class="btn btn-primary px-3 py-3">
              </div>
            </div>
            <p style=font-size:14px;>Aún no tienes una cuenta? <a href="signin.jsp">Registrate aqui</a></p>
          </form>
        </div>
      </div>
    </div>
  </div>

  <%@include file="/partials/footer.jsp" %>

  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#f4b214" /></svg></div>

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
