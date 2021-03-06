﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="ElectronicSubmission.Pages.Treatment.Employees" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Title", "User Management - Employee") %></title>

    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var deleteEmp = 0;
        function showmodel(x) {
           // debugger;
            if (!isNaN(x.id)){
            $.ajax({
                url: "Employees.aspx/ViewUserCard",
                type: "POST",
                data: "{ Employee_Id:"+x.id+"}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    var Emp = JSON.parse(resultData.d);
                    $('#Body_Holder_EmpID').val(Emp.Employee_Id);
                    $('#Body_Holder_Employee_Name_Ar').val(Emp.Employee_Name_Ar);
                    $('#Body_Holder_Employee_Name_En').val(Emp.Employee_Name_En);
                    $('#Body_Holder_Employee_Email').val(Emp.Employee_Email);
                    $('#Body_Holder_Employee_Phone').val(Emp.Employee_Phone);
                    $('#Body_Holder_Groups').val(Emp.Group_Id).trigger('change');
                    $('#Body_Holder_Language').val(Emp.Language_id).trigger('change'); 
                    $('input[id=Body_Holder_Active]').prop('checked', Emp.Employee_Active);
                    
                    if (Emp.Employee_Profile == "" || Emp.Employee_Profile == null) {
                        var Profile = "..\/..\/..\/..\/media\/Profile\/Profile.jpg";
                    } else {
                        var Profile = "..\/..\/..\/..\/media\/Profile\/" + Emp.Employee_Profile;
                    }

                    $('#Body_Holder_Emp_Profile').attr('src', Profile);
                    }
                });
            } else {
                $('#Body_Holder_EmpID').val(0);
                $('#Body_Holder_Employee_Name_Ar').val('');
                $('#Body_Holder_Employee_Name_En').val('');
                $('#Body_Holder_Employee_Email').val('');
                $('#Body_Holder_Employee_Phone').val('');
                $('#Body_Holder_Groups').val('').trigger('change');
                $('#Body_Holder_Language').val('').trigger('change');
                $('input[id=Body_Holder_Active]').prop('checked', true);
                $('#Body_Holder_Emp_Profile').attr('src', "..\/..\/..\/..\/media\/Profile\/Profile.jpg");
            }

            document.getElementById("AddEmp_show").click(); 
           // GetServiceInformation(x.id)
        }


        function DeleteEmplooye(x) {
            $.ajax({
                url: "Employees.aspx/DeleteEmplooye",
                type: "POST",
                data: "{ Employee_Id:" + x + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (resultData) {
                    var Emp = JSON.parse(resultData.d);
                    if (Emp == "1") {
                        if ($("html").attr("dir") == "rtl")
                            notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', 'حالة الحفظ : ', '  تم حذف الموظف بنجاح في النظام ');
                        else notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight', '  Save Status : ', '  The Employee was Sucessfully Deleted in system ! ');
                    }
                    else {
                        if ($("html").attr("dir") == "rtl")
                            notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight', 'حالة الحفظ: ', 'حدث خطأ  ');
                        else notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight', 'Save Status: ', 'Error  ');
                    }
                    window.location = window.location;
                }
            });
            //document.getElementById("AddEmp_show").click();
            // GetServiceInformation(x.id)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

     <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <% = ElectronicSubmission.FieldNames.getFieldName("Employees-DeleteHeader", "Delete Specialization") %>
                </div>
                <div class="modal-body">
                    <% = ElectronicSubmission.FieldNames.getFieldName("Employees-DeleteMessage", "Are you sure you want to delete this Specialization?") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><% = ElectronicSubmission.FieldNames.getFieldName("View-Cancel", "Cancel") %></button>
                    <a class="btn btn-danger btn-ok"  style="color:white;"><% = ElectronicSubmission.FieldNames.getFieldName("View-Delete", "Delete") %></a>
                </div>
            </div>
        </div>
    </div>

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
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Group", "Group") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                            <asp:DropDownList ID="GroupF" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Language", "Language") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                            <asp:DropDownList ID="LanguageF" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Active", "Active") %></label>
                        <div class="input-group">
                                <input id="ActiveF" runat="server" type="checkbox"  name="Active" class="js-single" checked="checked"/> 
                        </div>
                    </div>
                   
                </div>
                <hr />
                <div class="row">
                    <div class="form-group col-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-search"></i></span>
                            <asp:TextBox ID="Keyword" runat="server" class="form-control" placeholder="Name or Email or Phone..." TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-2 text-right">
                        <asp:Button ID="btnSearch" runat="server" AutoPostback = "false" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click"  />
                    </div>
                </div>

                <!-- End Search Form -->
            </div>
            <!-- Article Editor card end -->
        </div>

        <!------------------------------------------------------------------------------------------------- -->

         <!-- Article Editor card start -->
        <div class="card"  runat="server">
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
            <div class="modal-dialog" style="max-width: 700px">
                <div class="login-card card-block login-card-modal">
                    <div class="text-center">
                        <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png">
                    </div>

                    <div class="card m-t-16">
                        <div class="auth-box card-block">
                            <div class="row m-b-0">
                                <div class="col-md-12">
                                    <h3 class="text-center txt-primary"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Employee", "Employee") %></h3>
                                </div>
                            </div>
                            <!-- Start Employee Form-->
                            <div class="row users-card">
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                    <div class="card rounded-card user-card">
                                        <div class="card-block">
                                            <div class="img-hover">
                                                <asp:Image ID="Emp_Profile" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/Profile/Profile.jpg"  />
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                        <asp:FileUpload ID="EmpProfile" runat="server" class="form-control"  />
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-4 col-md-6">
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-ArabicName", "Arabic Name") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_Ar" runat="server" class="form-control" placeholder="Enter Arabic Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="Employee_Name_ArValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Arabic Name" ValidationGroup="Per" ControlToValidate="Employee_Name_Ar" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-EnglishName", "English Name") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                        <asp:TextBox ID="Employee_Name_En" runat="server" class="form-control" placeholder="Enter English Name" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="Employee_Name_EnValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="Per" ControlToValidate="Employee_Name_En" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Email", "Email") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                        <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="Employee_EmailValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Email" ValidationGroup="Per" ControlToValidate="Employee_Email" Display="Dynamic" SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Phone", "Phone") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                        <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="Employee_PhoneValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Phone" ValidationGroup="Per" ControlToValidate="Employee_Phone" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-sm-6">
                                    <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Group", "Group") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-group"></i></span>
                                        <asp:DropDownList ID="Groups" runat="server" class="form-control" DataTextField="Group_Name_En" DataValueField="Group_Id" DataSourceID="GroupDataSource" ></asp:DropDownList>
                                        <asp:EntityDataSource ID="GroupDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableFlattening="False" EntitySetName="Groups">
                                        </asp:EntityDataSource>
                                    </div>
                                    <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="GroupsValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Pesmission Group" ValidationGroup="Per" ControlToValidate="Groups" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Language", "Language") %></label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icofont icofont-chart-flow-alt-1"></i></span>
                                         <asp:DropDownList ID="Language" runat="server" class="form-control" DataSourceID="LangDataSource" DataTextField="Language_Name" DataValueField="ID"  ></asp:DropDownList>
                                        <asp:EntityDataSource ID="LangDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableFlattening="False" EntitySetName="LanguageMasters" EntityTypeFilter="LanguageMaster">
                                        </asp:EntityDataSource>
                                    </div>
                                     <div class="col-sm-12">
                                        <asp:RequiredFieldValidator ID="LanguageValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Language" ValidationGroup="Per" ControlToValidate="Language" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="col-sm-6">                                         
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("Employees-Active", "Active") %> </label>
                                       <div class="input-group">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input id="Active" runat="server" type="checkbox"  name="Active"/>
                                                <span class="cr">
                                                    <i class="cr-icon icofont icofont-ui-check txt-primary"></i>
                                                </span>
                                             </label>
                                         </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label></label>
                                    <div class="col-md-12">
                                        <asp:HiddenField ID="EmpID" runat="server" />
                                        <asp:Button  ID="Save"  runat="server" Text="Save" class="btn btn-primary" ValidationGroup="Per" OnClick="Save_Click"  />
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
               <span class="text-muted"><asp:Literal ID="FilterUsed" runat="server"></asp:Literal></span>
              <div class="form-group col-sm-12" style="text-align: right;">
                <button runat="server" id="AddEmp" type="button" class="btn btn-primary" data-toggle="modal" data-target="#sign-in-social" OnClick="showmodel(this)">Add Employees</button>
            </div>
             <div class="row users-card" runat="server" id="UCard" style="display: inline-flex;">
              
            </div>
        
          </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->
    </div>

      <script>
          $('#confirm-delete').on('show.bs.modal', function (e) {
              deleteEmp = $(e.relatedTarget).data('href');
          });
          $('.btn-ok').on('click', function (event) {
              DeleteEmplooye(deleteEmp);
          });
    </script>
</asp:Content>
