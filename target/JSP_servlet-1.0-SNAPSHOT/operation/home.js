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
                                <div class="discount-tag">-50%</div>
                                <a href="product?id=${result[item].ID}"><img src="Image/`+result[item].Image+`" class="card-img-top overflow-hidden"
                                        alt="..."></a>
                                <div class="card-body text-center">
                                    <h2 class="card-title">`+result[item].Name+`</h2>
                                    <h4 class="card-title">`+result[item].ID+`</h4>
                                    <p class="card-text card-text__info">40.5mm - Kính cứng</p>
                                    <p class="card-prize-old">`+(result[item].Price*2)+`₫</p>
                                    <p class="card-prize-new">`+(result[item].Price)+`₫</p>
                                    <a href="product?id=${result[item].ID}" class="btn btn-danger btn-buynow">MUA NGAY</a>
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