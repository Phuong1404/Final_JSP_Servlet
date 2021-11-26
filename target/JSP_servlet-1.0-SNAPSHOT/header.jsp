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
</head>

<body>
    <header class="header">
    <div class="grid">
        <nav class="header__navbar">
            <a class="header-nav__logo" href="#">
                <img class="header-nav__logo-img" src="assets/img/logo.jpg" alt="PK logo">
                <p class="header-nav__logo-name">STORE</p>
            </a>

            <div class="header-nav__search">
                <input type="text" class="search__input" placeholder="Nhập để tìm kiếm sản phẩm">
                <button class="search__btn">
                    <i class="material-icons search__btn-icon" style=" vertical-align: middle;">search</i>
                </button>
                <div class="search__option hidden">
                    <ul class="search__option-list">
                        <a href="#">
                            <li class="search__option-item">Đồng hồ Casio</li>
                        </a>
                        <a href="#">
                            <li class="search__option-item">Đồng hồ Casio</li>
                        </a>
                        <a href="#">
                            <li class="search__option-item">Đồng hồ Casio</li>
                        </a>
                    </ul>
                </div>
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
            <div class="header-nav__list">
                <a type="button" href="${pageContext.request.contextPath}/cart" class="btn btn--mod me-3">
                    <i class="material-icons" style=" vertical-align: middle;">shopping_cart</i>
                    GIỎ HÀNG
                </a>
                <a type="button" class="btn btn--mod">
                    <i class="material-icons" style=" vertical-align: middle;">manage_accounts</i>
                    TÀI KHOẢN
                </a>
            </div>
            <%}%>


        </nav>
    </div>
    <nav class="header__container">
        <ul class="header-container__list grid grid__row">
            <li class="header-container__item">
                <a href="#" class="header-container__link">
                    PK STORE
                </a>
            </li>
            <li class="header-container__item">
                <a href="#" class="header-container__link">ĐỒNG HỒ</a>
                <div class="container__dropdown grid grid__row">
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">THƯƠNG HIỆU</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="#">Rolex</a></li>
                        <li class="container-dropdown__item"><a href="#">Omega</a></li>
                        <li class="container-dropdown__item"><a href="#">Hublot</a></li>
                        <li class="container-dropdown__item"><a href="#">Swatch</a></li>
                        <li class="container-dropdown__item"><a href="#">Roamer</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">MỨC GIÁ</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="#">2 - 5 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="#">5 - 10 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="#">10 - 20 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="#">20 - 50 Triệu</a></li>
                        <li class="container-dropdown__item"><a href="#">50 - 100 Triệu</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">BỘ MÁY</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="#">Máy pin</a></li>
                        <li class="container-dropdown__item"><a href="#">Máy quang</a></li>
                        <li class="container-dropdown__item"><a href="#">Máy cơ</a></li>
                    </ul>
                    <ul class="container-dropdown__list">
                        <li class="container-dropdown__item container-dropdown__title">LOẠI DÂY</li>
                        <hr class="line">
                        <li class="container-dropdown__item"> <a href="#">Dây vải</a></li>
                        <li class="container-dropdown__item"><a href="#">Dây nhựa</a></li>
                        <li class="container-dropdown__item"><a href="#">Dây da</a></li>
                        <li class="container-dropdown__item"><a href="#">Dây kim loại</a></li>
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
    <script src="assets/js/app.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>

</html>