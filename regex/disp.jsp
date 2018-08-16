<%@ page contentType="text/html;charset=UTF-8"
         import="java.io.*,java.util.regex.*" %>
<%@ include file="/bin/encode.jsp" %>
<% String strDoc=strEncode(request.getParameter("doc")); %>
<html>
<head>
<title><%=strDoc%></title>
</head>
<body>
<h1><%=strDoc%></h1>
<hr />
<%
String strKey=strEncode(request.getParameter("keywd"));

FileReader objFR=new FileReader(application.getRealPath(strDoc));
BufferedReader objBR=new BufferedReader(objFR);

Pattern ptn=Pattern.compile(strKey,Pattern.CASE_INSENSITIVE);

while(objBR.ready()){
	String strTmp=htmlEncode(objBR.readLine());

	Matcher objMch=ptn.matcher(strTmp);

	strTmp=objMch.replaceAll("<span style='background-color:#FFFF00'>$0</span>");

	out.println(strTmp);
	out.println("<br />");
}
%>
</body>
</html>
"WebContent/regex/result.jsp"