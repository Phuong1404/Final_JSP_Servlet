<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/7/2021
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <title>Đăng ký</title>
</head>
<style>
    body {font-family: Arial, Helvetica, sans-serif;}

    /* Full-width input fields */
    input[type=text], input[type=password] ,input[type=email],input[type=tel],input[type=date]{
        width: 480px;
        padding: 15px;
        margin-left: 20px;
        display: inline-block;
        border-width: 1px;
        border-style: solid;
        margin-top: 8px;
        margin-bottom: 8px;
    }

    input[type=text]:focus, input[type=password]:focus,input[type=email]:focus,input[type=tel]:focus,input[type=date]:focus {
        border-color: #33b5e5
    }

    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    body{
        background: url('endless-summer-2560x1440-4k-hd-wallpaper-lake-mountains-levitation-284-Copy.jpg')no-repeat 0px 0px;
        background-size:cover;
        background-attachment:fixed;
    }
    /* Set a style for all buttons */
    button {
        background-color:#ef4d4d;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity:1;
    }

    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Change styles for cancel button and signup button on extra small screens */
    @media screen and (max-width: 300px) {
        .signupbtn {
            width: 100%;
        }
    }
</style>
<body style="width:600px; margin-left: 480px;">

<form method="post" onsubmit="Check()" action="${pageContext.request.contextPath}/signup" style=" width:550px; background-color:white">
    <div style="align-items: center;" >
        <div style="width:550px; height: 80px; background-color: #33b5e5; margin-bottom: 10px;">
            <h1 style="color: #f1f1f1;padding-top: 23px; padding-left: 200px;">Đăng ký</h1>
        </div>
        <div id="error">
            <p style="color: red">${err}</p>
        </div>
        <label for="email" style="margin-left: 20px; padding-top: 8px;"><b>Họ tên</b></label>
        <input type="text" placeholder="Nhập họ tên" name="Name" id="Name" required>

        <label for="psw" style="margin-left: 20px;"><b>Ngày sinh</b></label>
        <input type="date" name="DOB" id="DOB" required>

        <label for="psw" style="margin-left: 20px;"><b>Địa chỉ</b></label>
        <input type="text" placeholder="Nhập địa chỉ" name="Address" id="Address" required>

        <label for="psw-repeat" style="margin-left: 20px;"><b>Email</b></label>
        <input type="email" placeholder="Nhập email" name="Email" id="Email" required>

        <label for="psw-repeat" style="margin-left: 20px;"><b>Số điện thoại</b></label>
        <input type="tel" placeholder="Nhập số điện thoại" name="Phone" id="phone" required>

        <label for="psw-repeat" style="margin-left: 20px;"><b>Tài khoản</b></label>
        <input type="text" placeholder="Nhập tài khoản" name="UserName" id="UserName"  required>

        <label for="psw-repeat" style="margin-left: 20px;"><b>Mật khẩu</b></label>
        <input type="password" placeholder="Nhập mật khẩu" name="Password" id="pass" required>

        <label for="psw-repeat" style="margin-left: 20px;"><b>Nhập lại mật khẩu</b></label>
        <input type="password" placeholder="Nhập lại mật khẩu" name="pass1" id="pass1" onkeyup="Check1()" required>

        <p style="margin-left: 20px;">Bạn đã có tài khoản <a href="${pageContext.request.contextPath}/login" style="color:dodgerblue">đăng nhập</a>.</p>

        <div class="clearfix" style="padding-bottom: 20px">
            <button type="submit" style="margin-left: 210px; width: 130px" class="signupbtn">Đăng ký</button>
        </div>
    </div>
</form>
<script>
    function Check()
    {
        var a1=document.getElementById("Name").value;
        var a2=document.getElementById("DOB").value;
        var a3=document.getElementById("Address").value;
        var a4=document.getElementById("Email").value;
        var a5=document.getElementById("pass").value;
        var a6=document.getElementById("pass1").value;
        if(a1=='' ||a2==''||a3==''||a4==''||a5==''||a6=='')
        {
            return false
        }
        else {
            return true
        }
    }
    function Check1()
    {
        var phantuchon = $("#error");
        phantuchon.empty();
        var a5=document.getElementById("pass").value;
        var a6=document.getElementById("pass1").value;
        if(a5!=a6 && a5!='')
        {
            phantuchon.append("<p style='color: red; margin-left: 20px'>nhập lại mật khẩu không chính xác</p>");
        }
    }
</script>
</body>
</html>



