<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//删除
	//获取要删除的id
	String strid=request.getParameter("id");
	int id = Integer.parseInt(strid);
	//JDBC
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=UTF-8","root","990128");
	PreparedStatement pst=conn.prepareStatement(" delete from leibie where lid = ? ");
	pst.setInt(1,id);
	pst.executeUpdate();
	conn.close();
%>
<!-- 跳转到显示全部部门 -->
<jsp:forward page="leibielist.jsp"></jsp:forward>
</body>
</html>