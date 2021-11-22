<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <style>
        body{
            background: url('endless-summer-2560x1440-4k-hd-wallpaper-lake-mountains-levitation-284-Copy.jpg')no-repeat 0px 0px;
            background-size:cover;
            background-attachment:fixed;
        }
        .login input[Name="Username"],
        .login input[Name="Password"] {
            background: #fff;
            margin: 25px 20px 0px 20px;
            box-sizing: border-box;
            display: block;
            width: 90%;
            border-width: 1px;
            border-style: solid;
            padding: 13px;
        }
        .login input[type="submit"]
        {
            margin-top: 25px;
            display: block;
            width: 90%;
            padding: 8px;
            margin-left: 20px;
            font-size: 25px;
            color: white;
            background-color: tomato;
            border: tomato;
        }
        .login input[Name="Username"]:hover,
        .login input[Name="Password"]:hover
        {
            border-color: #28d;
        }
        .login input[type="submit"]:hover
        {
            background-color: #33b5e5;
            border-color: #33b5e5;
        }
        .login input[Name="Username"]:focus,
        .login input[Name="Password"]:focus
        {
            border-color: #33b5e5;
        }

        .social-links i {
            line-height: 43px;
            font-size: 18px;

        }
        .social-links a {
            width: 40px;
            height: 40px;
            display: inline-block;
            border-radius: 50%;
            font-size: 24px;
            color: #fff;
            opacity: 0.75;
            transition: opacity 0.15s linear;
        }

        .social-links a:hover {
            opacity: 1;
        }
        /* colors */

        .facebook {
            background: #3b5998;
        }

        .twitter {
            background: #55acee;
        }

        .googleplus {
            background: #dd4b39;
        }
        .social-links ul li {
            display: inline-block;
        }

        .bottom-text p  {
            font-size:14px;
        }
        .bottom-text a {
            color: #33b5e5;
            text-decoration: none;
            font-size:14px;
        }

        .bottom-text p a{
            color:#33b5e5;
            margin-left: 5px;
            transition: .5s ease-in;
            -webkit-transition: .5s ease-in;
            -ms-transition: .5s ease-in;
            -o-transition: .5s ease-in;
            -moz-transition: .5s ease-in;
        }
        .bottom-text p a:hover {
            color:#ef4d4d;
        }
        .bottom-text h4 {
            font-size:10px;
            color:#33b5e5;
            margin-top: 10px;
            color:#ef4d4d;
            transition: .5s ease-in;
            -webkit-transition: .5s ease-in;
            -ms-transition: .5s ease-in;
            -o-transition: .5s ease-in;
            -moz-transition: .5s ease-in;
        }
        .bottom-text h4 a:hover {
            color:#ef4d4d;
        }
    </style>
</head>
<body>
<div style="margin-top: 100px; align-items: center; text-align: center; margin-left: 540px;margin-right: 540px;" class="login" >
    <div class="">
        <div style="height: 70px; align-items:center ; text-align: center; font-size: 20px; background-color:#33b5e5; color: white;">
            <h2 style="padding-top: 20px;" >LOG IN</h2>
        </div>
        <div style="height: 480px; background-color: #fff; padding-top: 20px;" >
            <div id="error">
                <p style="color: red">${err}</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/login" onsubmit="return(Check());">
                <input type="text" placeholder="Username" Name="Username" id=Username  >
                <input type="password" placeholder="Password" Name="Password" id="Password">
                <input type="submit" value="Log in">
            </form>
            <div>
                <h3 style="font-size: 20px; color: #33b5e5;">OR</h3>
            </div>
            <div class="social-links">
                <ul style="padding: 0;">
                    <!-- facebook -->
                    <li> <a class="facebook" href="#" ><i class="fa fa-facebook"></i></a></li>

                    <!-- twitter -->
                    <li> <a class="twitter" href="#" ><i class="fa fa-twitter"></i></a></li>

                    <!-- google plus -->
                    <li> <a class="googleplus" href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul>
            </div>
            <div class="bottom-text ">
                <p>No account yet?<a href="${pageContext.request.contextPath}/signup">Signup</a></p>
                <h4> <a href="#">Forgot your password?</a></h4>
            </div>
        </div>

    </div>
</div>
</body>

<script>
    function Check()
    {
        var phantuchon = $("#error");
        phantuchon.empty();
        const un=$('#Username').val()
        const pw=$('#Password').val()
        if(un==''&&pw=='')
        {
            phantuchon.append("<p style='color: red'>You haven't entered anything yet</p>");
            return false;
        }
        else if(un=='')
        {
            phantuchon.append("<p style='color: red'>You need to enter Username</p>");
            return false;
        }
        else if(pw=='')
        {
            phantuchon.append("<p style='color: red'>You need to enter Password</p>");
            return false;
        }
        else{
            return true;
        }
    }
</script>
</html>