<%@ page contentType="text/html;charset=Shift_JIS" %>

<html>
<head>
<title>Hello World!</title>


<script type="text/javascript">
$(function() {
    // Ajax�ʐM�e�X�g �{�^���N���b�N
    $("#ajax_btn").click(function() {
        // outputData����ɏ�����
        $("#output_data").text("");
        $.ajax({
            type        : "GET",
            url         : "getTestData",
            dataType    : "json",
            success     : function(data) {
                            success(data);
                        },
            error       : function(XMLHttpRequest, textStatus, errorThrown) {
                            error(XMLHttpRequest, textStatus, errorThrown);
                        }
        });
    });
});

// Ajax�ʐM����������
function success(data) {
    alert("success:" + data);

    $("#output_data").text("");
    for (var cnt = 0; cnt < data.length; cnt++) {
        $("#output_data").append("data[" + cnt + "]�F" + data[cnt] + "�G");
    }
}

// Ajax�ʐM���s������
function error(XMLHttpRequest, textStatus, errorThrown) {
    alert("error:" + XMLHttpRequest);
    alert("status:" + textStatus);
    alert("errorThrown:" + errorThrown);
}
</script>


</head>


<body>

aaa


</body>
</html>