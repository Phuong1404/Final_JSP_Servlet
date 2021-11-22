<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/22/2021
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin - Loại đồng hồ</title>

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
        <a href="index3.html" class="nav-link">Trang chủ</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Giỏ hàng</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Lịch sử mua hàng</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Thông tài khoản</a>
      </li>
    </ul>
    <div class="dropdown navbar-nav ml-auto" >
      <button class="dropbtn" style="background-color: transparent; border: transparent;">
        <i class="fas fa-users-cog" style="color:#6c757d"></i>
      </button>
      <div class="dropdown-content">
        <a style="padding-left: 5px;" class="nav-link" href="index.html">
          <i style="display:inline; padding-left: 28px;" class="fas fa-chart-bar"></i>
          Giỏ hàng
        </a>
        <a style="padding-left: 5px;" class="nav-link" href="#">
          <i style="display:inline; padding-left: 28px;" class="fas fa-users"></i>
          Lịch sử mua hàng
        </a>
        </hr>
        <a style=" padding-left: 5px;" class="nav-link" href="#">
          <i style="display:inline; padding-left: 28px;"class="fas fa-user-lock"></i>
          Thông tin tài khoản
        </a>
        <a style="padding-left: 5px;" class="nav-link" href="#">
          <i style="display:inline; padding-left: 28px;" class="fas fa-sign-out-alt"></i>
          Đăng xuất
        </a>
      </div>
    </div>
    <!-- Right navbar links -->
  </nav>
  <div class="content-wrapper" style="margin-left: 0px;">
    <h1 style="margin-left:600px;"><b>Lịch sử mua hàng</b></h1>
    <div class="container">
      <!-- Cart -->
      <section class="section">
        <div class="table-responsive">
          <table class="table product-table">
            <thead>
            <tr>
              <th>Mã hóa đơn</th>
              <th>Trạng thái</th>
              <th>Phương thức giao hàng</th>
              <th>Tổng Cộng</th>
              <th></th>
            </tr>
            </thead>
            <tbody id="Row1">

            </tbody>
          </table>
        </div>
      </section>
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
  function LoadData() {
    $.ajax({
      type: "GET",
      url: "http://localhost:8082/JSP_servlet_war_exploded/loadhistory", //Tên servlet
      success: function (result) {
        var row = document.getElementById("Row1")
        row.innerHTML = "";
        var htmlstring = "";
        for (let item in result) {
          htmlstring += `<tr>
              <td style="padding-top: 35px;">
                <h5>
                  <strong>
                        <a href="http://localhost:8082/JSP_servlet_war_exploded/invoicedetail?id=`+result[item].Invoice_ID+`">` + result[item].Invoice_ID + `</a>
                  </strong>
                </h5>
              </td>
              <td style="padding-top: 35px;">
                ` + result[item].Status + `
              </td>
              <td style="padding-top: 35px;">` + result[item].MethodShip + `</td>
              <td style="padding-top: 35px;">` + result[item].Total + `</td>`
          if(result[item].CheckS==false)
          {
            htmlstring+=`<td style="padding-top: 35px;"><a  class="text-danger mr-2" >
                                    <i class="far fa-trash-alt"></i>
                                </a></td>`
          }
          else {
            htmlstring+=`<td style="padding-top: 35px;"></td>`
          }
            htmlstring+=`</tr>`
        }
        row.innerHTML = htmlstring
      }
    })
  }
  $(document).ready(function(){
    LoadData();
  })
</script>
</body>
</html>