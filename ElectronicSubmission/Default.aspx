<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ElectronicSubmission.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Default-Title", "ECMS - DashBoard") %></title>
    <script>
        function Pie_Chart(Data, Names) {
            var options = {
                series: Data,
                chart: {
                    width: 380,
                    type: 'pie',
                },
                labels: Names,
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        }

        function lineChart(Data, Status) {
            alert();
            var options = {
                series: [{
                    name: "Desktops",
                    data: Data
                }],
                chart: {
                    height: 350,
                    type: 'line',
                    zoom: {
                        enabled: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'straight'
                },
                title: {
                    text: '<% = ElectronicSubmission.FieldNames.getFieldName("Default-DelayPerStatus", "Delay Per Status") %>',
                    align: 'left'
                },
                grid: {
                    row: {
                        colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                        opacity: 0.5
                    },
                },
                xaxis: {
                    categories: Status,
                }
            };

            var chart = new ApexCharts(document.querySelector("#Linechart"), options);
            chart.render();

        }

        function Pie_ChartColumn(Total, Recived, Sent, categories) {
            var options = {
                series: [{
                    name: '<% = ElectronicSubmission.FieldNames.getFieldName("Default-Total", "Total") %>',
                    data: Total
                }, {
                    name: '<% = ElectronicSubmission.FieldNames.getFieldName("Default-Recived", "Recived") %>',
                    data: Recived
                }, {
                    name: '<% = ElectronicSubmission.FieldNames.getFieldName("Default-Sent", "Sent") %>',
                    data: Sent
                }],
                chart: {
                    type: 'bar',
                    height: 350
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                    },
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    show: true,
                    width: 2,
                    colors: ['transparent']
                },
                xaxis: {
                    categories: categories,
                },
                yaxis: {
                    title: {
                        text: '# (<% = ElectronicSubmission.FieldNames.getFieldName("Default-Treatment", "Treatment") %>)'
                    }
                },
                fill: {
                    opacity: 1
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "# " + val + " <% = ElectronicSubmission.FieldNames.getFieldName("Default-Treatment", "Treatment") %>"
                        }
                    }
                }
            };

            var chart = new ApexCharts(document.querySelector("#chart_Column"), options);
            chart.render();
        }

        setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1);

    </script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="row">
        <!-- treatment status, page counter  start -->
        <div class="col-xl-3 col-md-6">
            <a href="../../../Pages/Treatment/Inbox.aspx#e-inbox">
                <div class="card bg-c-yellow update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtAllStudents" Text="0" runat="server"></asp:Literal></h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-AllStudents", "All Student") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-1" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateOne" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="../../../Pages/Treatment/Inbox.aspx#e-inbox">
                <div class="card bg-c-green update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtInProgress" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-InProgress", "In Progress") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-2" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateTwo" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="../../../Pages/Treatment/Inbox.aspx#e-send">
                <div class="card bg-c-lite-green update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtSuccessfully" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-Successfully", "Successfully") %> </h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-3" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateThree" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-xl-3 col-md-6">
            <a href="#">
                <div class="card bg-c-pink update-card">
                    <div class="card-block">
                        <div class="row align-items-end">
                            <div class="col-8">
                                <h4 class="text-white">
                                    <asp:Literal ID="txtFailure" Text="0" runat="server"></asp:Literal>
                                </h4>
                                <h6 class="text-white m-b-0"><% = ElectronicSubmission.FieldNames.getFieldName("Default-txtFailure", "Failure") %></h6>
                            </div>
                            <div class="col-4 text-right">
                                <canvas id="update-chart-4" height="50"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="text-white m-b-0">
                            <i class="feather icon-clock text-white f-14 m-r-10"></i>
                            <asp:Literal ID="txtLastUpdateFour" Text="update : 2:15 am" runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <!-- treatment status, page counter  end -->
    </div>

    <div class="row">
        <!-- Chart start -->
         <div class="col-xl-12 col-md-12">
            <div class="card">
                <div class="card-header">
                   
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="Linechart" style="width: 100%;"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-7 col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-TreatmentPerMounths", "Treatment Per Mounths") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="chart_Column" style="width: 100%;"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-5 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("Default-TreatmentPerStatus", "Treatment Per Status") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather icon-maximize full-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block">
                    <div id="chart" style="width:100%;"></div>
                </div>

            </div>
        </div>

       
    </div>

</asp:Content>
