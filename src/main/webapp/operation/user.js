
    $(document).ready(function(){
    $.ajax({
        type: "GET",
        url: "http://localhost:8082/JSP_servlet_war_exploded/userload", //Tên servlet
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
    url: "http://localhost:8082/JSP_servlet_war_exploded/userload", //Tên servlet
    success:function (result){
    var row=document.getElementById("row")
    row.innerHTML=""
    row.innerHTML+=result;
}
})
}
}
    function Search1()
    {
        $(document).ready(function(){
            var Name=$("#Search").val();
            $.ajax({
                type: "GET",
                data:{Name:Name},
                url: "http://localhost:8082/JSP_servlet_war_exploded/usersearch", //Tên servlet
                success:function (result){
                    var row=document.getElementById("row")
                    row.innerHTML="";
                    row.innerHTML+=result;

                }
            })
        })
    }
<!--Insert-->
    $("#add").click(function (){
    var Name=$("#Name").val()
    var Birth=$("#Birth").val()
    var Address=$("#Address").val()
    var Email=$("#Email").val()
    var Phone=$("#Phone").val()
    var UserName=$("#UserName").val()
    var Password=$("#Password").val()
    if(Name!=''&&Birth!=''&&Address!=''&&Email!=''&&Phone!=''&&UserName!=''&&Password!='') {
    $.ajax({
    type: "POST", //với servlet thì sẽ đi vào method doPost
    url: "http://localhost:8082/JSP_servlet_war_exploded/user", //Tên của class Servlet
    cache: false,
    data: {
    Name: Name,
    Birth: Birth,
    Address: Address,
    Email: Email,
    Phone: Phone,
    UserName: UserName,
    Password: Password
},
    success: function () {
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/userload", //Tên servlet
    success: function (result) {
    var row = document.getElementById("row")
    row.innerHTML = null;
    row.innerHTML += result;
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
    function Delete(data){
    var result=confirm("Bạn có chắc là xóa người dùng này này !!")
    if(result){
    $.ajax({
    type: "GET",
    data: {ID: data},
    url: "http://localhost:8082/JSP_servlet_war_exploded/userdel", //Tên servlet
    success: function (result) {
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/userload", //Tên servlet
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