$(document).ready(function() {
    // 수량 증가 버튼 클릭 시 수량 증가
    $(".plus").click(function() {
        var num = $(".numBox").val();
        var plusNum = Number(num) + 1;
        var maxNum = Number($(".numBox").attr("max"));

        if (plusNum > maxNum) {
            $(".numBox").val(maxNum); // 최대 수량을 초과하지 않도록 설정
        } else {
            $(".numBox").val(plusNum);
        }
    });

    // 수량 감소 버튼 클릭 시 수량 감소
    $(".minus").click(function() {
        var num = $(".numBox").val();
        var minusNum = Number(num) - 1;

        if (minusNum < 1) {
            $(".numBox").val(1); // 최소 수량을 1로 설정
        } else {
            $(".numBox").val(minusNum);
        }
    });
});
