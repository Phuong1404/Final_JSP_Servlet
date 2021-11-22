//Load data lên table
 $(document).ready(function(){
    $.ajax({
        type: "GET",
        url: "loadbrand", //Tên servlet
        success:function (result){
            var row=document.getElementById("row")
            row.innerHTML=""
            row.innerHTML+=result;
        }
    })
})
    function Load1(){
    var Name=$("#Search").val();
    if(Name=='')
    {
        $.ajax({
            type: "GET",
            url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand", //Tên servlet
            success:function (result){
                var row=document.getElementById("row")
                row.innerHTML=""
                row.innerHTML+=result;
            }
        })
    }
}
//Insert data
$("#add").click(function (){
    var formData = $("#TOWName3").val(); //Lấy tất cả data trong form
    if(formData!='') {
        console.log(formData)
        $.ajax({
            type: "POST", //với servlet thì sẽ đi vào method doPost
            url: "http://localhost:8082/JSP_servlet_war_exploded/brand", //Tên của class Servlet
            cache: false,
            data: {Name:formData},
            success: function () {
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand", //Tên servlet
                    success: function (result) {
                        var row = document.getElementById("row")
                        row.innerHTML = null;
                        row.innerHTML += result;
                        document.getElementById('TOWName3').value = '';
                    },
                    error: function (request, status, error) {
                        alert(request.responseText);
                    }
                })
            },
                error: function (request, status, error) {
                alert(request.responseText);
            }
        });
    }
})
//render data lên form update
function Update(data) {
    document.getElementById("myForm").style.display = "block";
    document.getElementById("test1").style.display="none";
    $.ajax({
        type: "GET",
        data:{ID:data},
        url: "http://localhost:8082/JSP_servlet_war_exploded/upbrand", //Tên servlet
        success:function (result){
            var row=document.getElementById("row1")
            row.innerHTML="";
            row.innerHTML+=result;
        }
    })
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
    document.getElementById("test1").style.display="block";
}
function Check1()
{
    const text=$("#TOWName1").val()
    if(text=='')
    {
        document.getElementById("uppdate").disabled = true;
    }
    else {
        document.getElementById("uppdate").disabled = false;
    }
}
//Update data
$("#uppdate").click(function (){
    var Name = $("#TOWName1").val(); //Lấy tất cả data trong form
    var ID=$("#TOWID").val();
    $.ajax({
        type: "POST", //với servlet thì sẽ đi vào method doPost
        url: "http://localhost:8082/JSP_servlet_war_exploded/upbrand", //Tên của class Servlet
        cache: false,
        data: {ID:ID,Name:Name},
        success:function (){
            $.ajax({
                type: "GET",
                url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand", //Tên servlet
                success:function (result){
                    document.getElementById("myForm").style.display = "none";
                    document.getElementById("test1").style.display="block";
                    var row=document.getElementById("row")
                    row.innerHTML=null;
                    row.innerHTML+=result;
                    document.getElementById('TOWName1').value='';
                },
                error:function (request, status, error) {
                    alert(request.responseText);
                }

            })
        },
        error:function (request, status, error) {
            alert(request.responseText);
        }
    });
})
//Delete data
function Delete(data){
    var result=confirm("Bạn có chắc là xóa hãng này !!")
    if(result){
        $.ajax({
            type: "GET",
            data: {ID: data},
            url: "http://localhost:8082/JSP_servlet_war_exploded/delbrand", //Tên servlet
            success: function (result) {
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand", //Tên servlet
                    success: function (result) {
                        var row = document.getElementById("row")
                        row.innerHTML = null;
                        row.innerHTML += result;
                    },
                    error: function (request, status, error) {
                        alert(request.responseText);
                    }

                })
            }
        })
    }
    else{
        return false
    }
}
//Search data
function Search1(){
    var Name=$("#Search").val();
    $.ajax({
        type: "GET",
        data:{Name:Name},
        url: "http://localhost:8082/JSP_servlet_war_exploded/searchbrand", //Tên servlet
        success:function (result){
            var row=document.getElementById("row")
            row.innerHTML=""
            row.innerHTML+=result;
        }
    })
}

