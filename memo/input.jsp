<%@page import="javax.print.Doc"%>
<%@ page contentType="text/html;charset=UTF-8" import="java.io.*" %>
<%@ include file="/bin/encode.jsp" %>
<html>
<head>
<title>簡易メモ帳（メモ入力）</title>
<base target="_parent" />
</head>
<body>
<form method="POST" action="save.jsp">
<%

//String gPara =request.getParameter("doc");

String p_doc= new String (request.getParameter("doc").getBytes("ISO-8859-1"));
out.println("★p_doc : " + p_doc);
out.println("<br>");


String p_newDoc= new String (request.getParameter("newDoc").getBytes("ISO-8859-1"));
out.println("★p_doc : " + p_newDoc);
out.println("<br>");

String proc= new String (request.getParameter("proc").getBytes("ISO-8859-1"));
out.println("★proc : " + proc);
out.println("<br>");

String rep_proc = request.getParameter("proc");
out.println("★rep_proc : " + rep_proc);
out.println("<br>");

String enc_proc=strEncode(rep_proc);
out.println("★enc_proc : " + enc_proc);
out.println("<br>");

String proc_1 = proc.substring(0,1);
out.println("★proc_1 : " + proc_1);
out.println("<br>");


////////////////////////////////////////////////////////////////////////////////////////////////////


//String strTmp = application.getRealPath("/memo/doc/" + strEncode(request.getParameter("doc")));
String strTmp=application.getRealPath("/memo/doc/" + p_doc);

//化ける
//C:\workspace\src_test\.metadata\.plugins\org.eclipse.wst.server.core\tmp28\wtpwebapps\prto3\memo\doc\邁｡譏薙Γ繝｢蟶ｳ繧ｵ繝ｳ繝励Ν
//C:\workspace\src_test\.metadata\.plugins\org.eclipse.wst.server.core\tmp28\wtpwebapps\prto3\memo\doc\簡易メモ帳サンプル


File objFle=new File(strTmp);


if(proc_1.equals("読")){
	if(objFle.exists()){
		out.print("<textarea name='memo' cols='100' rows='50'>");

		//FileReader objFR=new FileReader(strTmp);
		//BufferedReader objBR=new BufferedReader(objFR);
		BufferedReader objBR = new BufferedReader(new InputStreamReader(new FileInputStream(objFle),"UTF-8"));

		while(objBR.ready()){
			out.println(objBR.readLine());
		}
		out.print("</textarea>");
		objBR.close();
	}else{
		out.close();
	}

}else if(proc_1.equals("文")){
	if(objFle.exists()){
		objFle.delete();
	}
	out.println("<script language='JavaScript'>");
	out.println("parent.location.href='index.html';");
	out.println("</script>");


}else if(proc_1.equals("新")){
	//strTmp=application.getRealPath("/memo/doc/" + strEncode(request.getParameter("newDoc")));
	strTmp=application.getRealPath("/memo/doc/" + p_newDoc);

	objFle=new File(strTmp);
	if(!objFle.exists()){
		objFle.createNewFile();
		out.print("<textarea name='memo' cols='80' rows='20'>");
		out.print("</textarea>");
	}else{
		out.println("<div style='color:#FF0000'>");
		out.println("！！警告！！同名のファイルが既に存在します</div>");
		out.close();
	}

}


//switch(proc){
//
//case '読' :
//		if(objFle.exists()){
//			out.print("<textarea name='memo' cols='100' rows='50'>");
//
//			//FileReader objFR=new FileReader(strTmp);
//			//BufferedReader objBR=new BufferedReader(objFR);
//			BufferedReader objBR = new BufferedReader(new InputStreamReader(new FileInputStream(objFle),"UTF-8"));
//
//			while(objBR.ready()){
//				out.println(objBR.readLine());
//			}
//			out.print("</textarea>");
//			objBR.close();
//		}else{
//			out.close();
//		}
//		break;
//	case '文' :
//		if(objFle.exists()){
//			objFle.delete();
//		}
//		out.println("<script language='JavaScript'>");
//		out.println("parent.location.href='index.html';");
//		out.println("</script>");
//		break;
//	case '新' :
//		strTmp=application.getRealPath("/memo/doc/" + strEncode(request.getParameter("newDoc")));
//		objFle=new File(strTmp);
//		if(!objFle.exists()){
//			objFle.createNewFile();
//			out.print("<textarea name='memo' cols='80' rows='20'>");
//			out.print("</textarea>");
//		}else{
//			out.println("<div style='color:#FF0000'>");
//			out.println("！！警告！！同名のファイルが既に存在します</div>");
//			out.close();
//		}
//		break;
//}


%>
<br />
<input type="hidden" name="doc" value="<%=strTmp %>" />
<input type="submit" value="保存" />
</form>
</body>
</html>
