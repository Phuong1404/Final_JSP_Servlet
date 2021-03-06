<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10/27/2021
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đổi mật khẩu</title>

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
                <a class="nav-link"  role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}" class="nav-link">Trang chủ</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/cart" class="nav-link">Giỏ hàng</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/history" class="nav-link">Lịch sử mua hàng</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/infoadmin" class="nav-link">Thông tài khoản</a>
            </li>
        </ul>
        <div class="dropdown navbar-nav ml-auto" >
            <button class="dropbtn" style="background-color: transparent; border: transparent;">
                <i class="fas fa-users-cog" style="color:#6c757d"></i>
            </button>
            <div class="dropdown-content">
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/cart">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-chart-bar"></i>
                    Giỏ hàng
                </a>
                <a style="padding-left: 5px;" href="${pageContext.request.contextPath}/history" class="nav-link" >
                    <i style="display:inline; padding-left: 28px;" class="fas fa-users"></i>
                    Lịch sử mua hàng
                </a>
                </hr>
                <a style=" padding-left: 5px;" href="${pageContext.request.contextPath}/infoadmin" class="nav-link" >
                    <i style="display:inline; padding-left: 28px;"class="fas fa-user-lock"></i>
                    Thông tin tài khoản
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
                        <h1 class="m-0">Đổi mật khẩu </h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Đổi mật khẩu</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <section class="content">
            <div class="container-fluid" style="padding-right: 400px;padding-left: 400px;padding-top: 20px;">
                <!-- left column -->
                <div class="card card-primary">
                    <div class="card-header" style="background-color: #17a2b8;">
                        <h3 class="card-title">Đổi mật khẩu</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form method="post" onsubmit="return false">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Mật khẩu cũ</label>
                                <input type="password" class="form-control" id="old" placeholder="Mật khẩu cũ">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mật khẩu mới</label>
                                <input type="password" class="form-control" id="pass1" placeholder="Mật khẩu mới">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Nhập lại mật khẩu mới</label>
                                <input type="password" class="form-control" id="pass2" placeholder="Nhập lại mật khẩu mới">
                            </div>
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary" id="add" style="background-color: #17a2b8;">Đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<script src="operation/changepass.js"></script>
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