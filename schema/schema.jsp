<%@ page contentType="text/html;charset=Shift_JIS" import="java.sql.*" %>
<html>
<head>
<title>スキーマ情報表示（検索条件入力）</title>
</head>
<body>
<h1>スキーマ情報表示（検索条件入力）</h1>
<form method="POST" action="disp.jsp">
<select name="tbl">
<%
Class.forName("org.gjt.mm.mysql.Driver");
//Connection db=DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=jsp&password=jsp&useUnicode=true&characterEncoding=Shift_JIS");
Connection db=DriverManager.getConnection("jdbc:mysql://localhost/hc1004_8db?user=root&password=gotanda&useUnicode=true&characterEncoding=UTF-8");

Statement objSql=db.createStatement();
DatabaseMetaData objScm=db.getMetaData();
ResultSet rsTbl=objScm.getTables("hc1004_8db","","%",null);
while(rsTbl.next()){
	out.println("<option value='" + rsTbl.getString("TABLE_NAME") + "'>");
	out.println(rsTbl.getString("TABLE_NAME") + "</option>");
}
db.close();
%>
</select>
<input type="submit" value="情報検索" />
<input type="reset" value="取消" />
</form>
</body>
</html>
