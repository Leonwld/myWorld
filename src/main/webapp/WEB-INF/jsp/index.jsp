<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <%--
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    --%>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
JSP指令&lt;%@ %&gt;:page,taglib,include
<br/>
&lt;%!
 //JSP声明
%&gt;
<br/>
&lt;%
 //JSP代码段或者叫做JSP小脚本
%&gt;
<br/>
&lt;jsp:include page="" /&gt;JSP标准动作
<br/>
&lt;%="JSP表达式" %&gt;
<br/>
  </body>
</html>
