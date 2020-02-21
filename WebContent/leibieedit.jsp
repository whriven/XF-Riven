<%@page import="leibie.leibie"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	//获取要修改的id
	String strid=request.getParameter("id");
	int id = Integer.parseInt(strid);
	
	//JDBC  查询一条数据
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=UTF-8","root","990128");
	PreparedStatement pst=conn.prepareStatement(" select * from leibie where lid = ? ");
	pst.setInt(1,id);
	ResultSet rst=pst.executeQuery();
	
	leibie lb = new leibie();
	
	while(rst.next()){
		int lid=rst.getInt("lid");
		String name = rst.getString("name");
		String beizhu = rst.getString("beizhu");
		
		lb.setLid(lid);
		lb.setName(name);
		lb.setBeizhu(beizhu);
	}
	conn.close();
%>
<form action="leibieeditsave.jsp" method="post">
<input type="hidden" name="lid" value="<%=lb.getLid() %>"/>
	<p>类别名称：<input type="text" name="name" value="<%=lb.getName() %>"/> </p>
	<p>类别备注: <input type="text" name="beizhu" value="<%=lb.getBeizhu() %>"/> </p>
	<p><input type="submit" value="确认修改"/> </p>
</form>
</body>
</html>