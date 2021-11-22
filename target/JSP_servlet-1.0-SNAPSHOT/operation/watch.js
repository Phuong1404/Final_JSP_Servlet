
    //Load data
    $(document).ready(function(){
    $.ajax({
        type: "GET",
        url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
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
    url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
    success:function (result){
    var row=document.getElementById("row")
    row.innerHTML=""
    row.innerHTML+=result;
}
})
}
}
    //Load data combobox
    $(document).ready(function(){
    $.ajax({
        type: "GET",
        url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand1", //Tên servlet
        success:function (result){
            var row=document.getElementById("Brand")
            row.innerHTML+=result;
        }
    })
})
    //Delete data
    function Delete(data){
    var result=confirm("Bạn có chắc là xóa đồng hồ này !!")
    if(result){
    $.ajax({
    type: "GET",
    data: {ID: data},
    url: "http://localhost:8082/JSP_servlet_war_exploded/delwatch", //Tên servlet
    success: function (result) {
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
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
    //Update data
    $("#upd").click(function (){
    var ID=$("#ID1").val()
    var Name=$("#Name1").val() //Lấy tất cả data trong form
    var Brand=$("#Brand1").find(":selected").val();
    var Machine=$("#Machine1").find(":selected").val();
    var Wire=$("#Wire1").find(":selected").val();
    var Piece=$("#Piece1").val()
    var QuantityInStock=$("#QuantityInStock1").val()
    if(Name!=''&&Piece!=''&&QuantityInStock!='') {
    $.ajax({
    type: "POST", //với servlet thì sẽ đi vào method doPost
    url: "http://localhost:8082/JSP_servlet_war_exploded/upwatch", //Tên của class Servlet
    cache: false,
    data: {
    ID: ID,
    Name: Name,
    Brand: Brand,
    Machine: Machine,
    Wire: Wire,
    Piece: Piece,
    QuantityInStock: QuantityInStock
},
    success: function () {
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
    success: function (result) {
    var row = document.getElementById("row")
    row.innerHTML = null;
    row.innerHTML += result;
    document.getElementById("myForm2").style.display = "none";
    document.getElementById("test1").style.display = "block";
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
    //Insert data
    $("#add").click(function (){
    var Name=$("#Name").val() //Lấy tất cả data trong form
    var Brand=$("#Brand").find(":selected").val();
    var Machine=$("#Machine").find(":selected").val();
    var Wire=$("#Wire").find(":selected").val();
    var Piece=$("#Piece").val()
    var QuantityInStock=$("#QuantityInStock").val()
    ////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////
    if(Name!=''&&Piece!=''&&QuantityInStock!='') {
    $.ajax({
    type: "POST", //với servlet thì sẽ đi vào method doPost
    url: "http://localhost:8082/JSP_servlet_war_exploded/watch", //Tên của class Servlet
    cache: false,
    enctype : 'multipart/form-data',
    contentType:false,
    data: {Name:Name,Brand:Brand,Machine:Machine,Wire:Wire,Piece:Piece,QuantityInStock:QuantityInStock},
    processData: false,
    success: function () {
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/watchload", //Tên servlet
    success: function (result) {
    var row = document.getElementById("row")
    row.innerHTML = null;
    row.innerHTML += result;
    document.getElementById("myForm1").style.display = "none";
    document.getElementById("test1").style.display = "block";
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
    function closeFormEdit() {
    document.getElementById("myForm2").style.display = "none";
    document.getElementById("test1").style.display="block";
}

    function openFormInsert() {
    document.getElementById("myForm1").style.display = "block";

    document.getElementById("test1").style.display="none";
}

    function closeFormInsert() {
    document.getElementById("myForm1").style.display = "none";
    document.getElementById("test1").style.display="block";
}
    function Search1()
    {
        $(document).ready(function(){
            var Name=$("#Search").val();
            $.ajax({
                type: "GET",
                data:{Name:Name},
                url: "http://localhost:8082/JSP_servlet_war_exploded/watchsearch", //Tên servlet
                success:function (result){
                    var row=document.getElementById("row")
                    row.innerHTML="";
                    row.innerHTML+=result;

                }
            })
        })
    }
    function Update(data) {
    document.getElementById("myForm2").style.display = "block";

    document.getElementById("test1").style.display="none";
    $.ajax({
    type: "GET",
    data:{ID:data},
    url: "http://localhost:8082/JSP_servlet_war_exploded/upwatch", //Tên servlet
    success:function (result){
    $.ajax({
    type: "GET",
    url: "http://localhost:8082/JSP_servlet_war_exploded/loadbrand1", //Tên servlet
    success:function (result1){
    var row=document.getElementById("Brand1")
    row.innerHTML+=result1;
    document.getElementById("Brand1").value=result.TypeOfWatch_ID;
}
})
    document.getElementById("ID1").value=result.ID;
    document.getElementById("Name1").value=result.Name;
    document.getElementById("Brand1").value=result.TypeOfWatch_ID;
    document.getElementById("Piece1").value=result.Price;
    document.getElementById("Machine1").value=result.MachineType;
    document.getElementById("Wire1").value=result.WireType;
    document.getElementById("QuantityInStock1").value=result.QuantityInStock;
}
})
}