<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=100%; initial-scale=1; maximum-scale=1; minimum-scale=1; user-scalable=no;" />
		
		
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="css/b-login.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src=""></script>
      
    <!--[if lt IE 9]>
    <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link href="css/ie.css" type="text/css" rel="stylesheet"/>
    <![endif]-->

  </head>
  
  <body>
	<section>
	    <div class="container">
	        <div class="row">
	            <div class="span12">
	                <div class="row">
	                    <section class="span10 offset1">
	                    	<div class="login-bg">
	                    		<div class="login-form">
		                    		<form class="form-horizontal" action="b-superadmin-anno.jsp">
							            <div class="control-group">
							              <label class="control-label" for="userid">账号：</label>
							              <div class="controls">
							                <input type="text" id="userid">
							              </div>
							            </div>
							            <div class="control-group">
							              <label class="control-label" for="password">密码：</label>
							              <div class="controls">
							                <input type="password" id="password">
							              </div>
							            </div>
							            <div class="control-group">
							              <div class="controls">
							                <button type="submit" class="btn btn-inverse" name="submit">登录</button>
							                <button type="reset" class="btn btn-inverse" name="cancel">取消</button>
							              </div>
							           </div>
							        </form>
						        </div>
	                    	</div>
	                    </section>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
  </body>
</html>
