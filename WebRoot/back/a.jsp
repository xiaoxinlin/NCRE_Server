<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
	
	<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

  	<script type="text/javascript">
	  	$(document).ready(function(){
	  	  $("button").click(function(){
	  	    $("#div1").fadeToggle();
	  	    $("#div2").fadeToggle("slow");
	  	    $("#div3").fadeToggle(3000);
	  	  });
	  	});
	</script>
	</head>
	<body>
		<p>演示带有不同参数的 fadeToggle() 方法。</p>
		<button>点击这里，使三个矩形淡入淡出</button>
		<br><br>
		<div id="div1" style="width:80px;height:80px;background-color:red;"></div>
		<br>
		<div id="div2" style="width:80px;height:80px;background-color:green;"></div>
		<br>
		<div id="div3" style="width:80px;height:80px;background-color:blue;"></div>
	</body>
</html>