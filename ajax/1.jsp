<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Hello World!</title>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(function() {
    // Ajax通信テスト ボタンクリック
    $("#ajax_btn").click(function() {
        // outputDataを空に初期化
        $("#output_data").text("");
        $.ajax({
            type        : "GET",
            url         : "hello3",
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

// Ajax通信成功時処理
function success(data) {
    alert("success:" + data);

    $("#output_data").text("");
    for (var cnt = 0; cnt < data.length; cnt++) {
        $("#output_data").append("data[" + cnt + "]：" + data[cnt] + "；");
    }
}

// Ajax通信失敗時処理
function error(XMLHttpRequest, textStatus, errorThrown) {
    alert("error:" + XMLHttpRequest);
    alert("status:" + textStatus);
    alert("errorThrown:" + errorThrown);
}
</script>

</head>


<body>


<h1>
    Hello world!
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div id="ajax_data">
    <input type="button" id="ajax_btn" value="Ajax通信テスト" /><br />

    outputData：<span id="output_data"></span>
</div>



</body>
</html>