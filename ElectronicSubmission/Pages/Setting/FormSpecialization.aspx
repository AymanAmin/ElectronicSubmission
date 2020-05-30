﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="FormSpecialization.aspx.cs" Inherits="ElectronicSubmission.Pages.Setting.FormSpecialization" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-Title", "REU - Specialization") %></title>
    <!-- ckeditor.css-->
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\css\samples.css" />
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\toolbarconfigurator/lib/codemirror/neo.css" />
    <script type="text/javascript">

        function showmodel(x) {
                $.ajax({
                    url: "FormSpecialization.aspx/ViewUserCard",
                    type: "POST",
                    data: "{ AjaxSpecialization_Id:" + x.id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resultData) {
                        var Emp = JSON.parse(resultData.d);
                        $('#Body_Holder_SpecId').val(Emp.Specialization_Id);
                        $('#Body_Holder_Specialization_Name_Ar').val(Emp.Specialization_Name_Ar);
                        $('#Body_Holder_Specialization_Name_En').val(Emp.Specialization_Name_En);
                        $('#Body_Holder_Collage_Id').val(Emp.Collage_Id).trigger('change');
                        $('#Body_Holder_Specialization_Icon').val(Emp.Specialization_Icon);
                        $('#Body_Holder_High_School_Percent').val(Emp.High_School_Percent);
                        $('#Body_Holder_Capabilities_Percent').val(Emp.Capabilities_Percent);
                        $('#Body_Holder_My_Achievement_Percent').val(Emp.My_Achievement_Percent);
                        $('#Body_Holder_Weighted_Ratio_Percent').val(Emp.Weighted_Ratio_Percent);
                        $('#Body_Holder_Specialization_Description_Ar').val(Emp.Specialization_Description_Ar);
                        $('#Body_Holder_Specialization_Description_En').val(Emp.Specialization_Description_En);
                        //$('#Body_Holder_speech').setData(Emp.Condition_Ar);
                        //$('#Body_Holder_Minutes').setData(Emp.Condition_En);
                        CKEDITOR.instances['Body_Holder_speech'].setData(Emp.Condition_Ar);
                        CKEDITOR.instances['Body_Holder_Minutes'].setData(Emp.Condition_En);
                        if (Emp.Specialization_Image == "" || Emp.Specialization_Image == null) {
                            var Profile = "..\/..\/..\/..\/Template\/extra-images\/blue-and-silver.jpg";
                        } else {
                            var Profile = "..\/..\/..\/..\/Template\/extra-images\/" + Emp.Employee_Profile;
                        }
                        //$('#Body_Holder_addAttachments1').attr('src', Profile);
                    }
                });
            } else {
                $('#Body_Holder_SpecId').val(0);
                $('#Body_Holder_Specialization_Name_Ar').val('');
                $('#Body_Holder_Specialization_Name_En').val('');
                $('#Body_Holder_Collage_Id').val('').trigger('change');
                $('#Body_Holder_Specialization_Icon').val('');
                $('#Body_Holder_High_School_Percent').val('');
                $('#Body_Holder_Capabilities_Percent').val('');
                $('#Body_Holder_My_Achievement_Percent').val('');
                $('#Body_Holder_Weighted_Ratio_Percent').val('');
                $('#Body_Holder_addAttachments1').val('');
                $('#Body_Holder_Specialization_Description_Ar').val('');
                $('#Body_Holder_Specialization_Description_En').val('');
                $('#Body_Holder_speech').val('');
                $('#Body_Holder_Minutes').val('');
                // $('#Body_Holder_Emp_Profile').attr('src', "..\/..\/..\/..\/Template\/extra-images\/blue-and-silver.jpg");
            }

            document.getElementById("AddEmp_show").click();
            // GetServiceInformation(x.id)
        }

        function DeleteEmplooye(x) {
            $.ajax({
                url: "FormSpecialization.aspx/DeleteEmplooye",
                type: "POST",
                data: "{ AjaxSpecialization_Id:" + x.id + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', '  Save Status : ', '  The Specialization was Sucessfully Deleted in system ! ');
                    window.location = window.location;
                }
            });
            //document.getElementById("AddEmp_show").click();
            // GetServiceInformation(x.id)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <input id="AddEmp_show" type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social" />
    <div class="page-body">
        <!-- Article Editor card start -->

        <div class="card">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <!-- Start Search Form-->
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-College", "College") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-tack-pin"></i></span>
                            <asp:DropDownList ID="CollegeF" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-7">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-Keyword", "Keyword") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-search"></i></span>
                            <asp:TextBox ID="Keyword" runat="server" class="form-control" placeholder="Search Specialization..." TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-2">
                        <label>.</label>
                        <div class="input-group">
                            <asp:Button ID="btnSearch" runat="server" AutoPostback="false" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
                <!-- End Search Form -->
            </div>
            <!-- Article Editor card end -->
        </div>

        <!------------------------------------------------------------------------------------------------- -->

        <!-- Article Editor card start -->
        <div class="card" runat="server">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <!-- Modal Employee start -->
                <div id="sign-in-social" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg m-t-0">
                        <div class="login-card card-block login-card-modal">
                            <div class="text-center">
                                <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                            </div>

                            <div class="card m-t-16">
                                <div class="auth-box card-block">
                                    <div class="row m-b-0">
                                        <div class="col-md-12">
                                            <h3 class="text-center txt-primary"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-Specialization", "Specialization") %></h3>
                                        </div>
                                    </div>
                                    <!-- Start Employee Form-->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-ArabicName", "Arabic Name") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="Specialization_Name_Ar" runat="server" class="form-control" placeholder="Enter Arabic Name" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RFVtxtSpecialization_Name_Ar" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Specialization_Name_Ar" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-EnglishName", "English Name") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="Specialization_Name_En" runat="server" class="form-control" placeholder="Enter English Name" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RFVtxtSpecialization_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Specialization_Name_En" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-College", "College") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-university"></i></span>
                                                <asp:DropDownList ID="Collage_Id" runat="server" class="form-control" DataTextField="Collage_Name_En" DataValueField="Collage_ID" DataSourceID="CollageEntityDataSource"></asp:DropDownList>
                                                <asp:EntityDataSource ID="CollageEntityDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableFlattening="False" EntitySetName="Collages">
                                                </asp:EntityDataSource>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Pesmission Group" ValidationGroup="Per" ControlToValidate="Collage_Id" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-Icon", "Icon") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-lens"></i></span>
                                                <asp:TextBox ID="Specialization_Icon" runat="server" class="form-control" placeholder="Enter Specialization Icon" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Specialization Icon" ValidationGroup="Per" ControlToValidate="Specialization_Icon" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-HighSchoolPercent", "High School Percente") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-abacus"></i></span>
                                                <asp:TextBox ID="High_School_Percent" runat="server" class="form-control" placeholder="Enter High School Percent" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter High School Percent" ValidationGroup="Per" ControlToValidate="High_School_Percent" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-CapabilitiesPercent", "Capabilities Percent") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-mathematical-alt-1"></i></span>
                                                <asp:TextBox ID="Capabilities_Percent" runat="server" class="form-control" placeholder="Enter Capabilities Percente" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Capabilities Percent" ValidationGroup="Per" ControlToValidate="Capabilities_Percent" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-MyAchievementPercent", "My Achievement Percent") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-square-root"></i></span>
                                                <asp:TextBox ID="My_Achievement_Percent" runat="server" class="form-control" placeholder="Enter My Achievement Percent" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter My Achievement Percent" ValidationGroup="Per" ControlToValidate="My_Achievement_Percent" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-WeightedRatioPercent", "Weighted Ratio Percent") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-ruler-compass-alt"></i></span>
                                                <asp:TextBox ID="Weighted_Ratio_Percent" runat="server" class="form-control" placeholder="Enter Weighted Ratio Percent" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Weighted Ratio Percent" ValidationGroup="Per" ControlToValidate="Weighted_Ratio_Percent" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- File upload card start -->
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("FormSpecialization-SpecializationImage", "Specialization Image") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-picture"></i></span>
                                                <asp:FileUpload ID="addAttachments1" runat="server" class="form-control" AllowMultiple="False" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- File upload card end -->
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("NewTreatment-SpecializationDescriptionArabic", "Specialization Description Arabic") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-ui-file"></i></span>
                                                <asp:TextBox ID="Specialization_Description_Ar" runat="server" placeholder="Enter Specialization Description Arabic" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="valSubjectTreatement" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Specialization Description Arabic" ValidationGroup="valFormGroup" ControlToValidate="Specialization_Description_Ar" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("NewTreatment-SpecializationDescriptionEnglish", "Specialization Description English") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-ui-file"></i></span>
                                                <asp:TextBox ID="Specialization_Description_En" runat="server" placeholder="Enter Specialization Description English" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Specialization Description English" ValidationGroup="valFormGroup" ControlToValidate="Specialization_Description_En" Display="Dynamic" CssClass="col-form-label"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("NewTreatment-ConditionArabic", "Condition Arabic") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-clip-board"></i></span>
                                                <asp:TextBox ID="speech" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("NewTreatment-ConditionEnglish", "Condition English") %></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-clip-board"></i></span>
                                                <asp:TextBox ID="Minutes" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label></label>
                                            <div class="col-md-12 text-center">
                                                <asp:HiddenField ID="SpecId" runat="server" />
                                                <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end of form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Employee end-->
                <!-- End Employee Form-->
                <span class="text-muted">
                    <asp:Literal ID="FilterUsed" runat="server"></asp:Literal></span>
                <div class="form-group col-sm-12" style="text-align: right;">
                    <button runat="server" id="AddEmp" type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social" onclick="showmodel(this)">Add Specialization</button>
                </div>
                <div class="row users-card" runat="server" id="UCard">
                </div>

            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->
    </div>
    <!-- ckeditor.css-->
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>
</asp:Content>