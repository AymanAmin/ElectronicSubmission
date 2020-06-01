<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentProcess.aspx.cs" Inherits="ElectronicSubmission.PaymentProcess" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" href="Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><% = ElectronicSubmission.FieldNames.getFieldName("homepage-title", "REU - Admission") %></title>

    <!-- Css Files -->
    <link href="Template/css/bootstrap.css" rel="stylesheet">
    <link href="Template/css/font-awesome.css" rel="stylesheet">
    <link href="Template/css/flaticon.css" rel="stylesheet">
    <link href="Template/css/slick-slider.css" rel="stylesheet">
    <link href="Template/css/prettyphoto.css" rel="stylesheet">
    <link href="Template/build/mediaelementplayer.css" rel="stylesheet">
    <link href="Template/css/color.css" rel="stylesheet">
    <link href="Template/css/color-two.css" rel="stylesheet">
    <link href="Template/css/color-three.css" rel="stylesheet">
    <link href="Template/css/color-four.css" rel="stylesheet">
    <link href="Template/css/responsive.css" rel="stylesheet">

    <link href="Template/style.css" rel="stylesheet">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

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
                                        <li><a href="PaymentProcess.aspx?lang=2">English</a></li>
                                        <li><a href="PaymentProcess.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                    </ul>
                                </div>
                                <ul class="wm-stripinfo">
                                    <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></a></li>
                                    <li><i class="wmicon-technology4"></i>+920-000-842</li>
                                    <li><i class="wmicon-clock2"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-work", "sat - fri: 7:00am - 6:00pm") %></li>
                                </ul>
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#ModalLogin"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-login", "Login") %></a>
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
                                            <li class="active"><a href="#home"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                            <li><a href="#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Colleges", "Colleges") %></a></li>
                                            <li><a href="#steps"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Steps", "Steps") %></a></li>
                                            <li><a href="#contactas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Contact", "Contact") %></a></li>
                                            <li><a href="#aboutas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-About", "About") %></a></li>

                                        </ul>
                                    </div>
                                </nav>
                                <!--// Navigation \\-->
                                <a href="StudentSubmitting.aspx" class="wm-header-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// MainHeader \\-->

            </header>
            <!--// Header \\-->

            <!--// Main Banner \\-->
            <div class="wm-main-banner" id="home">


                <div class="container">
                    <hr>
                    <div class="row">
                        <aside class="col-sm-3"></aside>
                        <aside class="col-sm-6">
                            <!--<p>Payment form1</p>-->

                            <article class="card" style="border: 1px solid gray; border-radius: 10px; padding: 5%">
                                <div class="card-body p-5">
                                    <!--<p>
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-visa.png">
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-mastercard.png">
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-american-ex.png">
                                    </p>-->
                            <p class="alert alert-success" style="display: none">Some text success or error</p>

                                     <div class="form-group">
                                        <label><span class="hidden-xs">Payment Type:</span> </label>
                                        <div class="form-inline">
                                            <select class="form-control" style="width: 50%">
                                                <option>Visa</option>
                                                <option>Master Card</option>
                                                <option>STC Pay</option>
                                            </select>
                                        </div>
                                    </div>

                            <div class="form-group">
                                <label for="username">Full name (on the card)</label>
                                <div class="input-group" style="width: 100%">
                                    <!--<div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                                </div>-->
                                    <input type="text" class="form-control" name="username" placeholder="" required="">
                                </div>
                                <!-- input-group.// -->
                            </div>
                            <!-- form-group.// -->

                            <div class="form-group">
                                <label for="cardNumber">Card number</label>
                                <div class="input-group" style="width: 100%">
                                    <!--<div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-credit-card"></i></span>
                                                </div>-->
                                    <input type="text" class="form-control" name="cardNumber" placeholder="">
                                </div>
                                <!-- input-group.// -->
                            </div>
                            <!-- form-group.// -->

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label><span class="hidden-xs">Expiration</span> </label>
                                        <div class="form-inline">
                                            <select class="form-control" style="width: 45%">
                                                <option>MM</option>
                                                <option>01 - Janiary</option>
                                                <option>02 - February</option>
                                                <option>03 - February</option>
                                            </select>
                                            <span style="width: 10%; text-align: center">/ </span>
                                            <select class="form-control" style="width: 45%">
                                                <option>YY</option>
                                                <option>2018</option>
                                                <option>2019</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                        <input class="form-control" required="" type="text">
                                    </div>
                                    <!-- form-group.// -->
                                </div>
                            </div>
                            <!-- row.// -->
                            <asp:Button ID="Confirm" class="subscribe btn btn-primary btn-block" runat="server" Text="Confirm" OnClick="Confirm_Click" />
                            </div>
                                <!-- card-body.// -->
                            </article>
                            <!-- card.// -->


                        </aside>
                        <aside class="col-sm-3"></aside>
                        <!-- col.// -->
                    </div>
                    <!-- row.// -->

                </div>
                <!--container end.//-->
                <br />
                <br />

            </div>
            <!--// Main Banner \\-->

            <!--// Footer \\-->
            <footer id="wm-footer" class="wm-footer-one">

                <!--// FooterNewsLatter \\-->
                <div class="wm-footer-newslatter">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <i class="wmicon-pen"></i>
                                <input type="text" readonly="readonly" style="width: 50%;" value="Please click on the button to start the application Form">
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
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></p>
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
                                    <h5><i class="fa fa-link"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-QuickLinks", "Quick Links") %></h5>
                                </div>
                                <ul>
                                    <li class="active"><a href="#home"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                    <li><a href="#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Colleges", "Colleges") %></a></li>
                                    <li><a href="#steps"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Steps", "Steps") %></a></li>
                                    <li><a href="#contactas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Contact", "Contact") %></a></li>
                                    <li><a href="#aboutas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-About", "About") %></a></li>
                                    <li><a href="StudentSubmitting.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a></li>
                                </ul>
                            </aside>
                            <aside class="widget widget_twitter col-md-3">
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-eye"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurVisionHead", "Our Vision") %></h5>
                                </div>
                                <ul>
                                    <li>
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurVisionDetail", "To become a preeminent educational institution locally, regionally, and internationally.") %></p>
                                    </li>
                                </ul>
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-paper-plane-o"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurMissionHead", "Our Mission") %></h5>
                                </div>
                                <ul>
                                    <li>
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurMissionDetail", "Effective education and training with active contribution to scientific research and community service.") %></p>
                                    </li>
                                </ul>
                            </aside>
                            <aside class="widget widget_archive col-md-4">
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-google-wallet"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurGoals", "Our Goals") %></h5>
                                </div>
                                <ol>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalOne", "Graduate competent professionals to meet the needs of the labor market.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalTwo", "Engage in community service.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalThree", "Conduct scientific research.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFour", "Provide competitive postgraduate programs.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFive", "Provide health care and promote health awareness to the public.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalSix", "Encourage lifelong learning through accredited continuous education programs.") %></li>
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
                                <span><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Copyright", "© Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy | All Rights Reserved") %></span>
                            </div>

                            <div class="col-md-4">
                                <p><a target="_blank" href="http://www.home.riyadh.edu.sa/"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-RiyadhElmUniversity", "Riyadh Elm University") %></a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// FooterCopyRight \\-->
                <!-- Page body start -->

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
                            <span class="wm-color"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-login", "Login") %></span>
                            <ul>
                                <li>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                                </li>
                                <li><a href="Pages/Auth/ResetPassword.aspx" class="wm-forgot-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-ForgotPassword", "Forgot Password?") %></a> </li>
                                <li>
                                    <asp:Button ID="LoginAcc" runat="server" Text="LogIn" />
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
                            <span class="wm-color"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-FindYourBachelors", "Find Your Bachelors") %></span>
                            <ul>
                                <li>
                                    <input type="text" placeholder="Bachelors..." id="keywordBachelors" runat="server" /></li>
                                <li>
                                    <asp:Button ID="SearchkeyWord" runat="server" Text="Button" /></li>
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
