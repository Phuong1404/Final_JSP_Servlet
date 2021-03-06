<%@ page import="DAO.MyUtils" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Model.Watch" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang>
<% HttpSession session1=request.getSession(); %>
<% MyUtils.dellink(session1); %>
<% Watch w= (Watch) request.getAttribute("watch"); %>
<% DecimalFormat formatter = new DecimalFormat("###,###,###"); %>
<% MyUtils.storelink(session1,"http://localhost:8082/JSP_servlet_war_exploded/product?id="+w.getID()); %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
          integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
          crossorigin="anonymous" />
    <link rel="stylesheet" href="assets/css/style.css">
    <title>${watch.getName()}</title>
</head>

<body>
<main>
    <header><jsp:include page="header.jsp"></jsp:include></header>

    <div class="productDetails grid">
        <div class="row">
            <div class="col-4">
                <div class="fotorama" data-nav="thumbs" data-loop="true">
                    <c:forEach items="${product}" var="item">
                        <a><img src="Image/${item.getImage()}" width="144" height="96"></a>
                    </c:forEach>
                </div>
            </div>
            <div class="col-6 product__info">
                    <div class="product-info__name">${watch.getName()}</div>
                    <span class="card-prize-old"><%= formatter.format(w.getPrice()) %> ???</span>
                    <span class="product-info__discount">-${(watch.getSale())}%</span>
                    <div class="card-prize-new"><%= formatter.format(w.getPrice()-((w.getPrice()*w.getSale())/100)) %> ???</div>

                <div class="product-info__promote">
                    <div class="promote__name">
                        KHUY???N M??I:
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>T???ng g??i B???o hi???m Gold tr??? gi?? 3.000.000??.</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>Freeship m???i l??c, m???i n??i</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>1 ?????i 1 trong v??ng 30 ng??y n???u l???i c???a nh?? s???n xu???t</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>?????n g???p 10 l???n n???u ph??t hi???n fake</span>
                    </div>
                </div>

                <div class="product-info__quality">
                    <span>S??? L?????ng: </span>
                    <div class="number-input">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                class="minus"></button>
                        <input class="quantity" min="0" max="10" name="quantity" id="quantity" value="1" type="number">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                class="plus"></button>
                    </div>
                    <span style="margin-left: 110px;">S??? l?????ng t???n :&nbsp;${watch.getQuantityInStock()} </span>
                </div>

                <a  class="btn btn-danger btn-buynow" onclick="Checkout('${watch.getID()}')" >MUA NGAY</a>
                <a class="btn btn-danger btn-buynow" onclick="AddCart('${watch.getID()}')">TH??M V??O GI??? H??NG</a>

            </div>
        </div>
        <div class="product__tab row">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link link-warning active" id="nav-home-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                            aria-selected="true">TH??NG TIN S???N PH???M</button>
                    <button class="nav-link link-warning" id="nav-profile-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
                            aria-selected="false">CH??? ????? B???O H??NH</button>
                    <button class="nav-link link-warning" id="nav-contact-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                            aria-selected="false">H?????NG D???N S??? D???NG</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <table class="product-tab__details">
                        <tr>
                            <th>Nh??n hi???u:</th>
                            <td>${watch.getTypeOfWatch_Name()}</td>
                        </tr>
                        <tr>
                            <th>Ngu???n g???c:</th>
                            <td>Nh???t B???n</td>
                        </tr>
                        <tr>
                            <th>Gi???i t??nh:</th>
                            <td>Nam</td>
                        </tr>
                        <tr>
                            <th>Lo???i d??y:</th>
                            <td>${watch.getWireType()}</td>
                        </tr>
                        <tr>
                            <th>Lo???i m??y:</th>
                            <td>${watch.getMachineType()}</td>
                        </tr>
                        <tr>
                            <th>B???o hi???m:</th>
                            <td>5 n??m c??? l???i ng?????i d??ng t???i PK Store</td>
                        </tr>
                        <tr>
                            <th>B???o h??nh qu???c t???:</th>
                            <td>2 n??m</td>
                        </tr>
                    </table>
                </div>
                <div class="product-tab__insurance tab-pane fade" id="nav-profile" role="tabpanel"
                     aria-labelledby="nav-profile-tab">
                    <div class="row">
                        <div class="col-1">
                            <img src="assets/img/insurance-logo.jpg" alt="Bao Hanh Gold" width="100px">
                        </div>
                        <div class="col product-tab__insurance-gold">
                            <h2>T???NG K??M G??I B???O H??NH</h2>
                            <h2>B???O HI???M GOLD</h2>
                            <h2>TR??? GI?? 3.000.000 ??</h2>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <h2>B???O HI???M C??? L???I NG?????I D??NG TRONG 5 N??M</h2>
                        <p>Chi ti???t: https://baohiem.pkstore.vn/</p>
                        <h2 class=" mt-5">TRUNG T??M B???O H??NH PKSTORE</h2>
                        <p>- ?????a ch???: S??? 3/4/5 L?? V??n Ch??, Th??? ?????c, H??? Ch?? Minh
                        <p>- ?????a ch???: S??? 3/4/5 V?? Th??? S??u, An Kh??, ???? N???ng
                        <p>- ?????a ch???: S??? 3/4/5 Tr????ng ?????nh, C???u Gi???y, H?? N???i
                        <p>- Hotline: 19000001</p>
                        <p>- Gi??? l??m vi???c: 10h00 - 18h00</p>
                    </div>
                </div>
                <div class="product-tab__guide tab-pane fade" id="nav-contact" role="tabpanel"
                     aria-labelledby="nav-contact-tab">
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        H?????NG D???N V??? SINH ?????NG H??? D??Y DA
                    </h3>
                    <p>- D??ng v???i ???m lau s???ch s??? v?? ????? kh?? ho???c d??ng x?? ph??ng, d???u oliu l??m s???ch.</p>
                    <p>- ????? d??y da c??ng g??i h??t ???m trong h???p k??n ????? kh??? m??i h??i.</p>
                    <p>* Ch?? ??: </p>
                    <p>- Kh??ng n??n x??? n?????c tr???c ti???p v??o d??y da ?????ng h??? v?? s??? l??m d??y da th???m n?????c v?? k??m b???n.</p>
                    <p>- Khi d??y da b??? ???m, kh??ng n??n d??ng m??y s???y v?? d??y ?????ng h??? c?? th??? b??? cong v??nh, c???ng l???i.</p>
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        H?????NG D???N V??? SINH ?????NG H??? D??Y KIM LO???I
                    </h3>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> ?????i v???i ?????ng h??? c??
                        kh??? n??ng ch???ng n?????c t???t:
                    </p>
                    <p>- Chu???n b??? n?????c ???m, nhi???t ????? t???m 50 ????? C, pha v???i m???t ch??t n?????c r???a b??t.</p>
                    <p>- Nh??ng to??n b??? ?????ng h??? v??o dung d???ch n??y, ng??m trong v??ng 3 - 5 ph??t.</p>
                    <p>- S??? d???ng b??n ch???i l??ng m???m c??? r???a c??c k??? h??? tr??n d??y ?????ng h??? r???i r???a l???i b???ng n?????c s???ch.
                    </p>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> ?????i v???i ?????ng h??? c??
                        kh??? n??ng ch???ng n?????c k??m:
                    </p>
                    <p>- L???y m???t chi???c t??m nh??? ????? l???y ??i c??c v???t b???n trong c??c khe h???. </p>
                    <p>- Xoa ?????u kem ????nh r??ng l??n d??y ?????ng h???, s??? d???ng b??n ch???i m???m l??m s???ch r???i r???a l???i v???i n?????c
                        s???ch.</p>
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        H?????NG D???N V??? SINH ?????NG H??? D??Y NATO/D??Y V???I
                    </h3>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Khi d??y v???i b???
                        d??nh d???u m???:
                    </p>
                    <p>- X???t ?????t d??y ?????ng h??? v???i oxi gi??.</p>
                    <p>- R???c ?????u b???t n??? l??n d??y ?????ng h???, d??ng b??n ch???i l??ng m???m c??? s???ch.</p>
                    <p>- Sau 30 ph??t x??? qua n?????c v?? ph??i kh??.</p>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Khi d??y v???i b???
                        d??nh m???c b??t bi:
                    </p>
                    <p>- B??i kem ????nh r??ng v?? x?? ph??ng v??o v???t m???c d??nh tr??n d??y ?????ng h???.</p>
                    <p>- D??ng b??n ch???i l??ng m???m c??? s???ch.</p>
                    <p>- Thoa th??m m???t ??t c???n l??n v???t b???n r???i v?? l???i v???i n?????c s???ch."</p>
                </div>
            </div>
        </div>
    </div>



    <footer class="footer">
        <div class="grid">
            <div class="row">
                <div class="footer__contact margin col">
                    <ul class="footer-contact__list">
                        <li class="footer-contact__item">
                            <i class="material-icons" style=" vertical-align: middle;">phone_in_talk</i>
                            T?? V???N MUA H??NG: 19000001
                        </li>
                        <li class="footer-contact__item">
                            <i class="material-icons" style=" vertical-align: middle;">comment</i>
                            H??? TR??? D???CH V???: 19000002
                        </li>
                        <li class="footer-contact__item">
                            <i class="material-icons" style=" vertical-align: middle;">handyman</i>
                            T?? V???N K??? THU???T: 19000003
                        </li>
                    </ul>
                </div>

                <div class="margin col">
                    <ul class="footer-contact__list">
                        <li class="footer-contact__service footer-contact__localicon-title">
                            CH??M S??C KH??CH H??NG
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">V??? PK Store</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">H?????ng d???n mua h??ng</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Ch??nh s??ch ?????i tr???</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Ch??nh s??ch b???o h??nh</a>
                        </li>
                    </ul>
                </div>

                <div class="margin col">
                    <ul class="footer-contact__list">
                        <li class="footer-contact__localicon footer-contact__localicon-title">
                            ?????A CH???
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            S??? 3/4/5 L?? V??n Ch??, Th??? ?????c, H??? Ch?? Minh
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            S??? 3/4/5 V?? Th??? S??u, An Kh??, ???? N???ng
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            S??? 3/4/5 Tr????ng ?????nh, C???u Gi???y, H?? N???i
                        </li>
                    </ul>
                </div>

                <div class="margin col">
                    <div class="footer-contact__localicon-title">JOIN WITH</div>
                    <div class="footer__join">
                        <a href="#">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png"
                                 alt="">
                        </a>
                        <a href="#">
                            <img
                                    src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png">
                        </a>
                        <a href="#">
                            <img
                                    src="https://www.pngkey.com/png/full/2-27646_twitter-logo-png-transparent-background-logo-twitter-png.png">
                        </a>
                    </div>
                    <img src="assets/img/dathongbao.png" alt="" srcset="">
                </div>
                <span class="footer__license">?? 2018. C??ng ty c??? ph???n PK Store. GPDKKD: 0303217354 do s??? KH & ??T
                        TP.HCM c???p ng??y 02/01/2007. GPMXH: 238/GP-BTTTT do B??? Th??ng Tin v?? Truy???n Th??ng c???p ng??y
                        04/06/2020.</span>
            </div>

        </div>
    </footer>

