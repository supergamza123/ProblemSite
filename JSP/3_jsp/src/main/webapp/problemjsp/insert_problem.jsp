<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="problem.DBConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Page Title</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>
    <section>
    <form class="form" action="insert_problem_action.jsp" method="get">
    <table>
    <caption><h2>문제 등록</h2></caption>
<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
conn = DBConnection.getConnection();
String sql = "select max(p_id)+1 from problem";
stmt = conn.prepareStatement(sql);
rs = stmt.executeQuery();
rs.next();
String no = rs.getString(1);

%>
    <tr >
    <td class="pro">문제</td>
    <td><textarea required name="problem" class="problem"></textarea></td>
    <td><input type="hidden" value="<%=no%>" name="no"></td>
    <%
}
catch(SQLException e){
e.printStackTrace();
}
    %>
    </tr>
     <tr>
    <td>정답</td>
    <td><input type="text" required name="result"></td>
    </tr>
    <tr>
    <td><input type="submit" value="등록"></td>
    </tr>
    </table>
    </form>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>