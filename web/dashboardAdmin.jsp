<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 2:20:15 AM
    Author     : kienb
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
        <meta name='robots' content='noindex,nofolow' />
        <meta name="_token" content="ad0BOalbGjFaYLL4hTEY4texgMXBD7KaiapWPxwP">

        <link rel="stylesheet" href="assets/css/style1.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <link rel="stylesheet" href="assets/css/style3.css">
        <link rel="stylesheet" href="assets/css/style4.css">
        <link rel="stylesheet" href="assets/css/style5.css">
        <link rel="stylesheet" href="assets/css/style6.css">
        <link rel="stylesheet" href="assets/css/style7.css">
        <link rel="stylesheet" href="assets/css/style8.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <style>
            .gender-label {
                display: inline-block;
                margin-right: 40px;
            }
        </style>
        <title>Cập nhật thông tin cá nhân</title>
    </head>

    <body class="desktop dashboard quan-ly cap-nhat-thong-tin-ca-nhan">
        <div id="webpage">
            <jsp:include page="header_sidebar.jsp"></jsp:include>
                <div class="container-fluid">
                    <div class="row">
                    <jsp:include page="sidebar.jsp"></jsp:include>
                        <main role="main" class="ml-sm-auto col-lg-10">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="homeController">House Rental System</a></li>
                                    <li class="breadcrumb-item"><a href="">Quản lý</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Thống kê</li>
                                </ol>
                            </nav>
                            <div
                                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                                <h1 class="h2">Thống kê</h1>
                            </div>


                            <!-- Dashboard Products wrapper -->
                            <div class="p-4" style="margin-bottom: 42px;">

                                <!-- Content Row -->
                                <div class="row"
                                    <!-- Earnings (Monthly) Card Example -->
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <div class="card shadow h-100 py-2">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                            Doanh thu (tháng)</div>
                                                        <div class="h5 mb-0 font-weight-bold text-gray-800">4,050,000d</div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Earnings (Monthly) Card Example -->
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-success shadow h-100 py-2">
                                            <div class="card-body">
                                                <div class="row no-gutsters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                            Sản phẩm bán chạy nhất tháng</div>
                                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${max.name}</div>
                                                    <p>Số lượng: ${maxQuantity}</p>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-info shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Sản phẩm bán ít nhất tháng
                                                    </div>
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${min.name}</div>
                                                        </div>
                                                        <p>Số lượng: ${minQuantity}</p>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-info shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Sản phẩm bán ít nhất tháng
                                                    </div>
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${min.name}</div>
                                                        </div>
                                                        <p>Số lượng: ${minQuantity}</p>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Content Row -->

                                <div class="row">
                                    <!-- Area Chart -->
                                    <div class="col-xl-8 col-lg-7">
                                        <div class="card shadow" style="height: 100%;">
                                            <!-- Card Header - Dropdown -->
                                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                            </div>
                                            <!-- Card Body -->
                                            <div class="card-body">
                                                <div class="chart-area" style="height: 100%;">
                                                    <canvas id="myAreaChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Pie Chart -->
                                    <div class="col-xl-4 col-lg-5">
                                        <div class="card shadow">
                                            <!-- Card Header - Dropdown -->
                                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                            </div>
                                            <!-- Card Body -->
                                            <div class="card-body">
                                                <div class="chart-pie pt-4 pb-2">
                                                    <canvas id="myPieChart"></canvas>
                                                </div>
                                                <div class="mt-4 text-center small">
                                                    <span class="mr-2">
                                                        <i class="fas fa-circle text-primary"></i> Direct
                                                    </span>
                                                    <span class="mr-2">
                                                        <i class="fas fa-circle text-success"></i> Social
                                                    </span>
                                                    <span class="mr-2">
                                                        <i class="fas fa-circle text-info"></i> Referral
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </section>

                            <br><br>
                            <section class="section section-support">
                                <div class="section-content clearfix">
                                    <div class="support-bg"></div>
                                    <div class="list-support clearfix">
                                        <div class="list-support-title">Liên hệ với chúng tôi nếu bạn cần hỗ trợ:</div>
                                        <div class="support-item">
                                            <span class="support-item-title">Hỗ trợ đăng tin</span>
                                            <a rel="nofollow" href="tel:0902657123">Điện thoại: 0902657123</a>
                                            <a rel="nofollow" target="_blank" href="https://zalo.me/0902657123">Zalo:
                                                0902657123</a>
                                        </div>
                                        <div class="support-item">
                                            <span class="support-item-title">Hỗ trợ đăng tin</span>
                                            <a rel="nofollow" href="tel:0901424123">Điện thoại: 0901424123</a>
                                            <a rel="nofollow" target="_blank" href="https://zalo.me/0901424123">Zalo:
                                                0901424123</a>
                                        </div>
                                        <div class="support-item">
                                            <span class="support-item-title">Hỗ trợ đăng tin</span>
                                            <a rel="nofollow" href="tel:0981504039">Điện thoại: 0981504039</a>
                                            <a rel="nofollow" target="_blank" href="https://zalo.me/0981504039">Zalo:
                                                0981504039</a>
                                        </div>
                                        <div class="support-item">
                                            <span class="support-item-title">Phản ánh/khiếu nại</span>
                                            <a rel="nofollow" href="tel:0917686101">Điện thoại: 0917686101</a>
                                            <a rel="nofollow" target="_blank" href="https://zalo.me/0917686101">Zalo:
                                                0917686101</a>
                                        </div>
                                        <a class="btn btn-page-contact" rel="nofollow" href="/lien-he">Gửi liên hệ</a>
                                    </div>
                                </div>
                                </main>
                        </div>
                </div>
            </div>
            <script src="/js/main-dashboard.min.js?v=20230606"></script>
            <!-- Icons -->
            <script src="/js/3rd/feather.min.js"></script>
            <script>feather.replace();</script>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script>
                // Area Chart Example
                var ctx = document.getElementById("myAreaChart");
                var myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Earnings",
                                lineTension: 0.3,
                                backgroundColor: "rgba(78, 115, 223, 0.05)",
                                borderColor: "rgba(78, 115, 223, 1)",
                                pointRadius: 3,
                                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                                pointBorderColor: "rgba(78, 115, 223, 1)",
                                pointHoverRadius: 3,
                                pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                                pointHitRadius: 10,
                                pointBorderWidth: 2,
                                data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
                            }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        layout: {
                            padding: {
                                left: 10,
                                right: 25,
                                top: 25,
                                bottom: 0
                            }
                        },
                        scales: {
                            xAxes: [{
                                    time: {
                                        unit: 'date'
                                    },
                                    gridLines: {
                                        display: false,
                                        drawBorder: false
                                    },
                                    ticks: {
                                        maxTicksLimit: 7
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        maxTicksLimit: 5,
                                        padding: 10,
                                        // Include a dollar sign in the ticks
                                        callback: function (value, index, values) {
                                            return '$' + number_format(value);
                                        }
                                    },
                                    gridLines: {
                                        color: "rgb(234, 236, 244)",
                                        zeroLineColor: "rgb(234, 236, 244)",
                                        drawBorder: false,
                                        borderDash: [2],
                                        zeroLineBorderDash: [2]
                                    }
                                }],
                        },
                        legend: {
                            display: false
                        },
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            titleMarginBottom: 10,
                            titleFontColor: '#6e707e',
                            titleFontSize: 14,
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            intersect: false,
                            mode: 'index',
                            caretPadding: 10,
                            callbacks: {
                                label: function (tooltipItem, chart) {
                                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                    return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                                }
                            }
                        }
                    }
                });
            </script>

            <script>
                // Pie Chart Example
                var ctx = document.getElementById("myPieChart");
                var myPieChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ["Direct", "Referral", "Social"],
                        datasets: [{
                                data: [55, 30, 15],
                                backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                                hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                                hoverBorderColor: "rgba(234, 236, 244, 1)",
                            }],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: '#dddfeb',
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 80,
                    },
                });

            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
            <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
