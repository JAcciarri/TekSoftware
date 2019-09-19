<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "entidades.*" %> 
<%@ page import = "datos.*" %>   
<%@ page import = "java.util.ArrayList" %>     

<!DOCTYPE html>
<html lang="es">

<head>
  <title>TekSoftware &mdash;</title>
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

	<%@ include file="navBar.jsp" %>

  <div class="slider-item overlay" data-stellar-background-ratio="0.5"
    style="background-image: url('images/hero_2.jpg');">
    <div class="container">
      <div class="row slider-text align-items-center justify-content-center">
        <div class="col-lg-9 text-center col-sm-12 element-animate">
          <h1 class="mb-4">Tu software a medida</h1>
          <div class="btn-play-wrap mx-auto">
            <% if (u != null) {%>
            	
                <a href="pedido.jsp"  <% session.setAttribute("numeroPaso", 1);%>
                class="btn-play"><span class="ion ion-ios-play"></span></a>
             <%} else{%>
                <a href="login.jsp"
                class="btn-play"><span class="ion ion-ios-play"></span></a>
             <%} %>   
         
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
          <span class="d-block text-uppercase text-secondary">Who We Are</span>
          <span class="divider my-4"></span>
          <h2 class="mb-4 section-title">We Are <strong>Design Agency</strong> That Bring Your Ideas Alive</h2>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id autem temporibus blanditiis accusamus perferendis libero accusantium nisi itaque tempore, harum aliquid aut, sapiente dolor tenetur. Tempora corrupti suscipit delectus perspiciatis!</p>
          <p class="mb-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum, voluptatibus.</p>
          <p><a href="#" class="btn btn-outline-black">Learn More</a></p>
        </div>
        <div class="col-lg-6">
          <figure class="img-dotted-bg">
            <img src="images/about_1.jpg" alt="Image" class="img-fluid">
          </figure>
        </div>
      </div>
    </div>
  </div>

  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 mr-auto mb-3">
          <span class="d-block text-uppercase text-secondary">Featured Services</span>
          <span class="divider my-4"></span>
          <h2 class="mb-4 section-title">The <strong>Services</strong> That We Are Providing</h2>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Id autem temporibus blanditiis accusamus perferendis
            libero accusantium nisi itaque tempore, harum aliquid aut, sapiente dolor tenetur. Tempora corrupti suscipit
            delectus perspiciatis!</p>
          <p class="mb-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum, voluptatibus.</p>

        </div>
        <div class="col-lg-6">
          <div class="row mt-5">
            <div class="col-lg-6 col-md-6 mb-4">
              <div class="service">
                <span class="icon icon-shield mb-4 d-block"></span>
                <h3>Branding</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias id volume amet.</p>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 mb-4">
              <div class="service">
                <span class="icon icon-screen-desktop mb-4 d-block"></span>
                <h3>Web Design</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias id volume amet.</p>
              </div>
            </div>

            <div class="col-lg-6 col-md-6 mb-4">
              <div class="service">
                <span class="icon icon-screen-smartphone mb-4 d-block"></span>
                <h3>App Design</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias id volume amet.</p>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 mb-4">
              <div class="service">
                <span class="icon icon-rocket mb-4 d-block"></span>
                <h3>Start Up</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias id volume amet.</p>
              </div>
            </div>
          </div>
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
