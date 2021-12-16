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
    <title>Tất cả sản phẩm</title>
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
<main>
    <header><jsp:include page="header.jsp"></jsp:include></header>
    <div class="product-main grid">
        <div class="product-brand margin">
            <div class="header-title">Thương hiệu</div>
            <a  class="product-brand__link"><img src="assets/img/brand1.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand2.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand3.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand4.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand5.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand6.png"
                                                         class="product-brand__img"></a>
            <a class="product-brand__link"><img src="assets/img/brand7.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand8.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand9.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand10.png"
                                                         class="product-brand__img"></a>
            <a  class="product-brand__link"><img src="assets/img/brand11.png"
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
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('1')" value="" id="ra1">
                                <label class="form-check-label" for="Rolex">
                                    Rolex
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('2')" value="" id="ra2">
                                <label class="form-check-label" for="Omega">
                                    Omega
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('3')" value="" id="ra3">
                                <label class="form-check-label" for="Hublot">
                                    Hublot
                                </label>
                            </div>
                        </div>
                    <div class="filter__name">
                            MỨC GIÁ
                        </div>
                    <div class="filter__select">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('4')" value="" id="ra4">
                                <label class="form-check-label" for="510t">
                                    5 - 10 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('5')" value="" id="ra5">
                                <label class="form-check-label" for="1020t">
                                    10 - 20 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('6')" value="" id="ra6">
                                <label class="form-check-label" for="2050t">
                                    20 - 50 Triệu
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('7')" value="" id="ra7">
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
                                <input class="form-check-input" type="radio" name="select"onclick="Reload('8')" value="" id="ra8">
                                <label class="form-check-label" for="pin">
                                    Máy Pin
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('9')" value="" id="ra9">
                                <label class="form-check-label" for="Quang">
                                    Máy Quang
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('10')" value="" id="ra10">
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
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('11')" value="" id="ra11">
                                <label class="form-check-label" for="Da">
                                    Dây Da
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" onclick="Reload('12')" value="" id="ra12">
                                <label class="form-check-label" for="Nhua">
                                    Dây Nhựa
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" value="" onclick="Reload('13')" id="ra13">
                                <label class="form-check-label" for="Vai">
                                    Dây Vải
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="select" value="" onclick="Reload('14')" id="ra14">
                                <label class="form-check-label" for="KL">
                                    Dây Kim Loại
                                </label>
                            </div>
                        </div>
                </div>
            </div>
            <div class="product-cat-right col-9" style="min-height: 1000px">


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
    let parameter=<%= request.getParameter("id") %>
    let perPage = 12;
    let currentPage = 1;
    let start = 0;
    let end = perPage;

    let data=null;
    let totalPages=null;

    //load dữ liệu
    $(document).ready(function(){
        if(parameter==null)
        {
            currentPage = 1
            start=0
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
        }
        else{
            currentPage = 1
            start=0
            $.ajax({
                type: "GET",
                url: "loadproductlist?id="+parameter, //Tên servlet
                success:function (result){
                    data=result;
                    console.log(data)
                    if(data.length!=0)
                    {
                        totalPages=Math.ceil(result.length/perPage);
                        renderProduct(data);
                        renderPage();
                    }
                    else{
                        var page = document.getElementById("page")
                        page.innerHTML = null;
                        var row = document.getElementById("row")
                        row.innerHTML = null;
                        row.innerHTML=`<h1 style="margin-left: 300px; margin-top: 70px">Không có sản phẩm nào phù hợp</h1>`
                    }
                    document.getElementById("ra"+parameter).checked=true
                }
            })
        }
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
                htmlString+=`<div class="card col border-0 mx-2 overflow-hidden col-md-3" style="width: 19rem;">
                                <div class="discount-tag">-`+result[item].Sale+`% </div>
                                <a href="product?id=`+result[item].ID+`" ><img src="Image/`+result[item].Image+`" class="card-img-top overflow-hidden"
                                        alt="..."></a>
                                <div class="card-body text-center">
                                    <h2 class="card-title">`+result[item].Name+`</h2>
                                    <h4 class="card-title">`+result[item].ID+`</h4>
                                    <p class="card-text card-text__info">Orient Nam - 40.5mm - Kính cứng</p>
                                    <p class="card-prize-old">`+(result[item].Price).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</p>
                                    <p class="card-prize-new">`+(result[item].Price-((result[item].Price*result[item].Sale)/100)).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</p>
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
    function GetSearch1()
    {
        var dt = document.getElementById("search2").value
        if(dt!='') {
            $.ajax({
                type: "GET",
                url: "loadproductlist?id=" + dt+".", //Tên servlet
                success: function (result) {
                    data = result;
                    currentPage = 1;
                    start=0
                    if(data.length!=0)
                    {
                        totalPages=Math.ceil(result.length/perPage);
                        renderProduct(data);
                        renderPage();
                    }
                    else{
                        var page = document.getElementById("page")
                        page.innerHTML = null;
                        var row = document.getElementById("row")
                        row.innerHTML = null;
                        row.innerHTML=`<h1 style="margin-left: 300px; margin-top: 70px">Không có sản phẩm nào phù hợp</h1>`
                    }
                    for(var it=1;it<=14;it++)
                    {
                        document.getElementById("ra"+it).checked=false
                    }

                }
            })
        }
    }
    function Reload(dat)
    {
        currentPage = 1
        start=0
        $.ajax({
            type: "GET",
            url: "loadproductlist?id="+dat, //Tên servlet
            success:function (result){
                data=result;
                console.log(data)
                if(data.length!=0)
                {
                    totalPages=Math.ceil(result.length/perPage);
                    renderProduct(data);
                    renderPage();
                }
                else{
                    var page = document.getElementById("page")
                    page.innerHTML = null;
                    var row = document.getElementById("row")
                    row.innerHTML = null;
                    row.innerHTML=`<h1 style="margin-left: 300px; margin-top: 70px">Không có sản phẩm nào phù hợp</h1>`
                }
                document.getElementById("ra"+dat).checked=true
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
</body>

</html>