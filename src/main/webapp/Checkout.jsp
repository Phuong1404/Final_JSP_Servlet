<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Đặt hàng</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
</head>

<body class="grey lighten-3">

<div class="container">
  <div class="py-5 text-center">
    <h2>Thanh toán</h2>
  </div>
  <div class="row" style="padding-left: 170px;">
    <div class="col-md-4 order-md-2 mb-4" id="Row1">

    </div>
    <div class="col-md-6 order-md-1">
      <h4 class="mb-3">Thông tin </h4>
      <div class="needs-validation" novalidate="">
        <div class="row">
          <div class="mb-3">
            <label for="firstName">Họ tên</label>
            <input type="text" class="form-control" id="Name" placeholder="Họ và tên" value="" required="">
            <div class="invalid-feedback"> Valid first name is required. </div>
          </div>
        </div>
        <div class="mb-3">
          <label for="username">Email</label>
          <input type="email" class="form-control" id="Email" placeholder="Email" required="">
          <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
        </div>
        <div class="mb-3">
          <label for="username">Số điện thoại</label>
          <input type="text" class="form-control" id="Phone" placeholder="Số điện thoại" required="">
          <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
        </div>
        <div class="mb-3">
          <label for="email">Địa chỉ</label>
          <input type="text" class="form-control" id="Address" placeholder="Địa chỉ">
          <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
        </div>
        <hr class="mb-4">
        <div class="row">
          <div class="col-md-6 mb-3">
            <div class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Giao hàng hỏa tốc</h6>
                <h6 class="my-0">30.000 đ</h6>
                <small class="text-muted">Giao hàng trong vòng 2 ngày</small>
              </div>
              <input class="text-muted" name="radio1" id="radio2" onchange="MethodShip1()" type="radio">
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <div class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Hàng hàng tiết kiệm</h6>
                <h6 class="my-0">10.000 đ</h6>
                <small class="text-muted">Giao hàng trong vòng 7 ngày</small>
              </div>
              <input class="text-muted" name="radio1" id="radio3" onchange="MethodShip2()"  type="radio">
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" onclick="DatHang()">Đặt hàng</button>
      </div>
    </div>
  </div>
</div>

<!-- SCRIPTS -->
<!-- JQuery -->
<!-- Bootstrap tooltips -->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<script src="https://unpkg.com/boxicons@2.0.9/dist/boxicons.js"></script>
<script src="assets/js/app.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"
        integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://pagination.js.org/dist/2.1.5/pagination.min.js"></script>
<script src="assets/js/lib/bootstrap.min.js"></script>
<script>
  var total=0
  function LoadData()
  {
    $.ajax({
      type: "GET",
      url: "http://localhost:8082/JSP_servlet_war_exploded/loadcheckout", //Tên servlet
      success:function (result) {
        console.log(result)
        var row = document.getElementById("Row1")
        row.innerHTML = "";
        var htmlstring = "";
        htmlstring+=`<h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Sản phẩm</span>
        <span class="badge badge-secondary badge-pill">`+result.length+`</span>
      </h4>
      <ul class="list-group mb-3 sticky-top" >`
        total=total+30000
        for (let item in result)
        {
          htmlstring+=`<li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
              <h6 class="my-0">`+result[item].Name+`</h6>
              <small class="text-muted">x `+result[item].Quantity+`</small>
            </div>
            <span class="text-muted">`+((result[item].Price-((result[item].Price*result[item].Sale)/100))*result[item].Quantity).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</span>
          </li>`
          total=total+(((result[item].Price-((result[item].Price*result[item].Sale)/100))*result[item].Quantity))
        }

        htmlstring+=`<li class="list-group-item d-flex justify-content-between lh-condensed" id="Row2">
                <div>
              <h6 class="my-0">Giao hàng hỏa tốc</h6>
      <small class="text-muted"></small>
    </div>
      <span class="text-muted">30.000 đ</span>
          </li>`

        htmlstring+=`<li class="list-group-item d-flex justify-content-between" id="Row3">
          <span>Tổng (VNĐ)</span>
          <strong>`+total.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</strong>
        </li>
      </ul>`
        row.innerHTML=htmlstring;

      }
    })
  }
</script>
<script>
  $(document).ready(function(){
    document.getElementById("radio2").checked=true
    LoadData();
  })

  function MethodShip1()
  {
    var a=document.getElementById("radio2").checked
    if(a==true)
    {
      var row = document.getElementById("Row2")
      row.innerHTML = "";
      var htmlstring = "";
      htmlstring+=`<div>
              <h6 class="my-0">Giao hàng hỏa tốc</h6>
      <small class="text-muted"></small>
    </div>
      <span class="text-muted">30.000 đ</span>`
      row.innerHTML=htmlstring
      total=total-10000
      total=total+30000;
      var row1 = document.getElementById("Row3")
      row1.innerHTML = "";
      row1.innerHTML=`<span>Tổng (VNĐ)</span>
    <strong>`+total.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</strong>`
    }
  }
  function MethodShip2()
  {
    var a=document.getElementById("radio3").checked
    if(a==true)
    {
      var row = document.getElementById("Row2")
      row.innerHTML = "";
      var htmlstring = "";
      htmlstring+=`<div>
              <h6 class="my-0">Giao hàng tiết kiệm</h6>
      <small class="text-muted"></small>
    </div>
      <span class="text-muted">10.000 đ</span>`
      row.innerHTML=htmlstring
      total=total+10000;
      total=total-30000
      var row1 = document.getElementById("Row3")
      row1.innerHTML = "";
      row1.innerHTML=`<span>Tổng (VNĐ)</span>
    <strong>`+total.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</strong>`
    }
  }
  function DatHang()
  {
    var Name=document.getElementById("Name").value
    var Email=document.getElementById("Email").value
    var Phone=document.getElementById("Phone").value
    var Address=document.getElementById("Address").value
    if(document.getElementById("radio2").checked==true)
    {
      $.ajax({
        type: "POST",
        url: "http://localhost:8082/JSP_servlet_war_exploded/checkout", //Tên servlet
        data:{Name:Name,Email:Email,Phone:Phone,Address:Address,MethodShip:1,Total:total},
        success:function (result) {
            alert(result)
          window.location="http://localhost:8082/JSP_servlet_war_exploded/";
        }
      })
    }
    else {
      $.ajax({
        type: "POST",
        url: "http://localhost:8082/JSP_servlet_war_exploded/checkout", //Tên servlet
        data:{Name:Name,Email:Email,Phone:Phone,Address:Address,MethodShip:2,Total:total},
        success:function (result) {
          alert(result)
          window.location="http://localhost:8082/JSP_servlet_war_exploded/";
        }
      })
    }
  }
</script>
</body>

</html>
