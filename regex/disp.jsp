<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="java.io.*,java.net.*,java.util.regex.*" %>

<%@ include file="/bin/encode.jsp" %>

<%
//String strDoc=strEncode(request.getParameter("doc"));
	String strDoc=request.getParameter("doc");
	out.println("★strDoc　 : " + strDoc);
	out.println("<br>");

	strDoc="C:\\workspace\\src_test\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp28\\wtpwebapps\\prto3\\" + strDoc;

%>

<html>
<head>
<title><%=strDoc%></title>
</head>
<body>
<h1><%=strDoc%></h1>
<hr />
<%

//★★★★★これ入れる
//パラメータ文字化け
//response.setCharacterEncoding("UTF-8");

//String strKey=strEncode(request.getParameter("keywd"));
//String strKey = new String (request.getParameter("strKey").getBytes("ISO-8859-1"));

//これだと化ける
//String strKey=request.getParameter("keywd");

String strKey= new String (request.getParameter("keywd").getBytes("ISO-8859-1"));
//ng   String strKey= new String (request.getParameter("keywd").getBytes("	Shift-JIS"));

out.println("★strKey : " + strKey);
out.println("<br>");

//strKey=URLDecoder.decode(strKey,"UTF-8");
//strKey=URLDecoder.decode(strKey,"Shift-JIS");
//strKey=URLDecoder.decode(strKey,"ISO-8859-1");
//out.println("★strKey　decoded : " + strKey);

out.println("<br>");
out.println("<br>");


	//FileReader objFR=new FileReader(application.getRealPath(strDoc));
	//BufferedReader objBR=new BufferedReader(objFR);
	BufferedReader objBR = new BufferedReader(new InputStreamReader(new FileInputStream(strDoc),"UTF-8"));



	//strKey="ポイント";

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
