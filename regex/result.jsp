<%@ page contentType="text/html;charset=UTF-8"
         import="java.io.*,java.net.*,java.util.regex.*" %>
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

//これ入れる
//パラメータ文字化け
request.setCharacterEncoding("UTF-8");

String strDoc="/regex/doc/";
String strKey=request.getParameter("keywd");
out.println("strKey : " + strKey);
//String strKey=strEncode(request.getParameter("keywd"));



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
			out.print("&keywd=" + URLEncoder.encode(strKey) + "'>");
			out.print(aryFl[i].getName() + "</a>");

		out.println("</li>");
	}


}
%>
</ol>
</body>
</html>
