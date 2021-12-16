<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

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
    <link rel="stylesheet" href="assets/css/lib/bootstrap.min.css">
    <title>Website cung cấp đồng hồ chính hãng hàng đầu thế giới</title>
</head>

<body>
<main>
    <header><jsp:include page="header.jsp"></jsp:include></header>
    <div class="home grid">
        <div class="home__slider">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="">
                            <img src="assets/img/slider1.jpg" class="d-block w-100 img-responsive" alt="#">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href="">
                            <img src="assets/img/slider2.jpg" class="d-block w-100 img-responsive" alt="#">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a href="">
                            <img src="assets/img/slider4.jpg" class="d-block w-100 img-responsive" alt="#">
                        </a>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="home__products margin">
            <div class="home-products__header">
                <span class="header-title">Sản phẩm nổi bật nhất</span>
                <div class="home-products__header-list">
                    <span class="badge rounded-pill home-products__header-item"><a href="${pageContext.request.contextPath}/productlist?id=1">Rolex</a></span>
                    <span class="badge rounded-pill home-products__header-item"><a href="${pageContext.request.contextPath}/productlist?id=2">Hublot</a></span>
                    <span class="badge rounded-pill home-products__header-item"><a href="${pageContext.request.contextPath}/productlist?id=3">Omega</a></span>
                    <span class="badge rounded-pill home-products__header-item"><a href="${pageContext.request.contextPath}/productlist">Xem tất cả...</a></span>
                </div>
            </div>

            <div class="home-products__container container" id="row">

            </div>
        </div>

        <div class="home__feedback margin">
            <span class="header-title mt-5">KHÁCH HÀNG NÓI VỀ CHÚNG TÔI</span>
            <div class="testimonial row mt-5">
                <figure class="testimonial__card">
                    <blockquote>Calvin: You know sometimes when I'm talking, my words can't keep up with my
                        thoughts...
                        I wonder why we think faster than we speak. Hobbes: Probably so we can think twice.
                        <div class="arrow"></div>
                    </blockquote>
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample3.jpg"
                         alt="sq-sample3" />
                    <div class="author">
                        <h5>Pelican Steve <span> LIttleSnippets.net</span></h5>
                    </div>
                </figure>
                <figure class="testimonial__card hover">
                    <blockquote>Thank you. before I begin, I'd like everyone to notice that my report is in a
                        professional, clear plastic binder...When a report looks this good, you know it'll get an A.
                        That's a tip kids. Write it down.
                        <div class="arrow"></div>
                    </blockquote>
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg"
                         alt="sq-sample27" />
                    <div class="author">
                        <h5>Max Conversion<span> LIttleSnippets.net</span></h5>
                    </div>
                </figure>
                <figure class="testimonial__card">
                    <blockquote>My behaviour is addictive functioning in a disease process of toxic co-dependency. I
                        need holistic healing and wellness before I'll accept any responsibility for my actions.
                        <div class="arrow"></div>
                    </blockquote>
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample17.jpg"
                         alt="sq-sample17" />
                    <div class="author">
                        <h5>Eleanor Faint<span> LIttleSnippets.net</span></h5>
                    </div>
                </figure>

                <div class="display__more mt-5 mb-5">
                    <a href="">
                        <i class="material-icons search__btn-icon">keyboard_arrow_right</i>
                        <span>XEM TẤT CẢ</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="home__news margin">
            <div class="home-products__header">
                <span class="header-title">PK Store - Tin tức và khuyến mãi</span>
                <div class="home-products__header-list">
                    <span class="badge rounded-pill home-products__header-item"><a href="#">Xem tất cả...</a></span>
                </div>
            </div>
            <div class="home-news__list row mt-5 mb-5">
                <div class="card" style="width: 25rem;">
                    <a href="#">
                        <img src="assets/img/promote2.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <div class="card-body__date mt-3">
                            <i class="material-icons">event</i>
                            <span class="home-news__list--size">01/01/2021</span>
                        </div>
                        <p class="card-text home-news__list--size">Some quick example text to build on the card
                            title and make up the bulk
                            of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">
                    <a href="#">
                        <img src="assets/img/promote3.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <div class="card-body__date mt-3">
                            <i class="material-icons">event</i>
                            <span class="home-news__list--size">01/01/2021</span>
                        </div>
                        <p class="card-text home-news__list--size">Some quick example text to build on the card
                            title and make up the bulk
                            of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">
                    <a href="#">
                        <img src="assets/img/promote4.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <div class="card-body__date mt-3">
                            <i class="material-icons">event</i>
                            <span class="home-news__list--size">01/01/2021</span>
                        </div>
                        <p class="card-text home-news__list--size">Some quick example text to build on the card
                            title and make up the bulk
                            of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">
                    <a href="#">
                        <img src="assets/img/promote1.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <div class="card-body__date mt-3">
                            <i class="material-icons">event</i>
                            <span class="home-news__list--size">01/01/2021</span>
                        </div>
                        <p class="card-text home-news__list--size">Some quick example text to build on the card
                            title and make up the bulk
                            of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="home__partner margin">
            <div class="header-title">thương hiệu đối tác</div>
            <div class="home-partner__marquee mt-5">
                <div class="home-partner__track">
                    <img class="home-partner__img" src="assets/img/lo1.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo2.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo3.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo4.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo5.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo6.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo7.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo8.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo9.png" alt="">
                    <img class="home-partner__img" src="assets/img/lo10.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <footer><jsp:include page="footer.jsp"></jsp:include></footer>
