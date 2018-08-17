<%@ page language="java" contentType="text/html; charset=Shift_JIS"
    pageEncoding="Shift_JIS"%>
<%
request.setCharacterEncoding("Shift_JIS");
String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type"
              content="text/html; charset=Shift_JIS">
        <title>PAGE</title>
    </head>
    <body>
        ※送信されたメッセージ：<br>
        <%=msg %>
    </body>
</html>