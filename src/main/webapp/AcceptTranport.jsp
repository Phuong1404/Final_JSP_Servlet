<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/26/2021
  Time: 7:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Accept</title>

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
                <a href="${pageContext.request.contextPath}" class="nav-link">Trang ch???</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/admin" class="nav-link">Th???ng k??</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/brand" class="nav-link">H??ng ?????ng h???</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/watch" class="nav-link">?????ng h???</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="${pageContext.request.contextPath}/user" class="nav-link">Kh??ch h??ng</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="" class="nav-link">X??c nh???n ????n h??ng</a>
            </li>
        </ul>
        <div class="dropdown navbar-nav ml-auto" >
            <button class="dropbtn" style="background-color: transparent; border: transparent;">
                <i class="fas fa-users-cog" style="color:#6c757d"></i>
            </button>
            <div class="dropdown-content">
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/admin">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-chart-bar"></i>
                    Th???ng k??
                </a>
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/user">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-users"></i>
                    Kh??ch h??ng
                </a>

                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/brand">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    H??ng ?????ng h???
                </a>

                <a style=" padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/watch">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    ?????ng h???
                </a>
                </hr>
                <a style=" padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/infoadmin">
                    <i style="display:inline; padding-left: 28px;"class="fas fa-user-lock"></i>
                    X??c nh???n ????n h??ng
                </a>
                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/logout">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-sign-out-alt"></i>
                    ????ng xu???t
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
                        <h1 class="m-0">X??c nh???n ????n h??ng</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang ch???</a></li>
                            <li class="breadcrumb-item active">X??c nh???n ????n h??ng</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <section class="content" id="test1">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <!-- List -->
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">????n h??ng c???n x??c nh???n</h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" id="Search" class="form-control float-right" placeholder="T??m ki???m">

                                        <div class="input-group-append">
                                            <button class="btn btn-default">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0" style="height: 450px;">
                                <table class="table table-head-fixed text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>M?? ????n h??ng</th>
                                        <th>Kh??ch h??ng</th>
                                        <th>?????a ch???</th>
                                        <th>S??? ??i???n tho???i</th>
                                        <th>V???n chuy???n</th>
                                        <th>T???ng</th>
                                        <th>Tr???ng th??i</th>
                                        <th>H??nh ?????ng</th>
                                    </tr>
                                    </thead>
                                    <tbody  id="row">

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
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
<!-- load Update -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
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
<script>
    //Load data
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "http://localhost:8082/JSP_servlet_war_exploded/loadaccept", //T??n servlet
            success:function (result){
                var row=document.getElementById("row")
                row.innerHTML=""
                row.innerHTML+=result
            }
        })
    })
    function Update(data)
    {
        $.ajax({
            type: "POST",
            url: "http://localhost:8082/JSP_servlet_war_exploded/accept", //T??n servlet
            data:{ID:data},
            success:function (){
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/loadaccept", //T??n servlet
                    success:function (result){
                        var row=document.getElementById("row")
                        row.innerHTML=""
                        row.innerHTML+=result
                    }
                })
            }
        })
    }
    function Delete(data,data1)
    {
        console.log(data,data1)
        $.ajax({
            type: "POST",
            url: "http://localhost:8082/JSP_servlet_war_exploded/loadaccept", //T??n servlet
            data:{ID:data,Invoice_ID:data1},
            success:function (){
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/loadaccept", //T??n servlet
                    success:function (result){
                        var row=document.getElementById("row")
                        row.innerHTML=""
                        row.innerHTML+=result
                    }
                })
            }
        })
    }
</script>

</body>
</html>