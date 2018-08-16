<%@ page contentType="text/html;charset=UTF-8" import="java.io.*" %>
<html>
<head>

<title>簡易メモ帳（文書一覧）</title>
<base target="down" />
</head>
<body>
<h1>簡易メモ帳</h1>
<form method="POST" action="input.jsp">
<table border="0">
<tr>
	<th align="right">読みこみ文書名：</th>
	<td>
	<select name="doc">
	<%
	String strNam;

	File fl=new File(application.getRealPath("/memo/doc"));
	File[] aryFls=fl.listFiles();

	String para1=request.getParameter("proc");

	for(int i=0;i<aryFls.length;i++){
		strNam=aryFls[i].getName();
		out.println("<option value='" + strNam + "'>" + strNam + "</option>");
	}
	%>
	</select>
	</td>
	<td>
		<input type="submit" name="proc" value="読みこみ" />
		<input type="submit" name="proc" value="文書削除" />
	</td>
</tr>
<tr>
	<th align="right">新規文書名：</th>
	<td><input type="text" name="newDoc" size="20" /></td>
	<td><input type="submit" name="proc" value="新規作成" /></td>
</tr>
</table>
</form>
</body>
</html>
