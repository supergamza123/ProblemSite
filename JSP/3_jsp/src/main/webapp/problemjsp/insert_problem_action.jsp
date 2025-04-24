<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="problem.DBConnection"%>
<%@page import="java.sql.*"%>
<%
String problem = request.getParameter("problem");
String no = request.getParameter("no");
String result = request.getParameter("result");

Connection conn = null;
PreparedStatement stmt = null;

try{
	
	conn = DBConnection.getConnection();
	String sql = "insert into problem values(?,?,?)";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, no);
	stmt.setString(2, problem);
	stmt.setString(3, result);
	
	stmt.executeUpdate();
	

	
}catch(SQLException e){
	e.printStackTrace();
}

%>
<jsp:forward page="index.jsp"></jsp:forward>>