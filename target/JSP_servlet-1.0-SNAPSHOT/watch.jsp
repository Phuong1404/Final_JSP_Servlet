<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Watch</title>

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
                <a href="${pageContext.request.contextPath}/brand" class="nav-link">Hãng đồng hồ</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="" class="nav-link">Đồng hồ</a>
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

                <a style="padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/brand">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    Hãng đồng hồ
                </a>

                <a style=" padding-left: 5px;" class="nav-link" href="">
                    <i style="display:inline; padding-left: 28px;" class="fas fa-clock"></i>
                    Đồng hồ
                </a>
                </hr>

                <a style=" padding-left: 5px;" class="nav-link" href="${pageContext.request.contextPath}/accept">
                    <i style="display:inline; padding-left: 28px;"class="fas fa-user-lock"></i>
                    Xác nhận đơn hàng
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
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Đồng hồ</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Đồng hồ</li>
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
                                <h3 class="card-title">Danh sách đồng hồ</h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" id="Search" onkeyup="Load1()" class="form-control float-right" placeholder="Tìm kiếm">

                                        <div class="input-group-append">
                                            <button onclick="Search1()" class="btn btn-default">
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
                                        <th>Mã đồng hồ</th>
                                        <th>Tên đồng hồ</th>
                                        <th>Hãng đồng hồ</th>
                                        <th>Loại máy</th>
                                        <th>Loại dây</th>
                                        <th>Giá</th>
                                        <th>Số lượng tồn</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody  id="row">
                                    </tbody>
                                </table>
                            </div>
                            <button type="submit" class="btn btn-primary" style="background-color: #17a2b8; width: 100px;" onclick="openFormInsert()">Thêm</button>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
        <div class="form-popup" id="myForm1" style="width: 1200px;display: none;margin-left:160px;">
            <!-- general form elements -->
            <div class="card card-default">
                <div class="card-header" style="background-color: #17a2b8;">
                    <h3 class="card-title" style="color: white">Thêm đồng hồ</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" onclick="closeFormInsert()">
                            <i class="fas fa-times" style="color: red;"></i>
                        </button>
                    </div>
                </div>
                <!-- /.card-header -->
                <form method="post" enctype="multipart/form-data" onsubmit="return false">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên Đồng Hồ</label>
                                    <input type="text" class="form-control" id="Name" placeholder="Tên đồng hồ">
                                </div>
                                <div class="form-group">
                                    <label>Loại Dây</label>
                                    <select class="form-control select2" id="Wire" style="width: 100%;">
                                        <option selected="selected" value="Dây Vải">Dây Vải</option>
                                        <option value="Dây Nhựa">Dây Nhựa</option>
                                        <option value="Dây Da">Dây Da</option>
                                        <option value="Dây Kim Loại">Dây Kim Loại</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh 1</label>
                                    <input type="file" class="form-control" id="Photo1" placeholder="Tên đồng hồ">
                                </div>
                                <div class="form-group">
                                    <label>Ảnh 4</label>
                                    <input type="file" class="form-control" id="Photo4" placeholder="Tên đồng hồ">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Hãng Đồng Hồ</label>
                                    <select class="form-control select2" id="Brand" style="width: 100%;">

                                    </select>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Giá</label>
                                    <input type="number" class="form-control" id="Piece" placeholder="Giá">
                                </div>
                                <div class="form-group">
                                    <label>Ảnh 2</label>
                                    <input type="file" class="form-control" id="Photo2" placeholder="Tên đồng hồ">
                                </div>
                                <div class="form-group">
                                    <label>Ảnh 5</label>
                                    <input type="file" class="form-control" id="Photo5" placeholder="Tên đồng hồ">
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Loại Máy</label>
                                    <select class="form-control select2" id="Machine" style="width: 100%;">
                                        <option selected="selected" value="Pin">Máy Pin</option>
                                        <option value="Quang">Máy Quang</option>
                                        <option value="Cơ">Máy Cơ</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Số lượng tồn</label>
                                    <input type="number" class="form-control" id="QuantityInStock" placeholder="Tên đồng hồ">
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Ảnh 3</label>
                                    <input type="file" class="form-control" id="Photo3" placeholder="Tên đồng hồ">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: #17a2b8;" id="add">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="form-popup" id="myForm2" style="width: 1200px;display: none;margin-left:160px;">
            <div class="card card-default">
                <div class="card-header" style="background-color: #17a2b8;">
                    <h3 class="card-title" style="color: white">Sửa Thông Tin Đồng Hồ</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" onclick="closeFormEdit()">
                            <i class="fas fa-times" style="color: red;"></i>
                        </button>
                    </div>
                </div>
                <!-- /.card-header -->
                <form method="post" onsubmit="return false">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Mã Đồng hồ</label>
                                    <input type="text" class="form-control" id="ID1" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Loại Máy</label>
                                    <select class="form-control select2" id="Machine1" style="width: 100%;">
                                        <option value="Pin">Máy Pin</option>
                                        <option value="Quang">Máy Quang</option>
                                        <option value="Cơ">Máy Cơ</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Số Lượng Tồn</label>
                                    <input type="number" class="form-control" id="QuantityInStock1" placeholder="Số Lượng Tồn">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên Đồng Hồ</label>
                                    <input type="text" class="form-control" id="Name1" placeholder="Tên đồng hồ">
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Loại Dây</label>
                                    <select class="form-control select2" id="Wire1" style="width: 100%;">
                                        <option value="Dây Vải">Dây Vải</option>
                                        <option value="Dây Nhựa">Dây Nhựa</option>
                                        <option value="Dây Da">Dây Da</option>
                                        <option value="Dây Kim Loại">Dây Kim Loại</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Hãng Đồng Hồ</label>
                                    <select class="form-control select2" id="Brand1" style="width: 100%;">
                                    </select>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Giá</label>
                                    <input type="number" class="form-control" id="Piece1" placeholder="Giá">
                                </div>
                                <!-- /.form-group -->
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: #17a2b8;" id="upd">Sửa</button>
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
            url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
            success:function (result){
                var row=document.getElementById("row")
                row.innerHTML=""
                row.innerHTML+=result;

            }
        })
    })
    function Load1(){
        var Name=$("#Search").val();
        if(Name=='')
        {
            $.ajax({
                type: "GET",
                url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
                success:function (result){
                    var row=document.getElementById("row")
                    row.innerHTML=""
                    row.innerHTML+=result;
                }
            })
        }
    }
    //Load data combobox
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand1", //Tên servlet
            success:function (result){
                var row=document.getElementById("Brand")
                row.innerHTML+=result;
            }
        })
    })
    //Delete data
    function Delete(data){
        var result=confirm("Bạn có chắc là xóa đồng hồ này !!")
        if(result){
            $.ajax({
                type: "GET",
                data: {ID: data},
                url: "http://localhost:8082/JSP_servlet_war_exploded/delwatch", //Tên servlet
                success: function (result) {
                    $.ajax({
                        type: "GET",
                        url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
                        success: function (result) {
                            var row = document.getElementById("row")
                            row.innerHTML = null;
                            row.innerHTML += result;
                        },
                        error: function (request, status, error) {
                            alert(request.responseText);
                        }

                    })
                }
            })
        }
        else{
            return false
        }
    }
    //Update data
    $("#upd").click(function (){
        var ID=$("#ID1").val()
        var Name=$("#Name1").val() //Lấy tất cả data trong form
        var Brand=$("#Brand1").find(":selected").val();
        var Machine=$("#Machine1").find(":selected").val();
        var Wire=$("#Wire1").find(":selected").val();
        var Piece=$("#Piece1").val()
        var QuantityInStock=$("#QuantityInStock1").val()
        if(Name!=''&&Piece!=''&&QuantityInStock!='') {
            $.ajax({
                type: "POST", //với servlet thì sẽ đi vào method doPost
                url: "http://localhost:8082/JSP_servlet_war_exploded/upwatch", //Tên của class Servlet
                cache: false,
                data: {
                    ID: ID,
                    Name: Name,
                    Brand: Brand,
                    Machine: Machine,
                    Wire: Wire,
                    Piece: Piece,
                    QuantityInStock: QuantityInStock
                },
                success: function () {
                    $.ajax({
                        type: "GET",
                        url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
                        success: function (result) {
                            var row = document.getElementById("row")
                            row.innerHTML = null;
                            row.innerHTML += result;
                            document.getElementById("myForm2").style.display = "none";
                            document.getElementById("test1").style.display = "block";
                        },
                        error: function (request, status, error) {
                            alert(request.responseText);
                        }

                    })
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
    })
    //Insert data
    $("#add").click(function (){
        var Name=$("#Name").val() //Lấy tất cả data trong form
        var Brand=$("#Brand").find(":selected").val();
        var Machine=$("#Machine").find(":selected").val();
        var Wire=$("#Wire").find(":selected").val();
        var Piece=$("#Piece").val()
        var QuantityInStock=$("#QuantityInStock").val()
        ////////////////////////////////////////////////////////
        var dt=new FormData();
        var I1=document.getElementById("Photo1").files[0];
        var I2=document.getElementById("Photo2").files[0];
        var I3=document.getElementById("Photo3").files[0];
        var I4=document.getElementById("Photo4").files[0];
        var I5=document.getElementById("Photo5").files[0];
        var Name=document.getElementById("Name").value;
        ///////////////////////////////////////////////////////////
        dt.append('I1',I1);
        dt.append('I2',I2);
        dt.append('I3',I3);
        dt.append('I4',I4);
        dt.append('I5',I5);
        dt.append('Name',Name);
        dt.append('Brand',Brand);
        dt.append('Machine',Machine);
        dt.append('Wire',Wire);
        dt.append('Piece',Piece);
        dt.append('QuantityInStock',QuantityInStock);
        ///////////////////////////////////////////////////////
        if(Name!=''&&Piece!=''&&QuantityInStock!='') {
            $.ajax({
                type: "POST", //với servlet thì sẽ đi vào method doPost
                url: "http://localhost:8082/JSP_servlet_war_exploded/watch", //Tên của class Servlet
                cache: false,
                contentType:false,
                processData: false,
                enctype : 'multipart/form-data',
                data:dt,
                success: function () {
                    Load1();
                    closeFormInsert();
                },
                error: function (request, status, error) {
                    alert(request.responseText);
                }
            });
        }
    })
    function closeFormEdit() {
        document.getElementById("myForm2").style.display = "none";
        document.getElementById("test1").style.display="block";
    }

    function openFormInsert() {
        document.getElementById("myForm1").style.display = "block";

        document.getElementById("test1").style.display="none";
    }

    function closeFormInsert() {
        document.getElementById("myForm1").style.display = "none";
        document.getElementById("test1").style.display="block";
    }
    function Search1()
    {
        $(document).ready(function(){
            var Name=$("#Search").val();
            $.ajax({
                type: "GET",
                data:{Name:Name},
                url: "http://localhost:8082/JSP_servlet_war_exploded/watchsearch", //Tên servlet
                success:function (result){
                    var row=document.getElementById("row")
                    row.innerHTML="";
                    row.innerHTML+=result;

                }
            })
        })
    }
    function Update(data) {
        document.getElementById("myForm2").style.display = "block";

        document.getElementById("test1").style.display="none";
        $.ajax({
            type: "GET",
            data:{ID:data},
            url: "http://localhost:8082/JSP_servlet_war_exploded/upwatch", //Tên servlet
            success:function (result){
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand1", //Tên servlet
                    success:function (result1){
                        var row=document.getElementById("Brand1")
                        row.innerHTML+=result1;
                        document.getElementById("Brand1").value=result.TypeOfWatch_ID;
                    }
                })
                document.getElementById("ID1").value=result.ID;
                document.getElementById("Name1").value=result.Name;
                document.getElementById("Brand1").value=result.TypeOfWatch_ID;
                document.getElementById("Piece1").value=result.Price;
                document.getElementById("Machine1").value=result.MachineType;
                document.getElementById("Wire1").value=result.WireType;
                document.getElementById("QuantityInStock1").value=result.QuantityInStock;
            }
        })
    }
    function UploadImage()
    {
        var dt=new FormData();
        var I1=document.getElementById("Photo1").files[0];
        var I2=document.getElementById("Photo2").files[0];
        var I3=document.getElementById("Photo3").files[0];
        var I4=document.getElementById("Photo4").files[0];
        var I5=document.getElementById("Photo5").files[0];
        var Name=document.getElementById("Name").value;
        dt.append('I1',I1);
        dt.append('I2',I2);
        dt.append('I3',I3);
        dt.append('I4',I4);
        dt.append('I5',I5);
        dt.append('Name',Name);
        $.ajax({
            type: "POST", //với servlet thì sẽ đi vào method doPost
            url: "http://localhost:8082/JSP_servlet_war_exploded/uploadimage", //Tên của class Servlet
            cache: false,
            contentType:false,
            processData: false,
            enctype : 'multipart/form-data',
            data:dt
        })
        Load1();
    }
</script>
</body>
</html>