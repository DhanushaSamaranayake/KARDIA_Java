<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="description" content="modern responsive website using html5,css3, jquery and bootstrap framwork">
    <meta name="keywords" content="HTML5,CSS3,jQurey,Bootstrap,web Design,Web Development,Modern Website,Responsive Website,Dot Class">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <title>Welcome To KARDIA</title>

    <!-- CSS -->
    <!-- favicon -->
    <link rel="shortcut icon" href="resources/img/favicon1.ico">
    <!-- bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/main.css">
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Flamenco" rel="stylesheet">
    <!-- animate CSS -->
    <link rel="stylesheet" href="resources/css/animate/animate.css">
    <!--magnific-popup-->
    <link rel="stylesheet" href="resources/css/magnific-popup/magnific-popup.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="resources/css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl-carousel/owl.theme.default.min.css">

    <!-- fontawesome -->
    <link rel="stylesheet" href="resources/css/font-awesome/font-awesome.min.css">
    <!-- responsive CSS -->
    <link rel="stylesheet" href="resources/css/responsive.css">
    <!-- End CSS -->

    <!-- Scripts -->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="resources/js/wow/wow.min.js"></script>
    <script src="resources/js/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!--owl-carasol-->
    <script src="resources/js/owl-carousel/owl.carousel.min.js"></script>
    <!--counter-->
    <script src="resources/js/counter/jquery.waypoints.min.js.js"></script>
    <script src="resources/js/counter/jquery.counterup.min.js.js"></script>
    <!--easing-->
    <script src="resources/js/easing/jquery.easing.1.3.js"></script>
    <!--for smoth scoring effect -->
    <script src="resources/js/custom.js"></script>
    <!-- End Scripts -->
    <script src="https://smtpjs.com/v3/smtp.js"></script>

    <script type="text/javascript">
        function sendEmail(fullName,email,body) {
            Email.send({
                Host: "smtp.gmail.com",
                Username: "kardiak27@gmail.com",
                Password: "B8e598Q22wFgQuF",
                To: "kardiak27@gmail.com",
                From: "kardiak27@gmail.com",
                Subject: "Email from " + email,
                Body: "Full Name : " + fullName + "\n" + "Email : " +email
                    + "\n" +"Message : " + body,
            })
                .then(function (message) {
                    alert("We sent your information successfully")
                });
        }

    </script>

</head>


<body data-spy="scroll" data-target=".dotclass-top-nav" data-offset="65">

<!-- Header Section -->
<header>
    <nav class="navbar dotclass-top-nav navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="dotclass-nav-wrapper">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#dotclass-menu">
                        <span class="sr-only">Toggle nevigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#home">
                        <h3><span id="dothead">KARDIA</span></h3>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="dotclass-menu">
                    <ul class="nav navbar-nav">
                        <li><a class="smooth-scroll" href="#home">Home</a></li>
                        <li><a class="smooth-scroll" href="#about_kardia">About Kardia</a></li>
                        <li><a class="smooth-scroll" href="#contact">Contact</a></li>
                        <li><a href="/login">Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- End Header -->

<!--home section-->
<section id="home">
    <div id="home-cover" class="bg-parallax animated fadeIn">
        <div id="home-content-box">
            <div id="home-content-box-inner" class="text-center">

                <div id="home-heading" class="animated zoomIn">
                    <h3>We're overdue<br/> for a revolution of predicting mortality.</h3>
                </div>

                <div id="home-btn" class="animated zoomIn">
                    <a  href="/login" class="btn btn-lg btn-general btn-white" title="view Our Work">Get Started</a>
                </div>
            </div>
        </div>
    </div>
    <hr />
</section>
<!--End home section-->

<!--  About Kardia section-->
<section id="about_kardia">
    <div id="testimonial-cover" class="bg-parallax">
        <div class="content-box">
            <div class="content-title content-title-white wow animated fadeInDown" data-wow-duration="1s" data-wow-delay=".5s">
                <h3> ABOUT KARDIA</h3>

                <div class="content-title-underline"></div>
            </div>

            <div class="container">
                <div class="row wow animated bounceInDown" data-wow-duration="1s" data-wow-delay=".5s">
                    <div class="col-md-12">
                        <div id="customers-testimonials" class="text-center owl-carousel owl-theme">

                            <div class="testimonials">
                                <blockquote class="text-center">
                                    <p><b><font size="20px">18M</font></b> people dies globally each year from Cardiovascular diseases (CVDs), making CVDs the number one cause of death globally.</p>
                                </blockquote>
                            </div>

                            <div class="testimonials">
                                <blockquote class="text-center">
                                    <p><b><font size="20px">31%</font></b> of all global death</p>
                                </blockquote>
                            </div>

                            <div class="testimonials">
                                <blockquote class="text-center">
                                    <p>Cardiovascular diseases are set of diseases which involve the circulatory system.CVDs mainly exhibit as Heart failure. Heart failure can simply define as failure of the heart’s main function which is to pump blood properly to the whole body.</p>
                                </blockquote>
                            </div>

                            <div class="testimonials">
                                <blockquote class="text-center">
                                    <p>Risk-stratification of heart failure patients for therapy and heart implantation is a severe problem nowadays due to the lack of methods to forecasting the mortality of heart failure patients manually by a physician or a doctor. Generally risk-stratification is done by calculating a risk score using medical history, lifestyle and crucial health indicators, manually. It is not accurate.</p>
                                </blockquote>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!--End About -->

<!-- Footer -->
<footer>
    <div id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div id="contact-left">
                        <h3></h3>
                        <div id="contact-info">
                            <div id="phone-fax-email">
                                <p>
                                    <strong>Phone:</strong>
                                    <span> +94-78-000-4554 </span><br>
                                    <span> +94-72-000-0001 </span><br>
                                    <strong>Email: kardiak27@gmail.com</strong><span> </span><br>
                                </p>
                            </div>

                        </div>
                        <div>
                            <ul class="social-list ">
                                <li><a href="#" class="social-icon icon-white">
                                    <i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="social-icon icon-white">
                                    <i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="social-icon icon-white">
                                    <i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#" class="social-icon icon-white">
                                    <i class="fa fa-play"></i></a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div id="contact-right">
                        <h3>Contact Us</h3>
                        <form name="myForm" action="javascript:valid()" onsubmit="return validateForm()" method="post">
                            <input type="text" name="Full-name" placeholder="Full Name" class="form-control">
                            <input type="email" name="Email-Address" placeholder="Email Address" class="form-control">
                            <textarea rows="5" name="message" placeholder="Message..." class="form-control"></textarea>
                            <input type="submit" value="Sent" id="send-btn">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer-bottom">

        <div class="container">
            <div class="col-md-6">
                <div id="footer-copyright">
                    <p>Copyright &copy; 2022 All Right Reserved by Team KARDIA</p>
                </div>
            </div>
            <div class="col-md-6 hidden-sm hidden-xs">
                <div id="footer-menu">
                    <ul>
                        <li><a class="smooth-scroll" href="#home">Home</a></li>
                        <li><a class="smooth-scroll" href="#about_kardia">About Kardia</a></li>
                        <li><a class="smooth-scroll" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <a href="#home" id="back-to-top" class="btn btn-sm btn-blue btn-back-to-top smooth-scroll  hidden-xs" title="home" role="button"><i class="fa fa-angle-up"></i></a>
</footer>
<!-- End Footer -->

</body>
</html>