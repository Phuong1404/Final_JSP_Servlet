<%@ page import="Model.Account" %>
<%@ page import="DAO.MyUtils" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
          integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<main>
    <header class="header">
        <div class="grid">
            <nav class="header__navbar">
                <a class="header-nav__logo" href="#">
                    <img class="header-nav__logo-img" src="assets/img/logo.jpg" alt="PK logo">
                    <p class="header-nav__logo-name">STORE</p>
                </a>

                <div class="header-nav__search">
                    <input type="text" class="search__input" id="search1" placeholder="Nhập để tìm kiếm sản phẩm">
                    <button class="search__btn">
                        <i class="material-icons search__btn-icon" onclick="GetSearch()" style=" vertical-align: middle;">search</i>
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
                    <button type="button" class="btn btn--mod me-3" data-modal="login__model">
                        <i class="material-icons" style=" vertical-align: middle;">login</i>
                        ĐĂNG NHẬP
                    </button>
                    <button type="button" class="btn btn--mod" data-modal="signup__model">
                        <i class="material-icons" style=" vertical-align: middle;">app_registration</i>
                        ĐĂNG KÍ
                    </button>
                </div>
                <%} else {%>
                <div class="dropdown">
                    <a class="btn dropdown-toggle btn--mod" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="material-icons" style=" vertical-align: middle;">person_outline</i>
                        <span>TÀI KHOẢN</span>
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Chỉnh sửa thông tin</a></li>
                        <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                        <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                    </ul>
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

    <div class="product-main grid">
        <div class="product-brand margin">
            <div class="header-title">Thương hiệu</div>
            <a href="#" class="product-brand__link"><img src="assets/img/brand1.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand2.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand3.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand4.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand5.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand6.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand7.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand8.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand9.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand10.png"
                                                         class="product-brand__img"></a>
            <a href="#" class="product-brand__link"><img src="assets/img/brand11.png"
                                                         class="product-brand__img"></a>
        </div>
        <div class="product-cat row">
            <div class="product-cat-left col-3">
                <div class="product-cat-left__filter">
                    <div class="filter__name">
                            THƯƠNG HIỆU
                        </div>
                    <div class="filter__select">
                            <!-- Chỉnh ID trùng vs FOR -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Rolex">
                                <label class="form-check-label" for="Rolex">
                                    Rolex
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Omega">
                                <label class="form-check-label" for="Omega">
                                    Omega
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Hublot">
                                <label class="form-check-label" for="Hublot">
                                    Hublot
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Swatch">
                                <label class="form-check-label" for="Swatch">
                                    Swatch
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Roamer">
                                <label class="form-check-label" for="Roamer">
                                    Roamer
                                </label>
                            </div>
                        </div>
                    <div class="filter__name">
                            MỨC GIÁ
                        </div>
                    <div class="filter__select">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="25t">
                                <label class="form-check-label" for="25t">
                                    2 - 5 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="510t">
                                <label class="form-check-label" for="510t">
                                    5 - 10 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="1020t">
                                <label class="form-check-label" for="1020t">
                                    10 - 20 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="2050t">
                                <label class="form-check-label" for="2050t">
                                    20 - 50 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="50100t">
                                <label class="form-check-label" for="50100t">
                                    50 - 100 Triệu
                                </label>

                            </div>
                        </div>
                    <div class="filter__name">
                            LOẠI MÁY
                        </div>
                    <div class="filter__select">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="pin">
                                <label class="form-check-label" for="pin">
                                    Máy Pin
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Quang">
                                <label class="form-check-label" for="Quang">
                                    Máy Quang
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Co">
                                <label class="form-check-label" for="Co">
                                    Máy Cơ
                                </label>
                            </div>
                        </div>
                    <div class="filter__name">
                            LOẠI DÂY
                        </div>
                    <div class="filter__select">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Da">
                                <label class="form-check-label" for="Da">
                                    Dây Da
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Nhua">
                                <label class="form-check-label" for="Nhua">
                                    Dây Nhựa
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="Vai">
                                <label class="form-check-label" for="Vai">
                                    Dây Vải
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="KL">
                                <label class="form-check-label" for="KL">
                                    Dây Kim Loại
                                </label>
                            </div>
                        </div>
                </div>
            </div>
            <div class="product-cat-right col-9">


                <div class="home-products__container container" id="row">

                </div>

                <nav aria-label="Page navigation example" id="page">

                </nav>

            </div>
        </div>
    </div>

    <footer><jsp:include page="footer.jsp"></jsp:include></footer>

</main>

<script>

    let perPage = 12;
    let currentPage = 1;
    let start = 0;
    let end = perPage;

    let data=null;
    let totalPages=null;

    //load dữ liệu
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "loadproductlist", //Tên servlet
            success:function (result){
                data=result;
                totalPages=Math.ceil(result.length/perPage);
                renderProduct(data);
                renderPage();
            }
        })
    })
    //reder dữ liệu lên trang html
    function renderProduct(result)
    {
        var row = document.getElementById("row")
        row.innerHTML = null;
        var i=0
        var htmlString=``;
        for(let item in result)
        {
            if(item>=start && item<end)
            {

                if(i%4==0){htmlString+=`<div class="row p-5\">`}
                /////////////////////////////////////////////////////
                htmlString+=`<div class="card col border-0 mx-2 overflow-hidden col-md-3" style="width: 18rem;">
                                <div class="discount-tag">-50%</div>
                                <a href="product?id=`+result[item].ID+`" ><img src="Image/`+result[item].Image+`" class="card-img-top overflow-hidden"
                                        alt="..."></a>
                                <div class="card-body text-center">
                                    <h2 class="card-title">FERRARI</h2>
                                    <h4 class="card-title">AG0003S10B</h4>
                                    <p class="card-text card-text__info">Orient Nam - 40.5mm - Kính cứng</p>
                                    <p class="card-prize-old">2.000.000₫</p>
                                    <p class="card-prize-new">1.000.000₫</p>
                                    <a href="product?id=`+result[item].ID+`"class="btn btn-danger btn-buynow">MUA NGAY</a>
                                </div>
                            </div>`
                ////////////////////////////////////////////////////
                i++
                if(i%4==0){htmlString+=`</div>`}
            }
        }
        $('#row').html(htmlString);
    }
    //render page number
    function renderPage()
    {
        var page = document.getElementById("page")
        page.innerHTML = null;
        var htmlString=``;
        if(currentPage==1)
        {
            htmlString+=`<ul class="pagination justify-content-center">
                        <li class="page-item disabled" >
                            <a class="page-link">Trang trước</a>
                        </li>
                        <li class="page-item disabled"><a class="page-link">1</a></li>`
            for(let i=2;i<=totalPages;i++)
            {
                htmlString+=`<li class="page-item" onclick="Changepage(`+i+`)"><a class="page-link">`+i+`</a></li>`
            }
            htmlString+=`<li class="page-item" onclick="Next1()">
                            <a class="page-link" >Trang sau</a>
                        </li>
                    </ul>`
        }
        else if(currentPage==totalPages)
        {
            htmlString+=`<ul class="pagination justify-content-center">
                        <li class="page-item " onclick="Pre1()" >
                            <a class="page-link" >Trang trước</a>
                        </li>`
            for(let i=totalPages-1;i>=1;i--)
            {
                htmlString+=`<li class="page-item" onclick="Changepage(`+i+`)"><a class="page-link" >`+(totalPages-i)+`</a></li>`
            }

            htmlString+=`<li class="page-item disabled"><a class="page-link">`+totalPages+`</a></li>
                        <li class="page-item disabled" onclick="Next1()">
                            <a class="page-link">Trang sau</a>
                        </li>
                    </ul>`
        }
        else {
            htmlString+=`<ul class="pagination justify-content-center">
                        <li class="page-item " onclick="Pre1()" >
                            <a class="page-link" >Trang trước</a>
                        </li>`
            for(let i=1;i<=totalPages;i++)
            {
                if(currentPage==i)
                {
                    htmlString+=`<li class="page-item disabled" onclick="Changepage(`+i+`)"><a class="page-link" >`+i+`</a></li>`
                }
                else
                {
                    htmlString+=`<li class="page-item" onclick="Changepage(`+i+`)"><a class="page-link" >`+i+`</a></li>`
                }

            }
            htmlString+=`<li class="page-item" onclick="Next1()">
                            <a class="page-link" >Trang sau</a>
                        </li>
                    </ul>`
        }
        $('#page').html(htmlString);
    }
    // next page
    function Next1()
    {
        currentPage++;
        if(currentPage>totalPages)
        {
            currentPage=totalPages;
        }
        start=(currentPage-1)*perPage;
        end=currentPage*perPage;
        renderProduct(data);
        renderPage();
    }
    //pre page
    function Pre1()
    {
        currentPage--;
        if(currentPage<1)
        {
            currentPage=1;
        }
        start=(currentPage-1)*perPage;
        end=currentPage*perPage;
        renderProduct(data);
        renderPage();
    }
    //change page
    function Changepage(d)
    {
        currentPage=d;
        start=(currentPage-1)*perPage;
        end=currentPage*perPage;
        console.log(start,end);
        renderProduct(data);
        console.log(data);
        renderPage();
    }
    function GetSearch()
    {
        currentPage = 1;
        start = 0;
        end = perPage;
        var dt = document.getElementById("search1").value
        $.ajax({
            type: "GET",
            url: "loadproductlist?id="+dt, //Tên servlet
            success:function (result){
                data=result;
                totalPages=Math.ceil(result.length/perPage);
                renderProduct(data);
                renderPage();
            }
        })

    }
</script>
<script src="https://unpkg.com/boxicons@2.0.9/dist/boxicons.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"
        integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="assets/js/lib/bootstrap.min.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>