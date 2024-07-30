$(document).ready(function() {
    var formObj = $("form[role='form']");

    $("#modify_Btn").click(function() {
        formObj.attr("action", "/admin/goods/modify");
        formObj.attr("method", "get");
        formObj.submit();
    });

    $("#delete_Btn").click(function() {
        formObj.attr("action", "/admin/goods/delete");
        formObj.submit();
    });
});
