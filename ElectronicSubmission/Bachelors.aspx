<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bachelors.aspx.cs" Inherits="ElectronicSubmission.Bachelors" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Favicon icon -->
    <link rel="icon" href="Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>REU - Bachelors</title>

    <!-- Css Files -->
    <link href="Template/css/bootstrap.css" rel="stylesheet">
    <link href="Template/css/font-awesome.css" rel="stylesheet">
    <link href="Template/css/flaticon.css" rel="stylesheet">
    <link href="Template/css/slick-slider.css" rel="stylesheet">
    <link href="Template/css/prettyphoto.css" rel="stylesheet">
    <link href="Template/build/mediaelementplayer.css" rel="stylesheet">
    <link href="Template/style.css" rel="stylesheet">
    <link href="Template/css/color.css" rel="stylesheet">
    <link href="Template/css/color-two.css" rel="stylesheet">
    <link href="Template/css/color-three.css" rel="stylesheet">
    <link href="Template/css/color-four.css" rel="stylesheet">
    <link href="Template/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <!--// Main Wrapper \\-->
    <div class="wm-main-wrapper">

        <!--// Header \\-->
        <header id="wm-header" class="wm-header-one">

            <!--// TopStrip \\-->
            <div class="wm-topstrip">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wm-language">
                                <ul>
                                    <li><a href="#">English</a></li>
                                    <li><a href="#" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                </ul>
                            </div>
                            <ul class="wm-stripinfo">
                                <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;">King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia</a></li>
                                <li><i class="wmicon-technology4"></i>+920-000-842</li>
                                <li><i class="wmicon-clock2"></i>sat - fri: 7:00am - 6:00pm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--// TopStrip \\-->

            <!--// MainHeader \\-->
            <div class="wm-main-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3"><a href="index-2.html" class="wm-logo">
                            <img src="Template/images/logo-5.png" alt="" style="height: 62px;"></a></div>
                        <div class="col-md-9">
                            <!--// Navigation \\-->
                            <nav class="navbar navbar-default">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="true">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li class="active"><a href="homepage.aspx">Home</a></li>
                                        <li><a href="homepage.aspx#colleges">Colleges</a></li>
                                        <li><a href="homepage.aspx#steps">Steps</a></li>
                                        <li><a href="homepage.aspx#contactas">Contact</a></li>
                                        <li><a href="homepage.aspx#aboutas">About</a></li>

                                    </ul>
                                </div>
                            </nav>
                            <!--// Navigation \\-->
                            <a href="StudentSubmitting.aspx" class="wm-header-btn">Submission</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// MainHeader \\-->


            <!--// Mini Header \\-->
            <div class="wm-pro-mini-header">
                <span class="wm-blue-transparent"></span>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wm-mini-title">
                                <h1 id="headerBachelors" runat="server"></h1>
                            </div>
                            <div class="wm-breadcrumb">
                                <ul>
                                    <li><a href="homepage.aspx">Home</a></li>
                                    <li><a href="homepage.aspx#colleges">Bachelors</a></li>
                                    <li id="detailedBachelors" runat="server"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Mini Header \\-->



            <!--// Main Content \\-->
            <div class="wm-main-content ">

                <!--// Main Section \\-->
                <div class="wm-main-section">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-12">
                                <div class="row">

                                    <aside class="col-md-3">
                                        <div class="widget widget_our-professors">
                                            <figure>
                                                <a href="#"><img src="Template/extra-images/dental-surgery.jpg" alt="" id="bachelorsImage" runat="server"/></a>
                                                
                                            </figure>
                                        </div>
                                    </aside>
                                    <div class="col-md-9">
                                        <div class="wm-professor-info">
                                            <h2 id="headerBody" runat="server"></h2>
                                            <ul class="row">
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="#" class="icon-hidden"><i class="wmicon-technology4" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6>Phone:</h6>
                                                        <span>+920-000-842</span>
                                                    </div>
                                                </li>
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="#"><i class="wmicon-web2" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6>Email:</h6>
                                                        <span>info@riyadh.edu.sa</span>
                                                    </div>
                                                </li>
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="StudentSubmitting.aspx"><i class="wmicon-pen" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6>Submission:</h6>
                                                        <span>Form Request</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="wm-rich-aditor">
                                            <div id="bachelorsDescription" runat="server">
                                                <!--// Code behene \\-->
                                            </div><br/>
                                            <h3>Admission requirements</h3>

                                            <div id="bachelorsReque" runat="server">
                                                <!--// Code behene \\-->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--// Main Section \\-->

            </div>
            <!--// Main Content \\-->

        </header>
        <!--// Header \\-->

        <!--// Footer \\-->
        <footer id="wm-footer" class="wm-footer-one">

            <!--// FooterNewsLatter \\-->
                <div class="wm-footer-newslatter">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <i class="wmicon-pen"></i>
                                <input type="text" readonly="readonly" style="width: 50%;" value="Please click on the button to start the application Form" onblur="if(this.value == 'Please click on the button to start the application Form') { this.value ='Please click on the button to start the application Form'; }" onfocus="if(this.value =='Please click on the button to start the application Form') { this.value = 'Please click on the button to start the application Form'; }">
                                <a href="StudentSubmitting.aspx">Submission Form Request</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// FooterNewsLatter \\-->

            <!--// FooterWidgets \\-->
            <div class="wm-footer-widget" id="aboutas">
                <div class="container">
                    <div class="row">
                        <aside class="widget widget_contact_info col-md-3">
                            <a href="index-2.html" class="wm-footer-logo">
                                <img src="Template/images/logo-5.png" alt="" style="height: 77px;"></a>
                            <ul>
                                <li><i class="wm-color wmicon-pin"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641">
                                    <p>King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia</p>
                                </a></li>
                                <li><i class="wm-color wmicon-phone"></i>+920-000-842</li>
                                <li><i class="wm-color wmicon-letter"></i><a href="mailto:info@riyadh.edu.sa">info@riyadh.edu.sa</a></li>
                            </ul>
                            <div class="wm-footer-icons">
                                <a href="https://www.facebook.com/RiyadhColleges"><i class="fa fa-facebook-square"></i></a>
                                <a href="https://twitter.com/RiyadhElmU"><i class="fa fa-twitter-square"></i></a>
                                <a href="https://www.youtube.com/user/RiyadhColleges"><i class="fa fa-youtube-play"></i></a>
                                <a href="https://www.instagram.com/riyadhelmu/"><i class="fa fa-instagram"></i></a>
                                <a href="https://www.flickr.com/photos/riyadhcolleges"><i class="fa fa-flickr"></i></a>
                                <a href="https://snapchat.com/add/Riyadh.elmu"><i class="fa fa-snapchat-square"></i></a>
                            </div>
                        </aside>
                        <aside class="widget widget_archive col-md-2">
                            <div class="wm-footer-widget-title">
                                <h5><i class="fa fa-link"></i>Quick Links</h5>
                            </div>
                            <ul>
                                <li class="active"><a href="homepage.aspx">Home</a></li>
                                <li><a href="homepage.aspx#colleges">Colleges</a></li>
                                <li><a href="homepage.aspx#steps">Steps</a></li>
                                <li><a href="homepage.aspx#contactas">Contact</a></li>
                                <li><a href="homepage.aspx#aboutas">About</a></li>
                                <li><a href="StudentSubmitting.aspx">Get Started</a></li>
                            </ul>
                        </aside>
                        <aside class="widget widget_twitter col-md-3">
                            <div class="wm-footer-widget-title">
                                <h5><i class="fa fa-eye"></i>Our Vision</h5>
                            </div>
                            <ul>
                                <li>
                                    <p>To become a preeminent educational institution locally, regionally, and internationally.</p>
                                </li>
                            </ul>
                            <div class="wm-footer-widget-title">
                                <h5><i class="fa fa-paper-plane-o"></i>Our Mission</h5>
                            </div>
                            <ul>
                                <li>
                                    <p>Effective education and training with active contribution to scientific research and community service.</p>
                                </li>
                            </ul>
                        </aside>
                        <aside class="widget widget_archive col-md-4">
                            <div class="wm-footer-widget-title">
                                <h5><i class="fa fa-google-wallet"></i>Our Goals</h5>
                            </div>
                            <ol>
                                <li><a href="#">Graduate competent professionals to meet the needs of the labor market.</a></li>
                                <li><a href="#">Engage in community service.</a></li>
                                <li><a href="#">Conduct scientific research.</a></li>
                                <li><a href="#">Provide competitive postgraduate programs.</a></li>
                                <li><a href="#">Provide health care and promote health awareness to the public.</a></li>
                                <li><a href="#">Encourage lifelong learning through accredited continuous education programs.</a></li>
                            </ol>
                        </aside>
                    </div>
                </div>
            </div>
            <!--// FooterWidgets \\-->

            <!--// FooterCopyRight \\-->
            <div class="wm-copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <span>© Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy | All Rights Reserved</span>
                        </div>
                        <div class="col-md-4">
                            <p><a target="_blank" href="http://www.home.riyadh.edu.sa/">Riyadh Elm University</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!--// FooterCopyRight \\-->

        </footer>
        <!--// Footer \\-->

        <div class="clearfix"></div>
    </div>
    <!--// Main Wrapper \\-->

    <!-- ModalLogin Box -->
    <div class="modal fade" id="ModalLogin" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">

                    <div class="wm-modallogin-form wm-login-popup">
                        <span class="wm-color">Login to Your Account</span>
                        <form>
                            <ul>
                                <li>
                                    <input type="text" value="Your Username" onblur="if(this.value == '') { this.value ='Your Username'; }" onfocus="if(this.value =='Your Username') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="password" value="password" onblur="if(this.value == '') { this.value ='password'; }" onfocus="if(this.value =='password') { this.value = ''; }">
                                </li>
                                <li><a href="#" class="wm-forgot-btn">Forgot Password?</a> </li>
                                <li>
                                    <input type="submit" value="Sign In">
                                </li>
                            </ul>
                        </form>
                        <span class="wm-color">or try our socials</span>
                        <ul class="wm-login-social-media">
                            <li><a href="#"><i class="wmicon-social5"></i>Facebook</a></li>
                            <li class="wm-twitter-color"><a href="#"><i class="wmicon-social4"></i>twitter</a></li>
                            <li class="wm-googleplus-color"><a href="#"><i class="fa fa-google-plus-square"></i>Google+</a></li>
                        </ul>
                        <p>Not a member yet? <a href="#">Sign-up Now!</a></p>
                    </div>
                    <div class="wm-modallogin-form wm-register-popup">
                        <span class="wm-color">create Your Account today</span>
                        <form>
                            <ul>
                                <li>
                                    <input type="text" value="Your Username" onblur="if(this.value == '') { this.value ='Your Username'; }" onfocus="if(this.value =='Your Username') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="text" value="Your E-mail" onblur="if(this.value == '') { this.value ='Your E-mail'; }" onfocus="if(this.value =='Your E-mail') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="password" value="password" onblur="if(this.value == '') { this.value ='password'; }" onfocus="if(this.value =='password') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="text" value="Confirm Password" onblur="if(this.value == '') { this.value ='Confirm Password'; }" onfocus="if(this.value =='Confirm Password') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="submit" value="Create Account">
                                </li>
                            </ul>
                        </form>
                        <span class="wm-color">or signup with your socials:</span>
                        <ul class="wm-login-social-media">
                            <li><a href="#"><i class="wmicon-social5"></i>Facebook</a></li>
                            <li class="wm-twitter-color"><a href="#"><i class="wmicon-social4"></i>twitter</a></li>
                            <li class="wm-googleplus-color"><a href="#"><i class="fa fa-google-plus-square"></i>Google+</a></li>
                        </ul>
                        <p>Already a member? <a href="#">Sign-in Here!</a></p>
                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- ModalLogin Box -->

    <!-- ModalSearch Box -->
    <div class="modal fade" id="ModalSearch" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">

                    <div class="wm-modallogin-form">
                        <span class="wm-color">Search Your KeyWord</span>
                        <form>
                            <ul>
                                <li>
                                    <input type="text" value="Keywords..." onblur="if(this.value == '') { this.value ='Keywords...'; }" onfocus="if(this.value =='Keywords...') { this.value = ''; }">
                                </li>
                                <li>
                                    <input type="submit" value="Search">
                                </li>
                            </ul>
                        </form>
                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- ModalSearch Box -->

    <!-- jQuery (necessary for JavaScript plugins) -->
    <script type="text/javascript" src="Template/script/jquery.js"></script>
    <script type="text/javascript" src="Template/script/modernizr.js"></script>
    <script type="text/javascript" src="Template/script/bootstrap.min.js"></script>
    <script type="text/javascript" src="Template/script/jquery.prettyphoto.js"></script>
    <script type="text/javascript" src="Template/script/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="Template/script/fitvideo.js"></script>
    <script type="text/javascript" src="Template/script/skills.js"></script>
    <script type="text/javascript" src="Template/script/slick.slider.min.js"></script>
    <script type="text/javascript" src="Template/script/waypoints-min.js"></script>
    <script type="text/javascript" src="Template/build/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="Template/script/isotope.min.js"></script>
    <script type="text/javascript" src="Template/script/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
    <script type="text/javascript" src="Template/script/functions.js"></script>

</body>

<!-- index18:22  -->
</html>

