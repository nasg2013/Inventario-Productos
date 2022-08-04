
//CARGA LOS DATOS EN LOS SELECTORES
$(document).ready(function () {

    LoadData();

});

function LoadData() {
    //CARGA LOS TIPOS DE PRODUCTO DESDE EL CATALOGO
    $.ajax({
        url: "/Product/GetProductType",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<option value="' + item.productTypeId + '">' + item.name + '</option> '
            });
            $('#selectType').html(html);

        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    })

    //CARGA LOS TIPOS DE PRICE DESDE EL CATALOGO
    $.ajax({
        url: "/Product/GetPriceType",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<option value="' + item.priceTypeId + '">' + item.name + '</option> '
            });
            $('#selectPriceType').html(html);

        },
        error: function (errorMessage) {
            alert(errorMessage.responseText);
        }
    })

}

//AGREGA UN NUEVO PRODUCTO 
function AddProduct() {

    //LIMPIA CAMPO DE MENSAJES
    $("#message-validate").text("");

    //VALIDACIONES
    if ($("#inputName").val().trim() == "") {
        $("#name-validate").text("Invalid name");
        return;
    }
    $("#name-validate").text("");

    if ($("#inputQuantity").val() <= 0) {
        $("#quantity-validate").text("Invalid quantity");
        return;
    }
    $("#quantity-validate").text("");

    if ($("#inputPrice").val() <= 0) {
        $("#price-validate").text("Invalid price");
        return;
    }
    $("#price-validate").text("");

    //CREA OBJETO PARA ENVIAR AL CONTROLADOR
    var product = {
        productId: 0,
        name: $('#inputName').val(),
        quantity: $('#inputQuantity').val(),
        price: $('#inputPrice').val(),
        typeId: $('#selectType').val(),
        priceTypeId: $('#selectPriceType').val()
    };

    //LLAMA AL METODO DEL CONTROLADOR ENCARGADO DE AGREGAR EL PRODUCTO
    $.ajax({
        url: "/Product/AddProduct",
        data: JSON.stringify(product),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result > 0) {
                $("#inputName").val("");
                $("#inputPrice").val("");
                $("#inputQuantity").val("");
                $("#message-validate").addClass("validClass");
                $("#message-validate").text("Se ha agregado correctamente un nuevo producto");
                LoadData();
            }
        },
        error: function (errorMessage) {
            //alert(errorMessage.responseText);
            $("#message-validate").addClass("invalidClass");
            $("#message-validate").text("No fue posible registrar el producto, intente nuevamente");
        }
    });


}
