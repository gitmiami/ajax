<%@ page contentType="text/html;charset=UTF-8"
        import="java.util.*,java.sql.*" %>
<html>
<head>
<title>スキーマ情報表示</title>
</head>
<body>
<h1><%="テーブル名：" + request.getParameter("tbl")%></h1>
<table border="1">
<tr>
	<th>No.</th><th>フィールド名</th><th>データ型</th><th>最大バイト数</th>
	<th>小数点以下</th><th>デフォルト値</th><th>主キー</th><th>Is Null</th>
</tr>
<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection db=DriverManager.getConnection("jdbc:mysql://localhost/hc1004_8db?user=root&password=gotanda&useUnicode=true&characterEncoding=UTF-8");

DatabaseMetaData objScm=db.getMetaData();
ResultSet rs=objScm.getColumns("hc1004_8db",null,request.getParameter("tbl"),"%");

ArrayList aryPk=new ArrayList();

ResultSet objPk=objScm.getPrimaryKeys("hc1004_8db",null,request.getParameter("tbl"));

while(objPk.next()){
	aryPk.add(objPk.getString("COLUMN_NAME"));
}


while(rs.next()){
%>
	<tr>
	<td><%=rs.getString("ORDINAL_POSITION")%></td>
	<td><%=rs.getString("COLUMN_NAME")%></td>
	<td><%=rs.getString("TYPE_NAME")%></td>
	<td align="right"><%=rs.getString("COLUMN_SIZE")%>Byte</td>
	<td align="right"><%=rs.getString("DECIMAL_DIGITS")%></td>
	<td><%=rs.getString("COLUMN_DEF")%><br /></td>
	<td align="center">
		<%=aryPk.contains(rs.getString("COLUMN_NAME")) ? "〇" : "<br />" %>
	</td>
	<td><%=rs.getString("IS_NULLABLE")%></td>
	</tr>
<%
}
db.close();
%>
</table>
</body>
</html>
