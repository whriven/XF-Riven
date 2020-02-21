<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	//获取添加的数据
	String name=request.getParameter("name");
	String beizhu=request.getParameter("beizhu");
	//保存数据
	//JDBC
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=UTF-8","root","990128");
	PreparedStatement pst=conn.prepareStatement(" insert into leibie  value(null,?,?) ");
	pst.setString(1,name);
	pst.setString(2,beizhu);
	pst.executeUpdate();
	conn.close();
	//显示所有的部门信息
%>
<jsp:forward page="leibielist.jsp"></jsp:forward>
</body>
</html>