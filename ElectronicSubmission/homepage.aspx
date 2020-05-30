<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="homepage.aspx.cs" Inherits="ElectronicSubmission.homepage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>REU - Home</title>

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
    <script type='text/javascript'>
        function scrollToElement() {
            //Get target
            setTimeout(function () {
                var target = document.getElementById("colleges").offsetTop;

                //Scrolls to that target location
                window.scrollTo(0, target);
            }, 1);
        }
    </script>
</head>
<body>
    <form runat="server">
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
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#ModalLogin">login</a>
                                    </li>
                                    <li>
                                        <a href="#" class="wm-search-btn" data-toggle="modal" data-target="#ModalSearch"><i class="wmicon-search"></i></a>
                                    </li>
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
                            <div class="col-md-3">
                                <a href="../../../homepage.aspx" class="wm-logo">
                                    <img src="Template/images/logo-5.png" alt="" style="height: 62px;"></a>
                            </div>
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
                                            <li class="active"><a href="#home">Home</a></li>
                                            <li><a href="#colleges">Colleges</a></li>
                                            <li><a href="#steps">Steps</a></li>
                                            <li><a href="#contactas">Contact</a></li>
                                            <li><a href="#aboutas">About</a></li>

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

            </header>
            <!--// Header \\-->

            <!--// Main Banner \\-->
            <div class="wm-main-banner" id="home">

                <div class="wm-banner-one">
                    <div class="wm-banner-one-for">
                        <div class="wm-banner-one-for-layer">
                            <img src="Template/extra-images/banner-view1-3.jpg" alt="">
                        </div>
                        <div class="wm-banner-one-for-layer">
                            <img src="Template/extra-images/banner-view1-2.jpg" alt="">
                        </div>
                        <div class="wm-banner-one-for-layer">
                            <img src="Template/extra-images/banner-view1-1.jpg" alt="">
                        </div>
                    </div>
                    <div class="wm-banner-one-nav">
                        <div class="wm-banner-one-nav-layer">
                            <h1>Riyadh Elm University</h1>
                            <p>Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is a privately supported post-secondary...</p>
                            <a href="http://www.home.riyadh.edu.sa/about-us/" class="wm-banner-btn">Read More</a>
                        </div>
                        <div class="wm-banner-one-nav-layer">
                            <h1>Bachelors Degrees</h1>
                            <p>The core of Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy (RCsDP) is the academic excellence.</p>
                            <a href="http://www.home.riyadh.edu.sa/bachelors-degrees/" class="wm-banner-btn">Read More</a>
                        </div>
                        <div class="wm-banner-one-nav-layer banner-bgcolor">
                            <h1>Research & Business</h1>
                            <p>The scientific community nominates CRISPR System, based on research developed at the UA.</p>
                            <a href="http://www.home.riyadh.edu.sa/" class="wm-banner-btn">Read More</a>
                        </div>
                    </div>
                </div>

            </div>
            <!--// Main Banner \\-->

            <!--// Main Content \\-->
            <div class="wm-main-content" id="colleges" runat="server">

                <!--// Main Section \\-->
                <div class="wm-main-section">
                    <div class="container">
                        <div class="row">

                            <div class="wm-fancy-title">
                                <h2><span>Colleges </span>Of University</h2>
                            </div>
                            <div class="col-md-4">
                                <div class="wm-search-course">
                                    <h3 class="wm-short-title wm-color">Find Your Bachelors</h3>
                                    <p>Fill in the form below to find your Bachelors:</p>
                                    <ul>
                                        <li>
                                            <input type="text" id="BachelorName" runat="server" placeholder="Bachelors Name" />
                                            <i class="wmicon-search"></i></li>
                                        <li>
                                            <div class="wm-apply-select">
                                                <asp:DropDownList ID="CollegesUniv" runat="server"></asp:DropDownList>
                                            </div>
                                        </li>
                                        <li>
                                            <asp:Button ID="SearchButton" AutoPackPost="true" runat="server" Text="Search Bachelors" OnClick="SearchButton_Click" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="wm-service wm-box-service" id="Specialization" runat="server">
                                    <!--// Code bihand loadSpecialization() \\-->
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--// Main Section \\-->

                <!--// Main Section \\-->
                <div class="wm-main-section wm-whychooseus-full">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-8">
                                <div class="whychooseus-list">
                                    <div class="wm-fancy-title">
                                        <h2>Why <span>Choose Us</span></h2>
                                    </div>
                                    <ul class="row">
                                        <li class="col-md-4">
                                            <span>209</span>
                                            <h6>of our trainees have got a prestigious job</h6>
                                        </li>
                                        <li class="col-md-4">
                                            <span>91%</span>
                                            <h6>students have established successful business</h6>
                                        </li>
                                        <li class="col-md-4">
                                            <span>35%</span>
                                            <h6>have already earned their first million</h6>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="wm-questions-studying">
                                    <img src="Template/extra-images/ask-questoin-bg.png" alt="">
                                    <h3 class="wm-color">Questions about studying with us?</h3>
                                    <p>We have a team of student advisers & officers to answer any questions:</p>
                                    <a class="wm-banner-btn" href="#">ask us now</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--// Main Section \\-->

                <!--// Main Section \\-->
                <div class="wm-main-section wm-ourhistory-full" id="steps">
                    <span class="wm-light-transparent"></span>
                    <div class="container">
                        <div class="row">

                            <div class="col-md-5">
                                <div class="wm-history-list">
                                    <h2><i class="fa fa-th-list"></i>Our Steps</h2>
                                    <ul>
                                        <li>
                                            <time datetime="2008-02-14 20:00">1</time>
                                            <span>Electronic submission.</span>
                                        </li>
                                        <li>
                                            <time datetime="2008-02-14 20:00">2</time>
                                            <span>Pay the registration fees.</span>
                                        </li>
                                        <li>
                                            <time datetime="2008-02-14 20:00">3</time>
                                            <span>English test personal interview.</span>
                                        </li>
                                        <li>
                                            <time datetime="2008-02-14 20:00">4</time>
                                            <span>Congratulations acceptance.</span>
                                        </li>
                                        <li>
                                            <time datetime="2008-02-14 20:00">5</time>
                                            <span>Pay the tuition fees.</span>
                                        </li>
                                        <li>
                                            <time datetime="2008-02-14 20:00">6</time>
                                            <span>Issuing the university number.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="wm-subscribe-form">
                                    <h2>Still not convinced? We can help you!</h2>
                                    <p>Fill out the form below and we will contact you.</p>
                                    <div style="float: left; width: 100%; border: 2px solid #ffffff; padding: 12px 8px;">
                                        <input type="text" value="Name:" />
                                        <input type="text" value="E-mail:" />
                                        <input type="submit" value="Get Advice">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--// Main Section \\-->

                <!--// Main Section \\-->
                <div class="wm-main-section wm-contact-full" id="contactas">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-12">

                                <div class="wm-contact-tab">

                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#homeContact" aria-controls="homeContact" data-toggle="tab">Contact Us</a></li>
                                        <li><a href="#profile" aria-controls="profile" data-toggle="tab">Information Details</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="homeContact">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="wm-map">
                                                        <div id="map"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="wm-contact-form">
                                                        <span>Talk To Us Today</span>
                                                            <ul style="float: left;width: 100%;">
                                                                <li>
                                                                    <i class="wmicon-black"></i>
                                                                    <input type="text" value="Name" onblur="if(this.value == '') { this.value ='Name'; }" onfocus="if(this.value =='Name') { this.value = ''; }">
                                                                </li>
                                                                <li>
                                                                    <i class="wmicon-symbol3"></i>
                                                                    <input type="text" value="E-mail" onblur="if(this.value == '') { this.value ='E-mail'; }" onfocus="if(this.value =='E-mail') { this.value = ''; }">
                                                                </li>
                                                                <li>
                                                                    <i class="wmicon-technology4"></i>
                                                                    <input type="text" value="Phone" onblur="if(this.value == '') { this.value ='Phone'; }" onfocus="if(this.value =='Phone') { this.value = ''; }">
                                                                </li>
                                                                <li>
                                                                    <i class="wmicon-web2"></i>
                                                                    <textarea placeholder="Message"></textarea>
                                                                </li>
                                                                <li>
                                                                    <input type="submit" value="Send Message">
                                                                </li>
                                                            </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="profile">
                                            <span class="wm-contact-title">Contact Info</span>
                                            <div class="wm-contact-service">
                                                <ul class="row">
                                                    <li class="col-md-4">
                                                        <span class="wm-service-icon"><i class="wmicon-pin"></i></span>
                                                        <h5 class="wm-color">Address</h5>
                                                        <a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641">
                                                            <p>King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia</p>
                                                        </a>
                                                    </li>
                                                    <li class="col-md-4">
                                                        <span class="wm-service-icon"><i class="wmicon-phone"></i></span>
                                                        <h5 class="wm-color">Phone</h5>
                                                        <p>+920-000-842</p>
                                                    </li>
                                                    <li class="col-md-4">
                                                        <span class="wm-service-icon"><i class="wmicon-letter"></i></span>
                                                        <h5 class="wm-color">E-mail</h5>
                                                        <p><a href="mailto:name@email.com">info@riyadh.edu.sa</a></p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <ul class="contact-social-icon">
                                                <li><a href="https://www.facebook.com/RiyadhColleges"><i class="fa fa-facebook-square"></i>Facebook</a></li>
                                                <li><a href="https://twitter.com/RiyadhElmU"><i class="fa fa-twitter-square"></i>Twitter</a></li>
                                                <li><a href="https://www.youtube.com/user/RiyadhColleges"><i class="fa fa-youtube-play"></i>Youtube</a></li>
                                                <li><a href="https://www.instagram.com/riyadhelmu/"><i class="fa fa-instagram"></i>Instagram</a></li>
                                                <li><a href="https://www.flickr.com/photos/riyadhcolleges"><i class="fa fa-flickr"></i>Flickr</a></li>
                                                <li><a href="https://snapchat.com/add/Riyadh.elmu"><i class="fa fa-snapchat-square"></i>Snapchat</a></li>
                                            </ul>
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

            <!--// Footer \\-->
            <footer id="wm-footer" class="wm-footer-one">

                <!--// FooterNewsLatter \\-->
                <div class="wm-footer-newslatter">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <i class="wmicon-pen"></i>
                                <input type="text" readonly="readonly" style="width: 50%;" value="Please click on the button to start the application process" onblur="if(this.value == 'Please click on the button to start the application process') { this.value ='Please click on the button to start the application process'; }" onfocus="if(this.value =='Please click on the button to start the application process') { this.value = 'Please click on the button to start the application process'; }">
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
                                <a href="../../../homepage.aspx" class="wm-footer-logo">
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
                                    <li class="active"><a href="#home">Home</a></li>
                                    <li><a href="#colleges">Colleges</a></li>
                                    <li><a href="#programs">Programs</a></li>
                                    <li><a href="#steps">Steps</a></li>
                                    <li><a href="#contactas">Contact</a></li>
                                    <li><a href="#aboutas">About</a></li>
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
                            <ul style="margin-bottom: 22px; float: left; width: 100%;">
                                <li style="margin-bottom: 5%; float: left; width: 100%;">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                </li>
                                <li style="margin-bottom: 5%; float: left; width: 100%;">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                                </li>
                                <li><a href="Pages/Auth/ResetPassword.aspx" class="wm-forgot-btn">Forgot Password?</a> </li>
                                <li>
                                    <asp:Button ID="LoginAcc" runat="server" Text="LogIn" OnClick="LoginAcc_Click"/>
                                </li>
                            </ul>
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
                            <span class="wm-color">Search Your Bachelors:</span>
                            <ul style="margin-bottom: 22px; float: left; width: 100%;">
                                <li style="margin-bottom: 5%; float: left; width: 100%;"><input type="text" placeholder="Bachelors..." id="keywordBachelors" runat="server" /></li> 
                                <li><asp:Button ID="SearchkeyWord" runat="server" Text="Button" OnClick="SearchkeyWord_Click1"/></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- ModalSearch Box -->
    </form>

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
