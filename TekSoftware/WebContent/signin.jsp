<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Craft &mdash; Website Template by Colorlib</title>
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
 
 <%@ include file ="navBar.jsp" %>


  <div class="inner-page">
    <div class="slider-item overlay" style="background-image: url('images/hero_2.jpg');"
      data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
          <div class="col-lg-9 text-center col-sm-12 element-animate">
            <h1 class="mb-4">Registrarse</h1>
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
          <form action="SigninServlet" method="POST">
            <div class="row">
              <div class="col-md-6 form-group">
                <label for="name">Nombre</label>
                <input type="text" name="nombre" id="name" class="form-control" autocomplete="off" required="">
              </div>
              <div class="col-md-6 form-group">
                <label for="phone">Apellido</label>
                <input type="text" name="apellido" id="phone" class="form-control" autocomplete="off" required="">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control " required="">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="tel">Tel�fono</label>
                <input type="number" name="telefono" id="tel" class="form-control " required="">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="user">Usuario</label>
                <input type="text" name="usuario" id="user" class="form-control " required="">
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="pass">Contrase�a</label>
                <input type="password" name="password" id="pass" class="form-control " required="">
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 form-group">
                <input type="submit" value="Registrarse" class="btn btn-primary px-3 py-3">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <footer class="site-footer" role="contentinfo">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md-4 mb-5">
          <h3 class="mb-4">About Craft</h3>
          <p class="mb-5">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Alias nihil numquam aspernatur
            inventore sint eligendi nostrum!</p>
          <ul class="list-unstyled footer-link d-flex footer-social">
            <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
          </ul>

        </div>
        <div class="col-md-5 mb-5 pl-md-5">
          <div class="mb-5">
            <h3 class="mb-4">Contact Info</h3>
            <ul class="list-unstyled footer-link">
              <li class="d-block">
                <span class="d-block">Address:</span>
                <span class="text-white">34 Street Name, City Name Here, United States</span>
              </li>
              <li class="d-block">
                <span class="d-block">Telephone:</span><span class="text-white">+1 242 4942 290</span>
              </li>
              <li class="d-block">
                <span class="d-block">Email:</span><span class="text-white">info@yourdomain.com</span>
              </li>
            </ul>
          </div>


        </div>
        <div class="col-md-3 mb-5">
          <h3 class="mb-4">Quick Links</h3>
          <ul class="list-unstyled footer-link">
            <li><a href="#">About</a></li>
            <li><a href="#">Terms of Use</a></li>
            <li><a href="#">Disclaimers</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-3">

        </div>
      </div>
      <div class="row">
        <div class="col-12 text-md-center text-left">
          <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;
            <script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with
            <i class="fa fa-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com"
              target="_blank">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>
      </div>
    </div>
  </footer>
  <!-- END footer -->

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
