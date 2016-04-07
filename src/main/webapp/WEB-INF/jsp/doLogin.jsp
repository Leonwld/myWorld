<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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

		<title>My JSP 'doLogin.jsp' starting page</title>

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
			//处理中文编码
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			//文本框取值
			String userName = request.getParameter("uName");//用户在文本框中输入的用户名
			String userPass = request.getParameter("uPass");//用户在密码框中输入的密码
			System.out.println("用户输入的数据，用户名是[" + userName + "]，密码是[" + userPass
					+ "]。");
			//JDBC的操作
			//Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动
			//Connection con = DriverManager
			//		.getConnection("jdbc:mysql://127.0.0.1:3306/mybooksshop",
			//				"root", "123456");//获取链接对象
			//Statement st = con.createStatement();//创建执行对象
			String sql = "select userName,passWord from userinfo";
			sql += " where userName='" + userName + "'";
			sql += " and passWord='" + userPass + "';";
			DbHelper db = new DbHelper();//代码更新
			ResultSet rs = db.doQuery(sql);//代码更新
			//ResultSet rs = st.executeQuery(sql);//执行查询(select)操作
			//st.executeUpdate(sql);//执行非查询操作(insert/delete/update)操作
			String msg = "";
			if (rs.next()) {
				String dbUserName = rs.getString("userName");//数据库中查询的用户名
				String dbPassWord = rs.getString("passWord");//数据库中查询的密码
				if (userName.equals(dbUserName) && userPass.equals(dbPassWord)) {
					msg = "登陆成功";
					System.out.println(msg);
				}
			} else {
				msg = "登录失败";
				System.out.println(msg);
				//request.getRequestDispatcher("index.jsp").forward(request,response);
			}
			db.close();//代码更新
			request.setAttribute("message", msg);
			request.getRequestDispatcher("welcome.jsp").forward(request,
					response);
		%>
	</body>
</html>
