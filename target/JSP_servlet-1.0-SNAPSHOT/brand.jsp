<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Brand</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="dist/css/dropdown1.css">
</head>
<body>
<div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left: 0px;">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link"  href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}" class="nav-link">Trang chủ</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/admin" class="nav-link">Thống kê</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a  class="nav-link">Hãng đồng hồ</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/watch" class="nav-link">Đồng hồ</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/user" class="nav-link">Khách hàng</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/accept" class="nav-link">Xác nhận đơn hàng</a>
            </li>
        </ul>
        <div class="dropdown navbar-nav ml-auto" >
            <button class="dropbtn" style="background-color: transparent; border: transparent;">
                <i class="fas fa-users-cog" style="color:#6c757d"></i>
            </button>
            <div class="dropdown-content">
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/admin">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-chart-bar"></i>
                    Thống kê
                </a>
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/user">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-users"></i>
                    Khách hàng
                </a>

                <a style="padding-left: 5px;" class="nav-link" href="">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    Hãng đồng hồ
                </a>

                <a style=" padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/watch">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    Đồng hồ
                </a>
                </hr>
                <a style=" padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/accept">
                    <i style="display:inline; padding-left: 28px;"class="fas fa-user-lock"></i>
                    Xác nhận đơn hàng
                </a>
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/logout">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-sign-out-alt"></i>
                    Đăng xuất
                </a>
            </div>
        </div>
        <!-- Right navbar links -->
    </nav>
    <div class="content-wrapper" style="margin-left: 0px;">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Hãng đồng hồ</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Hãng đồng hồ</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <section class="content" id="test1">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-5">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header" style="background-color: #17a2b8;">
                                <h3 class="card-title">Thêm hãng đồng hồ</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form style="height: 300px;" id="addform" method="post" onsubmit="return false">
                                <div class="card-body" style="margin-top: 60px;">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Tên hãng</label>
                                        <input type="text" name="Name" class="form-control" id="TOWName3" placeholder="Tên hãng đồng hồ" required >
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer" style="margin-top: 53px;">
                                    <button class="btn btn-primary" id="add" style="background-color: #17a2b8;">Thêm</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- List -->
                    <div class="col-md-7">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Danh sách loại đồng hồ</h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="Search" onkeyup="Load1()"  id="Search" class="form-control float-right" placeholder="Tìm kiếm">

                                        <div class="input-group-append">
                                            <button onclick="Search1()" class="btn btn-default">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0" style="height: 300px;">
                                <table class="table table-head-fixed text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>Mã Loại</th>
                                        <th>Tên Loại</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody id="row">

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- List -->

                </div>
            </div>
        </section>
        <div class="form-popup" id="myForm" style="width: 500px;display: none;margin-left:520px;">
            <!-- general form elements -->
            <div class="card card-primary">
                <div class="card-header" style="background-color: #17a2b8;">
                    <button style="background-color: transparent; border: transparent;margin-left: 313px;" onclick="closeForm()">
                        <i class="fas fa-times" style="color:tomato;"></i>
                    </button>
                    <h3 class="card-title">Sửa loại đồng hồ</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form style="height: 300px;" id="formup" method="post" onsubmit="return false">

                    <div class="card-body" style="margin-top: 30px;" id="row1">
                        <div id="error">
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" id="uppdate" class="btn btn-primary" style="background-color: #17a2b8;">Sửa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="main-footer">
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.1.0
        </div>
    </footer>

</div>
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<script src="operation/brand.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
</body>
</html>