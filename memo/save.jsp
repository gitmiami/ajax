<%@ page contentType="text/html;charset=UTF-8" import="java.io.*" %>
<%@ include file="/bin/encode.jsp" %>
<%



String p_doc= new String (request.getParameter("doc").getBytes("ISO-8859-1"));
out.println("★p_doc : " + p_doc);
out.println("<br>");
//C:\workspace\src_test\.metadata\.plugins\org.eclipse.wst.server.core\tmp28\wtpwebapps\prto3\memo\doc\aaa.txt

String p_memo= new String (request.getParameter("memo").getBytes("ISO-8859-1"));
out.println("★p_memo : " + p_memo);
out.println("<br>");
//11
//22
//33
//驍ｵ�ｺ郢ｧ�ｽ譌ｺ
//驍ｵ�ｺ�ｽ�ｽ�ｽ�ｽ
//驍ｵ�ｺ�ｽ�ｽ遶包ｽｧ


//FileWriter objFW=new FileWriter(strEncode(request.getParameter("doc")),false);
FileWriter objFW=new FileWriter( p_doc,false);


BufferedWriter objBR=new BufferedWriter(objFW,10);
//objBR.write(strEncode(request.getParameter("memo")));
objBR.write(p_memo);

objBR.close();

response.sendRedirect("index.html");

%>