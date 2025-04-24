<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="problem.DBConnection" %>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.Random" %>
    <%@page import="java.io.IOException" %>
    <%
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Connection conn2 = null;
    PreparedStatement stmt2 = null;
    ResultSet rs2 = null;
   	Random random = new Random();
    
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
<%try{
	conn2 = DBConnection.getConnection();
	String sql2 = "select count(*)+1 from problem";
	stmt2 = conn2.prepareStatement(sql2);
	rs2 = stmt2.executeQuery();
	rs2.next();
	int cnt = rs2.getInt(1);
	int r_val = random.nextInt(cnt);
	
	for(int i =0; i>= 0; i++){
		if(r_val == 0){
		r_val = random.nextInt(cnt);
		}else{
			break;
		}
	}
	
	System.out.println(r_val);
	
	String Ran_val = String.valueOf(r_val);

	conn = DBConnection.getConnection();
	String sql = "select * from problem where p_id = ?";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, Ran_val);
	
	rs = stmt.executeQuery();
	rs.next();
	
	String pro = rs.getString(2);
	String result = rs.getString(3);
	
	%>
	<div class="container">
	<p><%=pro %></p>
	<div>정답 <input type="text" class="input"></div>
	<p class="result dn"><%=result %></p>
	<div>
	<button class="btn">확인</button>
	<button class="btn2">다음문제</button>
	</div>
	<div class="tNf"></div>
	<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
	</div>
</section>
<%@include file="footer.jsp" %>
<script>
const btn = document.querySelector(".btn");
const btn2 = document.querySelector(".btn2");
btn.addEventListener("click",()=>{
	const input = document.querySelector(".input");
	const result = document.querySelector(".result");
	const tnf = document.querySelector(".tNf");
	
	result.classList.remove("dn");
	if(input.value.toLowerCase() == result.textContent.toLowerCase()){
		tnf.textContent = "정답입니다.";
	}else{
		tnf.textContent = "오답입니다.";
	}
})
btn2.addEventListener("click",()=>{
	location.reload(true);
})
</script>
</body>
</html>