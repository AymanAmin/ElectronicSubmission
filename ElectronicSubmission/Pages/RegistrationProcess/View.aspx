<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("RegistrationManagement-Title", "Registration Management") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Invoice card start -->
    <div class="row">
        <div class="col-sm-8">
            <div class="card">
                <div class="row invoice-contact">
                    <div class="col-md-8">
                        <div class="invoice-box row">
                            <div class="col-sm-12">
                                <table class="table table-responsive invoice-table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src="..\..\..\..\Theme\files\assets\images\favicon.ico" style="width: 30%" class="m-b-10" alt="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Compney Name</td>
                                        </tr>
                                        <tr>
                                            <td>123 6th St. Melbourne, FL 32904 West Chicago, IL 60185</td>
                                        </tr>
                                        <tr>
                                            <td><a href="..\..\..\cdn-cgi\l\email-protection.htm#99fdfcf4f6d9fef4f8f0f5b7faf6f4" target="_top"><span class="__cf_email__" data-cfemail="690d0c0406290e04080005470a0604">[email&#160;protected]</span></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>+91 919-91-91-919</td>
                                        </tr>
                                        <!-- <tr>
                                                            <td><a href="#" target="_blank">www.demo.com</a>
                                                            </td>
                                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <div class="card-block">
                    <div class="row invoive-info">
                        <div class="col-md-4 col-xs-12 invoice-client-info">
                            <h6>Client Information :</h6>
                            <h6 class="m-0">Josephin Villa</h6>
                            <p class="m-0 m-t-10">123 6th St. Melbourne, FL 32904 West Chicago, IL 60185</p>
                            <p class="m-0">(1234) - 567891</p>
                            <p><a href="..\..\..\cdn-cgi\l\email-protection.htm" class="__cf_email__" data-cfemail="eb8f8e8684ab939291c5888486">[email&#160;protected]</a></p>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h6>Order Information :</h6>
                            <table class="table table-responsive invoice-table invoice-order table-borderless">
                                <tbody>
                                    <tr>
                                        <th>Date :</th>
                                        <td>November 14</td>
                                    </tr>
                                    <tr>
                                        <th>Status :</th>
                                        <td>
                                            <span class="label label-warning">Pending</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Id :</th>
                                        <td>#145698
                                                                            </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h6 class="m-b-20">Invoice Number <span>#12398521473</span></h6>
                            <h6 class="text-uppercase text-primary">Total Due :
                                                                   
                        <span>$900.00</span>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="table-responsive">
                                <table class="table  invoice-detail-table">
                                    <thead>
                                        <tr class="thead-default">
                                            <th>File Name/Type</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                            <th>View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h6>File Type</h6>
                                                <p>File number 1 </p>
                                            </td>
                                            <td><a href="#" style="font-size:x-large;color:green;"> <i class="icofont icofont-ui-edit"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:red;"> <i class="icofont icofont-ui-delete"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:blue;"> <i class="icofont icofont-eye-alt"></i> </a></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h6>File Type</h6>
                                                <p>File number 2 </p>
                                            </td>
                                            <td><a href="#" style="font-size:x-large;color:green;"> <i class="icofont icofont-ui-edit"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:red;"> <i class="icofont icofont-ui-delete"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:blue;"> <i class="icofont icofont-eye-alt"></i> </a></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h6>File Type</h6>
                                                <p>File number 3 </p>
                                            </td>
                                            <td><a href="#" style="font-size:x-large;color:green;"> <i class="icofont icofont-ui-edit"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:red;"> <i class="icofont icofont-ui-delete"></i> </a></td>
                                            <td><a href="#" style="font-size:x-large;color:blue;"> <i class="icofont icofont-eye-alt"></i> </a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Invoice card end -->
        </div>
        <!-- Activity -->
        <div class="col-md-4">
            <div class="card latest-update-card ScrollStyle">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("MyNotifications-SequenceOfOperations", "Sequence Of Operations") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <!--<li><i class="fa fa fa-wrench open-card-option"></i></li>-->
                            <li><i class="fa fa-window-maximize full-card"></i></li>
                            <li><i class="fa fa-minus minimize-card"></i></li>
                            <li>
                                <asp:LinkButton ID="Refresh" runat="server" OnClick="Refresh_Click"><i class="fa fa-refresh reload-card"></i></asp:LinkButton></li>
                            <!--<li><i class="fa fa-trash close-card"></i></li>-->
                        </ul>
                    </div>
                </div>

                <div class="card-block user-activity-card feed-card">
                    <asp:Literal ID="Activity" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12"></div>
    </div>
    <div class="card">
        <div class="card-block">
            <div class="row text-center">
                <div class="col-sm-12 invoice-btn-group text-center">
                    <button type="button" class="btn btn-success btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20">Approve</button>
                    <button type="button" class="btn btn-danger waves-effect m-b-10 btn-sm waves-light">Reject</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
