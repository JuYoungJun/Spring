$(document).ready(function() {
    $("#gdsImg").change(function() {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(data) {
                $(".select_img img").attr("src", data.target.result).width(500);
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

    $("#back_Btn").click(function() {
        location.href = "/admin/goods/view?n=" + gdsNum;
    });

    console.log("selectCateCode = " + selectCateCode);
    console.log("selectCateCodeRef = " + selectCateCodeRef);

    if (selectCateCodeRef != null && selectCateCodeRef !== "") {
        console.log("값이 없으면");
        $(".category1").val(selectCateCodeRef);
        $(".category2").val(selectCateCode);
        $(".category2").children().remove();
        $(".category2").append("<option value='" + selectCateCode + "'>" + selectCateName + "</option>");
    } else {
        console.log("값이 있으면");
        $(".category1").val(selectCateCode);
        $(".category2").append("<option value='" + selectCateCode + "' selected='selected'>전체</option>");
    }

    // 컨트롤러에서 데이터 받기
    var jsonData = categoryJson; // 수정된 부분
    console.log(jsonData);

    var cate1Arr = [];

    // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
    for (var i = 0; i < jsonData.length; i++) {
        var cate = jsonData[i];
        cate1Arr.push({
            cateCode: cate.cateCode,
            cateName: cate.cateName
        });
    }

    // 1차 분류 셀렉트 박스에 데이터 삽입
    var cate1Select = $("select.category1");

    for (var i = 0; i < cate1Arr.length; i++) {
        cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>" + cate1Arr[i].cateName + "</option>");
    }

    // 1차 분류 선택 시 2차 분류 업데이트
    $(document).on("change", "select.category1", function() {
        var selectedCateCode = $(this).val();
        var cate2Select = $("select.category2");

        cate2Select.empty().append("<option value=''>전체</option>");

        for (var i = 0; i < jsonData.length; i++) {
            var cate = jsonData[i];
            if (cate.cateCodeRef === selectedCateCode) {
                cate2Select.append("<option value='" + cate.cateCode + "'>" + cate.cateName + "</option>");
            }
        }
    });

    // 페이지 로드 시 1차 분류가 이미 선택되어 있다면, 2차 분류를 업데이트
    if ($("select.category1").val()) {
        $("select.category1").trigger("change");
    }
});
