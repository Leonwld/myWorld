<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.it.booksShop.entity.BookInfo"%>
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

		<title>My JSP 'listBooks.jsp' starting page</title>

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
			List list = (List) request.getAttribute("list");
		%>
		<table align="center" cellpadding="5" cellspacing="1" border="1">
			<tr>
				<td>
					书名
				</td>
				<td>
					作者
				</td>
				<td>
					出版社
				</td>
				<td>
					ISBN
				</td>
				<td>
					单价
				</td>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					BookInfo bookInfo = (BookInfo) list.get(i);
			%>
			<tr>
				<td><%=bookInfo.getBookName()%></td>
				<td><%=bookInfo.getAuthor()%></td>
				<td><%=bookInfo.get_public()%></td>
				<td><%=bookInfo.getIsbn()%></td>
				<td><%=bookInfo.getPrice()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>
