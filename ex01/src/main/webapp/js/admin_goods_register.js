$(document).ready(function() {
    // 이미지 미리보기
    $("#gdsImg").change(function() {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $(".select_img img").attr("src", e.target.result).width(500);
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

    // 컨트롤러에서 데이터 받기
    var jsonData = categoryJson;
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

    // 1차 분류 선택 시 2차 분류 갱신
    $(document).on("change", "select.category1", function() {
        var cate2Arr = [];
        var selectVal = $(this).val();
        var cate2Select = $("select.category2");

        cate2Select.empty().append("<option value=''>전체</option>");

        for (var i = 0; i < jsonData.length; i++) {
            var cate = jsonData[i];
            if (cate.cateCodeRef === selectVal) {
                cate2Select.append("<option value='" + cate.cateCode + "'>" + cate.cateName + "</option>");
            }
        }
    });
});
