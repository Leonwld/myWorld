<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.it.booksShop.entity.BookInfo"%>
<%@page import="com.it.booksShop.dbutil.DbHelper"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'doListBooks.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<%
			String sql = "select id,bookName,author,price,public,isbn from bookInfo;";
			//Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动
			//Connection con = DriverManager
			//		.getConnection("jdbc:mysql://127.0.0.1:3306/mybooksshop",
			//				"root", "123456");//获取链接对象
			//Statement st = con.createStatement();//创建执行对象
			//ResultSet rs = st.executeQuery(sql);//执行查询(select)操作
			DbHelper db = new DbHelper();
			ResultSet rs = db.doQuery(sql);
			//封装数据
			List<BookInfo> list = new ArrayList<BookInfo>();//集合用于二次封装
			while (rs.next()) {
				//封装一条记录为一个对象
				BookInfo bookInfo = new BookInfo();
				bookInfo.setId(rs.getInt("id"));
				bookInfo.setBookName(rs.getString("bookName"));
				bookInfo.setAuthor(rs.getString("author"));
				bookInfo.setPrice(rs.getDouble("price"));
				bookInfo.set_public(rs.getString("public"));
				bookInfo.setIsbn(rs.getString("isbn"));
				list.add(bookInfo);//将封装好的对象放入集合中
			}
			//con.close();
			db.close();
			request.setAttribute("list", list);
			request.getRequestDispatcher("listBooks.jsp").forward(request,
					response);
		%>
	</body>
</html>
