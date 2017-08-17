<%--
  Created by IntelliJ IDEA.
  User: michelhayman
  Date: 8/15/17
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pick up Time</title>
    <!-- mobile apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Surfer Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //mobile apps -->
    <!-- Custom Theme files -->
    <link href="/webresources/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="/webresources/css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="/webresources/css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
    <link rel="stylesheet" href="/webresources/css/percircle.css">
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="/webresources/js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- web-fonts -->
    <link href='/webresources/fonts.googleapis.com/css?family=Buda:300' rel='stylesheet' type='text/css'>
    <link href='/webresources/fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- //web-fonts -->
</head>
<body>

<!-- banner -->
<div class="banner jarallax">
    <div class="banner-info">
        <div class="banner-top">
            <div class="container">
                <div class="navbar-header banner-logo">

                        <h1>Pickup  <span>Time</span></h1>
                    </a>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- banner-text -->
        <div class="banner-text">
            <!-- top-navigation -->
            <div class="main">
                <div class="container">
                    <nav id="menu" class="nav top-nav">
                        <button  class="navtoogle">
                            <span class="icon-menu glyphicon glyphicon-menu-hamburger"> </span> Menu
                        </button>
                        <ul>
                            <li>
                                <a href="/">
										<span class="icon">
											<i aria-hidden="true" class="icon-home glyphicon glyphicon-home"></i>
										</span>
                                    <span>Home</span>
                                </a>
                            </li>
                            <li>
                                <a href="/listevents">
										<span class="icon">
											<i aria-hidden="true" class="glyphicon glyphicon-eye-open"></i>
										</span>
                                    <span>See Events</span>
                                </a>
                            </li>

                            <li>
                                <a href="/login" >
										<span class="icon">
											<i aria-hidden="true" class= "glyphicon glyphicon-user"></i>
										</span>
                                    <span>Log In</span>
                                </a>
                            </li>
                            <li>
                                <a href="/getnewuser">
										<span class="icon">
											<i aria-hidden="true" class="glyphicon glyphicon-pencil"></i>
										</span>
                                    <span>Register</span>
                                </a>
                            </li>

                        </ul>
                    </nav>
                    <script src="/webresources/js/modernizr.custom.js"></script>
                </div>
            </div>
            <!-- //top-navigation -->
        </div>

    </div>
</div>

<div id="gallery" class="gallery">
    <div class="container">

<div class="w3l-footer">
    <div class="container">
        <div class="copyright-agile">
            <p>&copy; 2017. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
        </div>
    </div>
</div>
<!-- //footer -->
<!-- modal-about -->
<div class="modal bnr-modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
                <iframe src="https://player.vimeo.com/video/117554484?title=0&portrait=0"></iframe>
                <div class="modal-w3lstext">
                    <h4>Blanditiis deleniti</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rutrum iaculis enim, non convallis felis mattis at. Donec fringilla lacus eu pretium rutrum. Cras aliquet congue ullamcorper. Etiam mattis eros eu ullamcorper volutpat. Proin ut dui a urna efficitur varius. uisque molestie cursus mi et congue consectetur adipiscing elit cras rutrum iaculis enim, Lorem ipsum dolor sit amet, non convallis felis mattis at. Maecenas sodales tortor ac ligula ultrices dictum et quis urna. Etiam pulvinar metus neque, eget porttitor massa vulputate in. Fusce lacus purus, pulvinar ut lacinia id, sagittis eumi.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //modal-about -->
<!-- jarallax -->
<script src="/webresources/js/SmoothScroll.min.js"></script>
<script src="/webresources/js/jarallax.js"></script>
<script type="text/javascript">
    /* init Jarallax */
    $('.jarallax').jarallax({
        speed: 0.5,
        imgWidth: 1366,
        imgHeight: 768
    })
</script>
<!-- //jarallax -->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="/webresources/js/move-top.js"></script>
<script type="text/javascript" src="/webresources/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();

            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
    $(document).ready(function() {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/webresources/js/bootstrap.js"></script>
</body>
</html>