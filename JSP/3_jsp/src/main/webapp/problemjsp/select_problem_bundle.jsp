<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="problem.DBConnection" %>
    <%@page import="java.sql.*" %>
    <%
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<table>
<tr class="tr">
<td>번호</td>
<td>문제</td>
<td>답</td>
</tr>
<%

try{
	conn = DBConnection.getConnection();
	String sql = "select * from problem";
	stmt = conn.prepareStatement(sql);
	rs = stmt.executeQuery();
	while(rs.next()){
		String no = rs.getString(1);
		String problem = rs.getString(2);
		String result = rs.getString(3);
%>
<tr class="tr">
<td><%=no %></td>
<td class="td2"><%=problem %></td>
<td><%=result %></td>
</tr>
<%}}catch(SQLException e){
	e.printStackTrace();
} %>
</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>