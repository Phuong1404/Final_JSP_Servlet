//update password
    $("#add").click(function (){
    var old=document.getElementById("old").value
    var pass1=document.getElementById("pass1").value
    var pass2=document.getElementById("pass2").value
    $.ajax({
    type: "POST", //với servlet thì sẽ đi vào method doPost
    url: "http://localhost:8082/JSP_servlet_war_exploded/changepass", //Tên của class Servlet
    cache: false,
    data: {
    old:old,pass1:pass1,pass2:pass2
},
    success: function () {
    window.location.replace('http://localhost:8082/JSP_servlet_war_exploded/login')
}
})
})
