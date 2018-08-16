<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.net.*,java.util.regex.*" %>
<%@ include file="/bin/encode.jsp" %>
<html>
<head>
<title>検索結果</title>
<base target="right" />
</head>
<body>
<div style="font-weight:bold;">検索結果</div>
<ol>
<%

//★★★★★これ入れる
//パラメータ文字化け
request.setCharacterEncoding("UTF-8");

String strDoc="/regex/doc/";
String strKey=request.getParameter("keywd");

//String strKey=strEncode(request.getParameter("keywd"));
	out.println("★strKey : " + strKey);
	out.println("<br>");
	out.print("▲strKey encoded  =    " + URLEncoder.encode(strKey));
	out.println("<br>");


File objFl=new File(application.getRealPath(strDoc));
File[] aryFl=objFl.listFiles();

for(int i=0;i<aryFl.length;i++){

	boolean flag=false;
	File tmpFl=new File(application.getRealPath(strDoc + aryFl[i].getName()));
	//FileReader objFR=new FileReader(tmpFl);
	//BufferedReader objBR=new BufferedReader(objFR);
	BufferedReader objBR = new BufferedReader(new InputStreamReader(new FileInputStream(tmpFl),"UTF-8"));

	Pattern ptn=Pattern.compile(strKey,Pattern.CASE_INSENSITIVE);

	while(objBR.ready()){
		Matcher mtch=ptn.matcher(objBR.readLine());
		if(mtch.find()){
			flag=true;
			break;
		}
	}


	if(flag){
		out.print("<li>");

			out.print("<a href='disp.jsp?doc=" + strDoc + aryFl[i].getName());

			//firefox     ok
			//chorome   ng
			//エンコードして送信する これいらない
			out.print("&keywd=" + URLEncoder.encode(strKey) + "'>");
			//out.print("&keywd=" + strKey + "'>");

			out.print(aryFl[i].getName() + "</a>");

		out.println("</li>");
	}
//パラメータの例
//http://localhost:8080/regex/disp.jsp?doc=/regex/doc/0202_srchEngine.txt&keywd=%E3%83%9D%E3%82%A4%E3%83%B3%E3%83%88


}
%>
</ol>
</body>
</html>