</main>
<script>
    function GetSearch1()
    {
        var da=document.getElementById("search2").value

        window.location="http://localhost:8082/JSP_servlet_war_exploded/productlist?id='"+da+"'"
    }
</script>


<script src="https://unpkg.com/boxicons@2.0.9/dist/boxicons.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"
        integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://pagination.js.org/dist/2.1.5/pagination.min.js"></script>
<script src="assets/js/lib/bootstrap.min.js"></script>
<script>
    //Load data lên trang home bằng ajax
    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "loadhome", //Tên servlet
            success:function (result){
                renderProduct(result);
            }
        })
    })
    //render dữ liệu lấy từ ajax lên html
    function renderProduct(result)
    {
        var i=0
        var htmlString=``;
        for(let item in result)
        {

            if(i%4==0){htmlString+=`<div class="row p-5\">`}
            /////////////////////////////////////////////////////
            htmlString+=`<div class="card col border-0 mx-2 overflow-hidden Col-md-3" style="width: 18rem;">
                                <div class="discount-tag">-`+result[item].Sale+`% </div>
                                <a href="product?id=`+result[item].ID+`"><img src="Image/`+result[item].Image+`" class="card-img-top overflow-hidden"
                                        alt="..."></a>
                                <div class="card-body text-center">
                                    <h2 class="card-title">`+result[item].Name+`</h2>
                                    <h4 class="card-title">`+result[item].ID+`</h4>
                                    <p class="card-text card-text__info">40.5mm - Kính cứng</p>
                                    <p class="card-prize-old">`+(result[item].Price).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</p>
                                    <p class="card-prize-new">`+(result[item].Price-((result[item].Price*result[item].Sale)/100)).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})+`</p>
                                    <a href="product?id=`+result[item].ID+`" class="btn btn-danger btn-buynow">MUA NGAY</a>
                                </div>
                            </div>`
            ////////////////////////////////////////////////////
            i++
            if(i%4==0){htmlString+=`</div>`}
        }
        htmlString+=`<div class="display__more mt-5 mb-5">
                        <a href="http://localhost:8082/JSP_servlet_war_exploded/productlist">
                            <i class="material-icons search__btn-icon">keyboard_arrow_right</i>
                            <span>XEM TẤT CẢ SẢN PHẨM</span>
                        </a>
                    </div>`;
        $('#row').html(htmlString);
    }
</script>
</body>

</html>