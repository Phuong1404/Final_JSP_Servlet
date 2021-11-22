<%@ page import="DAO.MyUtils" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Model.Watch" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang>
<% HttpSession session1=request.getSession(); %>
<% MyUtils.dellink(session1); %>
<% Watch w= (Watch) request.getAttribute("watch"); %>
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
                    <span class="card-prize-old">${(watch.getPrice())*2}₫</span>
                    <span class="product-info__discount">-50%</span>
                    <div class="card-prize-new">${watch.getPrice()}₫</div>

                <div class="product-info__promote">
                    <div class="promote__name">
                        KHUYẾN MÃI:
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>Tặng gói Bảo hiểm Gold trị giá 3.000.000đ.</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>Freeship mọi lúc, mọi nơi</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>1 đổi 1 trong vòng 30 ngày nếu lỗi của nhà sản xuất</span>
                    </div>
                    <div>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        <span>Đền gấp 10 lần nếu phát hiện fake</span>
                    </div>
                </div>

                <div class="product-info__quality">
                    <span>Số Lượng: </span>
                    <div class="number-input">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                class="minus"></button>
                        <input class="quantity" min="0" max="10" name="quantity" id="quantity" value="1" type="number">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                class="plus"></button>
                    </div>
                    <span style="margin-left: 110px;">Số lượng tồn :&nbsp;${watch.getQuantityInStock()} </span>
                </div>

                <a  class="btn btn-danger btn-buynow" >MUA NGAY</a>
                <a class="btn btn-danger btn-buynow" onclick="AddCart('${watch.getID()}')">THÊM VÀO GIỎ HÀNG</a>

            </div>
        </div>
        <div class="product__tab row">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link link-warning active" id="nav-home-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                            aria-selected="true">THÔNG TIN SẢN PHẨM</button>
                    <button class="nav-link link-warning" id="nav-profile-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
                            aria-selected="false">CHẾ ĐỘ BẢO HÀNH</button>
                    <button class="nav-link link-warning" id="nav-contact-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                            aria-selected="false">HƯỚNG DẪN SỬ DỤNG</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <table class="product-tab__details">
                        <tr>
                            <th>Nhãn hiệu:</th>
                            <td>${watch.getTypeOfWatch_Name()}</td>
                        </tr>
                        <tr>
                            <th>Nguồn gốc:</th>
                            <td>Nhật Bản</td>
                        </tr>
                        <tr>
                            <th>Giới tính:</th>
                            <td>Nam</td>
                        </tr>
                        <tr>
                            <th>Loại dây:</th>
                            <td>${watch.getWireType()}</td>
                        </tr>
                        <tr>
                            <th>Loại máy:</th>
                            <td>${watch.getMachineType()}</td>
                        </tr>
                        <tr>
                            <th>Bảo hiểm:</th>
                            <td>5 năm cả lỗi người dùng tại PK Store</td>
                        </tr>
                        <tr>
                            <th>Bảo hành quốc tế:</th>
                            <td>2 năm</td>
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
                            <h2>TẶNG KÈM GÓI BẢO HÀNH</h2>
                            <h2>BẢO HIỂM GOLD</h2>
                            <h2>TRỊ GIÁ 3.000.000 Đ</h2>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <h2>BẢO HIỂM CẢ LỖI NGƯỜI DÙNG TRONG 5 NĂM</h2>
                        <p>Chi tiết: https://baohiem.pkstore.vn/</p>
                        <h2 class=" mt-5">TRUNG TÂM BẢO HÀNH PKSTORE</h2>
                        <p>- Địa chỉ: Số 3/4/5 Lê Văn Chí, Thủ Đức, Hồ Chí Minh
                        <p>- Địa chỉ: Số 3/4/5 Võ Thị Sáu, An Khê, Đà Nẵng
                        <p>- Địa chỉ: Số 3/4/5 Trương Định, Cầu Giấy, Hà Nội
                        <p>- Hotline: 19000001</p>
                        <p>- Giờ làm việc: 10h00 - 18h00</p>
                    </div>
                </div>
                <div class="product-tab__guide tab-pane fade" id="nav-contact" role="tabpanel"
                     aria-labelledby="nav-contact-tab">
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        HƯỚNG DẪN VỆ SINH ĐỒNG HỒ DÂY DA
                    </h3>
                    <p>- Dùng vải ẩm lau sạch sẽ và để khô hoặc dùng xà phòng, dầu oliu làm sạch.</p>
                    <p>- Để dây da cùng gói hút ẩm trong hộp kín để khử mùi hôi.</p>
                    <p>* Chú ý: </p>
                    <p>- Không nên xả nước trực tiếp vào dây da đồng hồ vì sẽ làm dây da thấm nước và kém bền.</p>
                    <p>- Khi dây da bị ẩm, không nên dùng máy sấy vì dây đồng hồ có thể bị cong vênh, cứng lại.</p>
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        HƯỚNG DẪN VỆ SINH ĐỒNG HỒ DÂY KIM LOẠI
                    </h3>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Đối với đồng hồ có
                        khả năng chống nước tốt:
                    </p>
                    <p>- Chuẩn bị nước ấm, nhiệt độ tầm 50 độ C, pha với một chút nước rửa bát.</p>
                    <p>- Nhúng toàn bộ đồng hồ vào dung dịch này, ngâm trong vòng 3 - 5 phút.</p>
                    <p>- Sử dụng bàn chải lông mềm cọ rửa các kẽ hở trên dây đồng hồ rồi rửa lại bằng nước sạch.
                    </p>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Đối với đồng hồ có
                        khả năng chống nước kém:
                    </p>
                    <p>- Lấy một chiếc tăm nhỏ để lấy đi các vết bẩn trong các khe hở. </p>
                    <p>- Xoa đều kem đánh răng lên dây đồng hồ, sử dụng bàn chải mềm làm sạch rồi rửa lại với nước
                        sạch.</p>
                    <h3>
                        <box-icon name='check' animation='tada' color='#3a2ede'></box-icon>
                        HƯỚNG DẪN VỆ SINH ĐỒNG HỒ DÂY NATO/DÂY VẢI
                    </h3>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Khi dây vải bị
                        dính dầu mỡ:
                    </p>
                    <p>- Xịt ướt dây đồng hồ với oxi già.</p>
                    <p>- Rắc đều bột nở lên dây đồng hồ, dùng bàn chải lông mềm cọ sạch.</p>
                    <p>- Sau 30 phút xả qua nước và phơi khô.</p>
                    <p>
                        <box-icon name='info-circle' animation='tada' color='#e8d10c'></box-icon> Khi dây vải bị
                        dính mực bút bi:
                    </p>
                    <p>- Bôi kem đánh răng và xà phòng vào vết mực dính trên dây đồng hồ.</p>
                    <p>- Dùng bàn chải lông mềm cọ sạch.</p>
                    <p>- Thoa thêm một ít cồn lên vết bẩn rồi vò lại với nước sạch."</p>
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
                            TƯ VẤN MUA HÀNG: 19000001
                        </li>
                        <li class="footer-contact__item">
                            <i class="material-icons" style=" vertical-align: middle;">comment</i>
                            HỖ TRỢ DỊCH VỤ: 19000002
                        </li>
                        <li class="footer-contact__item">
                            <i class="material-icons" style=" vertical-align: middle;">handyman</i>
                            TƯ VẤN KỸ THUẬT: 19000003
                        </li>
                    </ul>
                </div>

                <div class="margin col">
                    <ul class="footer-contact__list">
                        <li class="footer-contact__service footer-contact__localicon-title">
                            CHĂM SÓC KHÁCH HÀNG
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Về PK Store</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Hướng dẫn mua hàng</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Chính sách đổi trả</a>
                        </li>
                        <li class="footer-contact__service">
                            <a href="#">Chính sách bảo hành</a>
                        </li>
                    </ul>
                </div>

                <div class="margin col">
                    <ul class="footer-contact__list">
                        <li class="footer-contact__localicon footer-contact__localicon-title">
                            ĐỊA CHỈ
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            Số 3/4/5 Lê Văn Chí, Thủ Đức, Hồ Chí Minh
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            Số 3/4/5 Võ Thị Sáu, An Khê, Đà Nẵng
                        </li>
                        <li class="footer-contact__localicon">
                            <i class="material-icons" style=" vertical-align: middle;">location_on</i>
                            Số 3/4/5 Trương Định, Cầu Giấy, Hà Nội
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
                <span class="footer__license">© 2018. Công ty cổ phần PK Store. GPDKKD: 0303217354 do sở KH & ĐT
                        TP.HCM cấp ngày 02/01/2007. GPMXH: 238/GP-BTTTT do Bộ Thông Tin và Truyền Thông cấp ngày
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
            alert('Số lượng tối đa có thể mua với mỗi sản phẩm là 10')
        }
        else {
            if(a>${watch.getQuantityInStock()})
            {
                alert('Số lượng sản phẩm trong kho không đủ')
            }
            else{
                $.ajax({
                    type: "Post",
                    url: "product", //Tên servlet
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
                alert('Số lượng tối đa có thể mua với mỗi sản phẩm là 10')
            }
            else {
                if(a>${watch.getQuantityInStock()})
                {
                    alert('Số lượng sản phẩm trong kho không đủ')
                }
                else{
                    $.ajax({
                        type: "Post",
                        url: "product", //Tên servlet
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