<%@ page import="Model.Account" %>
<%@ page import="DAO.MyUtils" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="dist/css/dropdown1.css">
    <style>
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 170px;
            left: 0;
            font-size: 15px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .header-nav__search1 {
            position: relative;
            display: flex;
            background-color: #fff;
            flex: 0.6;
            height: 32px;
            border-radius: 2px;
        }

        .header-nav__search1 .search__input {
            width: 100%;
            height: 100%;
            font-size: 1.4rem;
            border: none;
            outline: none;
            padding: 0 0.8rem;
            border-radius: 0.3rem;
        }

        .header-nav__search1 .search__btn {
            background-color: #dfb93f;
            border: none;
            margin: 0.3rem;
            border-radius: 0.3rem;
            outline: none;
            width: 6rem;
            height: 2.6rem;
        }

        .btn--mod:hover,
        .header-nav__search1 .search__btn:hover {
            background-color: #f1cc52;
            cursor: pointer;
            animation: jelly 0.5s;
        }

        .header-nav__search1 .search__btn-icon {
            font-size: 2rem;
            color: #fff;
        }

        .header-nav__search1 .search__option {
            position: absolute;
            left: 0;
            right: 0;
            top: 110%;
            background-color: #fff;
            font-size: 1.4rem;
            border-radius: 0.3rem;
            box-shadow: 0 0 0.3rem #ccc;
            z-index: 999;
        }
    </style>
</head>

<body>
    <header class="header">
    <div class="grid">
        <nav class="header__navbar">
            <a class="header-nav__logo" href="${pageContext.request.contextPath}">
                <img class="header-nav__logo-img" src="assets/img/logo.jpg" alt="PK logo">
                <p class="header-nav__logo-name">STORE</p>
            </a>

            <div class="header-nav__search1">
                <input type="text" class="search__input" placeholder="Nhập để tìm kiếm sản phẩm" id="search2">
                <button class="search__btn" onclick="GetSearch1()">
                    <i class="material-icons search__btn-icon" style=" vertical-align: middle;">search</i>
                </button>
            </div>

            <%Account loginedUser1= MyUtils.getLoginedUser(request.getSession());%>
            <% if(loginedUser1==null){%>
            <div class="header-nav__list">
                <a type="button" class="btn btn--mod me-3" href="${pageContext.request.contextPath}/login" data-modal="login__model">
                    <i class="material-icons" style=" vertical-align: middle;">login</i>
                    ĐĂNG NHẬP
                </a>
                <a type="button" class="btn btn--mod" href="${pageContext.request.contextPath}/signup" data-modal="signup__model">
                    <i class="material-icons" style=" vertical-align: middle;">app_registration</i>
                    ĐĂNG KÍ
                </a>
            </div>
            <%} else {%>
                <% if(loginedUser1.getRole().equals("Admin")){%>
            <div class="header-nav__list">
                <a type="button" href="${pageContext.request.contextPath}/admin" class="btn btn--mod me-3">
                    <i class="material-icons" style=" vertical-align: middle;">manage_accounts</i>
                    ADMIN
                </a>
                <a type="button" href="${pageContext.request.contextPath}/cart" class="btn btn--mod me-3">
                    <i class="material-icons" style=" vertical-align: middle;">shopping_cart</i>
                    GIỎ HÀNG
                </a>
                <div class="dropdown">
                    <button class="btn btn--mod "><i class="material-icons" style=" vertical-align: middle;">account_circle</i>TÀI KHOẢN</button>
                    <div class="dropdown-content">
                        <a type="button" class="btn " style="text-align: left" href="${pageContext.request.contextPath}/infoaccount">Thông tin tài khoản </a>
                        <a type="button" class="btn " style="text-align: left"  href="${pageContext.request.contextPath}/history">Lịch sử mua hàng </a>
                        <a type="button" class="btn " style="text-align: left"  href="${pageContext.request.contextPath}/logout">Đăng xuất </a>
                        <a type="button" class="btn " style="text-align: left"  href="#"></a>
                    </div>
                </div>
            </div>
                <%} else {%>
            <div class="header-nav__list">
                <a type="button" href="${pageContext.request.contextPath}/cart" class="btn btn--mod me-3">
                    <i class="material-icons" style=" vertical-align: middle;">shopping_cart</i>
                    GIỎ HÀNG
                </a>
                <div class="dropdown">
                    <button class="btn btn--mod "><i class="material-icons" style=" vertical-align: middle;">account_circle</i>TÀI KHOẢN</button>
                    <div class="dropdown-content">
                        <a type="button" class="btn " style="text-align: left" href="${pageContext.request.contextPath}/infoaccount">Thông tin tài khoản </a>
                        <a type="button" class="btn " style="text-align: left"  href="${pageContext.request.contextPath}/history">Lịch sử mua hàng </a>
                        <a type="button" class="btn " style="text-align: left"  href="${pageContext.request.contextPath}/logout">Đăng xuất </a>
                        <a type="button" class="btn " style="text-align: left"  href="#"></a>
                    </div>
                </div>
            </div>
                <%}%>
            <%}%>


        </nav>
    </div>
    <nav class="header__container">
        <ul class="header-container__list grid grid__row">
            <li class="header-container__item">
                <a href="${pageContext.request.contextPath}" class="header-container__link">
                    PK STORE
                </a>
            </li>
            <li class="header-container__item">
                <a href="#" class="header-container__link">ĐỒNG HỒ</a>
                <div class="container__dropdown grid grid__row">
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">THƯƠNG HIỆU</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="${pageContext.request.contextPath}/productlist?id=1">Rolex</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=2">Omega</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=3">Hublot</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">MỨC GIÁ</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="${pageContext.request.contextPath}/productlist?id=4">5 - 10 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=5">10 - 20 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=6">20 - 50 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=7">50 - 100 Triệu</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">BỘ MÁY</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="${pageContext.request.contextPath}/productlist?id=8">Máy pin</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=9">Máy quang</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=10">Máy cơ</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">LOẠI DÂY</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="${pageContext.request.contextPath}/productlist?id=11">Dây vải</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=12">Dây nhựa</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=13">Dây da</a></li>
                        <li class="container-dropdown__item"><a href="${pageContext.request.contextPath}/productlist?id=14">Dây kim loại</a></li>
                    </ul>
                </div>
            </li>

            <li class="header-container__item">
                <a href="#" class="header-container__link">PHỤ KIỆN</a>
            </li>

            <li class="header-container__item">
                <a href="#" class="header-container__link">TIN TỨC</a>

            </li>

            <li class="header-container__item">
                <a href="#" class="header-container__link">CSKH</a>

            </li>

        </ul>
    </nav>
</header>
    <script src="https://unpkg.com/boxicons@2.0.9/dist/boxicons.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>

</html>