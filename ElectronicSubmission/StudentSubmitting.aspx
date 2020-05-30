<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSubmitting.aspx.cs" Inherits="ElectronicSubmission.StudentSubmitting" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>REU - Student Submitting</title>


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
    <link href="Template/css/icofont/css/icofont.css" rel="stylesheet">
      <!-- ico font -->
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
    <style>
        .form-control {
            height: 43px !important;
            border: 2px solid #eaeaea !important;
            font-size: 15px !important;
            color: black !important;
            padding: 7px 20px !important;
            background-color: #ffffff !important;
            font-style: italic !important;
        }
    </style>
</head>
<body >

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
                       
                        </div>
                    </div>
                </div>
            </div>
            <!--// Mini Header \\-->



            <!--// Main Content \\-->
            <div class="wm-main-content ">

                <!--// Main Section \\-->
                <div class="wm-main-section" >
                    <div class="container" >
                        <form id="form1" runat="server">
                                   <div class="card-block">
                            <!-- Start Student Form-->

                            <!-- Start Profile-->
                            <div class="row users-card">
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card" style="max-width:165px">
                                        <div class="card-block">
                                            <div class="img-hover">
                                                <asp:Image ID="Stu_Profile" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/Profile/Profile.jpg"  />
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                        <asp:FileUpload ID="stuProfile" runat="server" class="form-control"  />
                                                    </span>
                                                </div>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Profile image" ValidationGroup="valFormGroup" ControlToValidate="stuProfile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                </div>
                            </div>
                            <!-- End Profile-->

                            <div class="row">
                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentName", "Student Arabic Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="StudentNameAr" runat="server" class="form-control"  placeholder="Enter Student Name"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Arabic Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameAr" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentName", "Student English Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="StudentNameEn" runat="server" class="form-control" placeholder="Enter Student Name"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student English Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameEn" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                           </div>

                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentPhone", "Student Phone") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                        <asp:TextBox ID="StudentPhone" runat="server" class="form-control" placeholder="Enter Student Phone" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Phone" ValidationGroup="valFormGroup" ControlToValidate="StudentPhone" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEmail", "Student Email") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                        <asp:TextBox ID="StudentEmail" runat="server" class="form-control" placeholder="Enter Student Email" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Email" ValidationGroup="valFormGroup" ControlToValidate="StudentEmail" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                 <div class="form-group col-sm-4">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentSSN", "Student SSN") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                                        <asp:TextBox ID="Student_SSN" runat="server" class="form-control" placeholder="Enter Student SSN"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student SSN" ValidationGroup="valFormGroup" ControlToValidate="Student_SSN" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                   <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Add StudentSSNAttachments", "Add Student SSN Attachments") %></label>
                                    <asp:FileUpload ID="StudentSSNFile" runat="server" class="form-control" AllowMultiple="True" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Student SSN Attachments" ValidationGroup="valFormGroup" ControlToValidate="StudentSSNFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                              </div>

                             <div class="row">
                                <div class="form-group col-sm-12">
                                       <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentAddress", "Student Address") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-address-book"></i></span>
                                        <asp:TextBox ID="Address" runat="server" class="form-control" placeholder="Enter Student Address"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Address" ValidationGroup="valFormGroup" ControlToValidate="Address" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                    
                                <div class="form-group col-sm-4">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Specialization", "Specialization") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                                        <asp:DropDownList ID="Specialization_ID" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="valSpecialization" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Specialization" ValidationGroup="valFormGroup" ControlToValidate="Specialization_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group col-sm-4">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Resource", "Resource") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-stock-mobile"></i></span>
                                        <asp:DropDownList ID="Resource_ID" class="form-control" runat="server" >
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="valResource" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Resource" ValidationGroup="valFormGroup" ControlToValidate="Resource_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group col-sm-4">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Nationality", "Nationality") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                                        <asp:DropDownList ID="Nationality_ID" class="form-control" runat="server" >
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="valNationalityID" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Nationality" ValidationGroup="valFormGroup" ControlToValidate="Nationality_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                             <div class="row">
                                <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-HighSchoolDegree", "High School Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                        <asp:TextBox ID="HighSchoolDegree" runat="server" class="form-control" placeholder="Enter Student High School Degree"></asp:TextBox>
                                    </div>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student High School Degree" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddHighSchoolDegreeAttachments", "Add High School Degree Attachments") %></label>
                                    <asp:FileUpload ID="HighSchoolDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add High School Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDegreeFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                           <div class="row">
                                <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-CapabilitiesDegree", "Capabilities Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                        <asp:TextBox ID="CapabilitiesDegree" runat="server" class="form-control" placeholder="Enter Student Capabilities Degree"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Capabilities Degree" ValidationGroup="valFormGroup" ControlToValidate="CapabilitiesDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddCapabilitiesDegreeFileAttachments", "Add Capabilities Degree File Attachments") %></label>
                                    <asp:FileUpload ID="CapabilitiesDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Capabilities Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="CapabilitiesDegreeFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div> 
                
                           <div class="row">
                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-MyAchievementDegree", "My Achievement Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                        <asp:TextBox ID="MyAchievementDegree" runat="server" class="form-control" placeholder="Enter Student My Achievement Degree"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter My Achievement Degree" ValidationGroup="valFormGroup" ControlToValidate="MyAchievementDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                 <div class="form-group col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddMyAchievementDegreeAttachments", "Add My Achievement Degree Attachments") %></label>
                                    <asp:FileUpload ID="MyAchievementDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add My Achievement Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="MyAchievementDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                            </div>
  

                            <div class="form-group col-sm-12 text-right">
                                <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="Save_Click" />
                            </div>
                            <!-- End Student Form-->
                        </div>
                      </form>
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
                            <form>
                                <i class="wmicon-pen"></i>
                                <input type="text" readonly="readonly"  style="width: 50%;" value="Please click on the button to start the application process" onblur="if(this.value == 'Please click on the button to start the application process') { this.value ='Please click on the button to start the application process'; }" onfocus="if(this.value =='Please click on the button to start the application process') { this.value = 'Please click on the button to start the application process'; }">
                                <input type="submit" value="Submission Form Request">
                            </form>
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


