<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/9/2021
  Time: 10:27 PM
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
        <h1 style="margin-left:700px;"><b>Giỏ hàng</b></h1>
        <div class="container">
            <!-- Cart -->
            <section class="section">
                <div class="table-responsive">
                    <table class="table product-table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="all" onclick="AllCheck()"></th>
                            <th></th>
                            <th>Sản Phẩm</th>
                            <th>Giá</th>
                            <th>Số Lượng</th>
                            <th>Tổng Cộng</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="Row1">
                        </tbody>
                    </table>
                    <div id="row2">
                        <h2 style="padding-left: 880px"><strong>Tổng tiền : 0 đ</strong></h2>
                    </div>
                    <button style="margin-left: 980px; margin-top: 10px" onclick="ThanhToan()" id="btnbuy" class="btn btn-primary btn-buynow">MUA NGAY</button>
                </div>
            </section>
        </div>
    </div>
    <footer class="main-footer">
        <strong>Website bán đồng hồ hàng đầu thế giới.</strong>
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
    let ItemChooseID=[0];
    let ItemChooseQuantity=[0];
    let Total1=0;
    let Checkbuy=0;
    let lengthre=0;
    let totalcheck=0;
    function AllCheck()
    {
        for(var i =0;i<lengthre;i++)
        {
            $('#'+i).click();
        }
    }
    function LoadData()
    {
        $.ajax({
            type: "GET",
            url: "http://localhost:8082/JSP_servlet_war_exploded/loadcart", //Tên servlet
            success:function (result){
                var row=document.getElementById("Row1")
                row.innerHTML="";
                var htmlstring="";
                lengthre=result.length;
                for(let item in result)
                {
                htmlstring+=`<tr>
                            <td style="padding-top: 58px;"><input id="`+item+`" type="checkbox" onchange="AddChose('`+result[item].ID+`',`+result[item].Quantity+`,`+item+`,`+(result[item].Price*result[item].Quantity)+`)"></td>
                            <td scope="row">
                                <img src="Image/`+result[item].Photo+`"
                                     alt="" class="img-fluid" style="width:100px;height:120px;"/>
                            </td>
                            <td style="padding-top: 58px;">
                                <h5>
                                    <strong>`+result[item].Name+`</strong>
                                </h5>
                            </td>
                            <td style="padding-top: 58px;">`+result[item].Price+` đ`+`</td>
                            <td class="center-on-small-only" style="padding-top: 55px;">
                                <input type="number" style="width:50px" value="`+result[item].Quantity+`" id="Quantitys" onchange="Update('`+result[item].ID+`',`+result[item].QuantityInStock+`,`+result[item].Quantity+`)">
                            </td>
                            <td style="padding-top: 58px;">`+(result[item].Price*result[item].Quantity)+`</td>
                            <td style="padding-top: 58px;">
                                <a  class="text-danger mr-2" onclick="Delete('`+result[item].ID+`')">
                                    <i class="far fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>`
            }
                row.innerHTML=htmlstring;
            }
        })
    }
    $(document).ready(function(){
        LoadData();
        if(Checkbuy==0)
        {
            document.getElementById("btnbuy").disabled = true;
        }

    })
    function AddChose(Id,Quan,i,total)
    {
        if($('#'+i)[0].checked==true)
        {
            ItemChooseID[i]=Id;
            ItemChooseQuantity[i]=Quan;
            Total1=Total1-(-total)
            Checkbuy++
            totalcheck++
            var row=document.getElementById("row2")
            row.innerHTML=null
            row.innerHTML='<h2 style="padding-left: 880px"><strong>Tổng tiền : '+Total1+' đ</strong></h2>'
            if(Checkbuy==0)
            {
                document.getElementById("btnbuy").disabled = true;
            }
            else
            {
                document.getElementById("btnbuy").disabled = false;
            }
            if(totalcheck==lengthre)
            {
                document.getElementById("all").checked=true;
            }
            else
            {
                document.getElementById("all").checked=false;
            }
            console.log(ItemChooseID.length)
        }
        else{
            ItemChooseID[i]=0
            ItemChooseQuantity[i]=0
            Total1=Total1-total
            Checkbuy--
            totalcheck--
            var row=document.getElementById("row2")
            row.innerHTML=null
            row.innerHTML='<h2 style="padding-left: 880px"><strong>Tổng tiền : '+Total1+' đ</strong></h2>'
            if(Checkbuy==0)
            {
                document.getElementById("btnbuy").disabled = true;
            }
            else
            {
                document.getElementById("btnbuy").disabled = false;
            }
            if(totalcheck==lengthre)
            {
                document.getElementById("all").checked=true;
            }
            else
            {
                document.getElementById("all").checked=false;
            }
        }
    }
    function ThanhToan(){
                $.ajax({
                    type: "Post",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/cart", //Tên servlet
                    data:{ID:ItemChooseID,Quantity:ItemChooseQuantity,Length:ItemChooseID.length},
                    success:function (){
                        window.location="http://localhost:8082/JSP_servlet_war_exploded/checkout"
                    }
                    })
    }
    function Update(ID,stock,Quan)
    {
        var a=document.getElementById('Quantitys').value
        if(a>10)
        {
            alert("Số lượng tối đa có thể mua với mỗi sản phẩm là 10 !")
            document.getElementById('Quantitys').value=Quan
        }
        else{
            if(a>stock)
            {
                alert("Số lượng trong kho không đủ để thêm vào giỏ hàng !")
                document.getElementById('Quantitys').value=Quan
            }
            else {
                $.ajax({
                    type: "Post",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/editcart", //Tên servlet
                    data:{ID:ID,Quantity:a},
                    success:function (){
                        LoadData();
                        document.getElementById("all").checked=false;
                        var row=document.getElementById("row2")
                        row.innerHTML=null
                        row.innerHTML='<h2 style="padding-left: 880px"><strong>Tổng tiền : 0 đ</strong></h2>'
                        document.getElementById("btnbuy").disabled = false;
                    }
                })
            }
        }
    }
    function Delete(ID)
    {
        var result1=confirm("Bạn có chắc xóa sản phẩm khỏi giỏ hàng !!")
        if(result1){
            $.ajax({
                type: "Post",
                url: "http://localhost:8082/JSP_servlet_war_exploded/loadcart", //Tên servlet
                data:{ID:ID},
                success:function (){
                    LoadData();
                    document.getElementById("all").checked=false;
                    var row=document.getElementById("row2")
                    row.innerHTML=null
                    row.innerHTML='<h2 style="padding-left: 880px"><strong>Tổng tiền : 0 đ</strong></h2>'
                    document.getElementById("btnbuy").disabled = false;
                }
            })
        }
    }
</script>
</body>
</html>
