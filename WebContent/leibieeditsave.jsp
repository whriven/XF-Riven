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
	//获取修改之后的数据
	String id = request.getParameter("lid");
	int lid = Integer.parseInt(id);
	String name = request.getParameter("name");
	String beizhu = request.getParameter("beizhu");
	//JDBC
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=UTF-8","root","990128");
	PreparedStatement pst=conn.prepareStatement(" update leibie set name =? ,beizhu=? where lid =? ");
	pst.setString(1,name);
	pst.setString(2,beizhu);
	pst.setInt(3,lid);
	pst.executeUpdate();%>
	<jsp:forward page="leibielist.jsp"></jsp:forward>
	<% 
	conn.close();
%>
</body>
</html>