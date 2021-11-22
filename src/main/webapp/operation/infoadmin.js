//Active form
    function Active1(){
    $("input").prop('disabled', false);
    $("button").prop('disabled', false);
    $("#btn").attr("disabled", true);
}
//update data
    function Update1(){
    $("input").prop('disabled', true);
    $("#btn1").attr("disabled", true);
    $("#btn").attr("disabled", false);
    var ID1=document.getElementById("ID1").value
    var Name1=document.getElementById("Name1").value
    var Day1=document.getElementById("Day1").value
    var Address1=document.getElementById("Address1").value
    var Email1=document.getElementById("Email1").value
    var Phone1=document.getElementById("Phone1").value
    $.ajax({
    type: "POST",
    data:{ID:ID1,Name:Name1,Birth:Day1,Address:Address1,Email:Email1,Phone:Phone1},
    url: "http://localhost:8082/JSP_servlet_war_exploded/infoadmin", //Tên servlet
    success:function()
{
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/loadinfoadmin", //Tên servlet
    success:function (result){
    var Name3=document.getElementById("Name3")
    var UserID3=document.getElementById("UserID3")
    var Name1=document.getElementById("Name1")
    var Day1=document.getElementById("Day1")
    var Address1=document.getElementById("Address1")
    var Email1=document.getElementById("Email1")
    var Phone1=document.getElementById("Phone1")
    Name1.value=result.Name;
    Day1.value=result.DateOfBirth;
    Address1.value=result.Address;
    Email1.value=result.Email;
    Phone1.value=result.PhoneNumber;
    Name3.innerHTML="";
    Name3.append(result.Name)
}
})
}
})
}
//render data
    $(document).ready(function(){
    $.ajax({
        type: "GET",
        url: "http://localhost:8082/JSP_servlet_war_exploded/loadinfoadmin", //Tên servlet
        success:function (result){
            var ID1=document.getElementById("ID1")
            var Name3=document.getElementById("Name3")
            var UserID3=document.getElementById("UserID3")
            var Name1=document.getElementById("Name1")
            var Day1=document.getElementById("Day1")
            var Address1=document.getElementById("Address1")
            var Email1=document.getElementById("Email1")
            var Phone1=document.getElementById("Phone1")
            ID1.value=result.ID;
            Name1.value=result.Name;
            Day1.value=result.DateOfBirth;
            Address1.value=result.Address;
            Email1.value=result.Email;
            Phone1.value=result.PhoneNumber;
            Name3.innerHTML="";
            Name3.append(result.Name)
            UserID3.append(result.ID)
        }
    })
})