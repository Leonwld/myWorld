<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
    <%
    AccountBean account = (AccountBean)session.getAttribute("account");
    %>
    username:<%= account.getUsername()%>
     <br>
     password:<%= account.getPassword() %>
  </body>
</html>