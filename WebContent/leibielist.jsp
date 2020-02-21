<%@page import="java.util.ArrayList"%>
<%@page import="leibie.leibie"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
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
	//获取所有部门的信息
	//JDBC七步走
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=UTF-8","root","990128");
	PreparedStatement pst=conn.prepareStatement("select * from leibie");
	ResultSet rst=pst.executeQuery();

	List<leibie> leibieList = new ArrayList<leibie>();
	
	while(rst.next()){
		int id		= rst.getInt("lid");
		String name = rst.getString("name");
		String beizhu = rst.getString("beizhu");
		leibie lb = new leibie(id,name,beizhu);
		leibieList.add(lb);
	}
	conn.close();
%>
<h1>显示所有类别</h1>

<table border="1">
	<tr>
		<th>类别编号</th>
		<th>类别名称</th>
		<th>类别备注</th>
		<th>修改类别</th>
		<th>删除类别</th>
	</tr>
	
<%
	//遍历集合
	for(leibie d : leibieList){
%>		
	<tr>
		<td><%=d.getLid()%></td>
		<td><%=d.getName() %></td>
		<td><%=d.getBeizhu() %></td>
		<td><a href="leibieedit.jsp?id=<%=d.getLid()%>">修改</a></td>
		<td><a href="leibiedelete.jsp?id=<%=d.getLid()%>">删除</a></td>
	</tr>
<%		
	}
%>
</table>

</body>
</html>