</main>

<script>
    function AddCart(ID)
    {
        if('${user.getUserID()}'=='')
        {
            window.location="http://localhost:8082/JSP_servlet_war_exploded/login";
        }
        else{
        var a=document.getElementById("quantity").value
        if(a>10)
        {
            alert('S??? l?????ng t???i ??a c?? th??? mua v???i m???i s???n ph???m l?? 10')
        }
        else {
            if(a>${watch.getQuantityInStock()})
            {
                alert('S??? l?????ng s???n ph???m trong kho kh??ng ?????')
            }
            else{
                $.ajax({
                    type: "Post",
                    url: "product", //T??n servlet
                    data:{ID:ID,Quantity:a,Type:1},
                    success:function (res)
                    {
                            alert(res)
                    }
                })
            }
        }

    }
    }
    function Checkout(ID)
    {
        if('${user.getUserID()}'=='')
        {
            window.location="http://localhost:8082/JSP_servlet_war_exploded/login";
        }
        else{
            var a=document.getElementById("quantity").value
            if(a>10)
            {
                alert('S??? l?????ng t???i ??a c?? th??? mua v???i m???i s???n ph???m l?? 10')
            }
            else {
                if(a>${watch.getQuantityInStock()})
                {
                    alert('S??? l?????ng s???n ph???m trong kho kh??ng ?????')
                }
                else{
                    $.ajax({
                        type: "Post",
                        url: "product", //T??n servlet
                        data:{ID:ID,Quantity:a,Type:2},
                        success:function (res)
                        {
                            window.location="http://localhost:8082/JSP_servlet_war_exploded/checkout"
                        }
                    })
                }
            }

        }
    }
</script>
<script src="https://unpkg.com/boxicons@2.0.9/dist/boxicons.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"
        integrity="sha512-nnzkI2u2Dy6HMnzMIkh7CPd1KX445z38XIu4jG1jGw7x5tSL3VBjE44dY4ihMU1ijAQV930SPM12cCFrB18sVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="assets/js/lib/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>