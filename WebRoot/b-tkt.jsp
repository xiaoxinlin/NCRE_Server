<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">    
		<title>填空题管理首页</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="css/b-anno.css" type="text/css" media="screen" />
		<link href="css/b-tkt.css" rel="stylesheet" type="text/css">
		
		<script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
		
		<script type="text/javascript">
		    $(function(){
		        $('.column').equalHeight();
		    });
		</script>
		<!--[if lt IE 9]>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
  
  	<body>
		<header id="header">
			<hgroup>
				<h1 class="site_title">管理员</h1>
				<h2 class="section_title">全国计算机等级考试培训系统后台管理</h2>
				<div class="btn_view_site">
					<a class="btn btn-inverse" href="b-update-pass.jsp">修改密码</a>
					<a class="btn btn-inverse" href="">退出</a>
				</div>
			</hgroup>
		</header> <!-- end of header bar -->
		
		<section id="secondary_bar">
			<div class="user">
				<p>${ sessionScope["admin"].name }</p>
			</div>
			<div class="breadcrumbs_container">
				<article class="breadcrumbs"><a class="current">填空题管理</a> <div class="breadcrumb_divider"></div> <%--<a class="current">Dashboard</a>--%></article>
			</div>
		</section><!-- end of secondary bar -->
		
		<aside id="sidebar" class="column">
			<form class="quick_search">
				<input type="text" value="" placeholder="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
			</form>
			<hr/>
			<div class="accordion" id="b-anno-accordion">
				<div class="accordion-group">
				   <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-superadmin-anno.jsp">
					    	  公告管理<span class="badge pull-right ">＞</span>
					    </a>
				    </div>
				</div>
				<div class="accordion-group">
				   <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-xzt.jsp">
					    	  选择题管理<span class="badge pull-right ">＞</span>
					    </a>
				    </div>
				</div>
				<div class="accordion-group">
				   <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-tkt.jsp">
					    	  填空题管理<span class="badge pull-right ">＞</span>
					    </a>
				    </div>
				</div>
				<div class="accordion-group">
				   <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-exam.jsp">
					    	  考试资料管理<span class="badge pull-right ">＞</span>
					    </a>
				    </div>
				</div>
				<div class="accordion-group">
				   <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-soft.jsp">
					    	  相关软件管理<span class="badge pull-right ">＞</span>
					    </a>
				    </div>
				</div>

				<div class="accordion-group">
				    <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-question.jsp">
					      	常见问题管理<span class="badge pull-right">＞</span>
					    </a>
				    </div>
				</div>
				<div class="accordion-group">
				    <div class="accordion-heading">
					    <a class="accordion-toggle" href="b-admin.jsp">
					      	管理员管理<span class="badge pull-right">＞</span>
					    </a>
				    </div>
				</div>
			</div>
		
			<footer>
				<hr />
				<p><strong>Copyright &copy; 2014 中山大学南方学院电子通信与软件工程系</strong></p>
			</footer>
		</aside><!-- end of sidebar -->
		
		<section id="main" class="column">
			<div class="spacer"></div>
			<div class="tkt-btn">
				<div class="btn-toolbar">
				  <div class="btn-group ">
	                 <button class="btn dropdown-toggle" data-toggle="dropdown">一级 <span class="caret"></span></button>
	                 <ul class="dropdown-menu" id="dropdown-menu">
	                   <li><a href="#">计算机基础及WPS Office应用</a></li>
	                   <li><a href="#">计算机基础及MS Office应用</a></li>
	                   <li><a href="#">计算机基础及Photoshop应用</a></li>
	                 </ul>
	              </div>
	              <div class="btn-group ">
	                 <button class="btn dropdown-toggle" data-toggle="dropdown">二级 <span class="caret"></span></button>
	                 <ul class="dropdown-menu" id="dropdown-menu">
	                   <li><a href="#">C语言程序设计</a></li>
	                   <li><a href="#">VB语言程序设计</a></li>
	                   <li><a href="#">VFP数据库程序设计</a></li>
	                   <li><a href="#">Java语言程序设计</a></li>
	                   <li><a href="#">Access语言程序设计</a></li>
	                   <li><a href="#">C++语言程序设计</a></li>
	                   <li><a href="#">MySQL数据库程序设计</a></li>
	                   <li><a href="#">Web程序设计</a></li>
	                   <li><a href="#">MS Office高级应用</a></li>
	                 </ul>
	              </div>
	              <div class="btn-group ">
	                 <button class="btn dropdown-toggle" data-toggle="dropdown">三级 <span class="caret"></span></button>
	                 <ul class="dropdown-menu" id="dropdown-menu">
	                   <li><a href="#">网络技术</a></li>
	                   <li><a href="#">数据库技术</a></li>
	                   <li><a href="#">软件测试技术</a></li>
	                   <li><a href="#">信息安全技术</a></li>
	                   <li><a href="#">嵌入式系统开发技术</a></li>
	                 </ul>
	              </div>
	              <div class="btn-group ">
	                 <button class="btn dropdown-toggle" data-toggle="dropdown">四级 <span class="caret"></span></button>
	                 <ul class="dropdown-menu" id="dropdown-menu">
	                   <li><a href="#">网络工程师</a></li>
	                   <li><a href="#">数据库工程师</a></li>
	                   <li><a href="#">软件测试工程师</a></li>
	                   <li><a href="#">信息安全工程师</a></li>
	                   <li><a href="#">嵌入式系统开发工程师</a></li>
	                 </ul>
	              </div>
				</div>
			 </div>
			<div class="spacer"></div>
			
			<article class="module">
				<table class="table table-bordered">
	                <tr>
	                  <th>题目</th>	                	
	                  <td>用来写文档的可以是_____软件？用来写文档的可以是_____软件？用来写文档的可以是_____软件？</td>
	                  <td rowspan="2">填空题</td>
	                  <td rowspan="2">
	                  	<a name="delete-anno"  class="btn" href="">删除</button>
	                  	<a name="update-anno"  class="btn" href="b-tkt-update.jsp">编辑</button>
	                  </td>
	                </tr>
	                <tr>
	                  <th>答案</th>	                	
	                  <td>Microsoft Office</td>
	                </tr>
	                <tr>
	                  <th>题目</th>	                	
	                  <td>用来写文档的可以是_____软件？</td>
	                  <td rowspan="2">大题</td>
	                  <td rowspan="2">
	                  	<a name="delete-tkt"  class="btn" href="">删除</button>
	                  	<a name="update-tkt"  class="btn" href="b-tkt-update.jsp">编辑</button>
	                  </td>
	                </tr>
	                <tr>
	                  <th>答案</th>	                	
	                  <td>Microsoft Office</td>
	                </tr>
	                <tr>
	                  <th>题目</th>	                	
	                  <td>用来写文档的可以是_____软件？</td>
	                  <td rowspan="2">大题</td>
	                  <td rowspan="2">
	                  	<a name="delete-tkt"  class="btn" href="">删除</button>
	                  	<a name="update-tkt"  class="btn" href="b-tkt-update.jsp">编辑</button>
	                  </td>
	                </tr>
	                <tr>
	                  <th>答案</th>	                	
	                  <td>Microsoft Office</td>
	                </tr>
	                <tr>
	                  <th>题目</th>	                	
	                  <td>用来写文档的可以是_____软件？</td>
	                  <td rowspan="2">大题</td>
	                  <td rowspan="2">
	                  	<a name="delete-tkt"  class="btn" href="">删除</button>
	                  	<a name="update-tkt"  class="btn" href="b-tkt-update.jsp">编辑</button>
	                  </td>
	                </tr>
	                <tr>
	                  <th>答案</th>	                	
	                  <td>Microsoft Office</td>
	                </tr>            
	            </table>
	            <div class="b-s-page">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span2 pull-left"><a name="add-tkt"  class="btn" href="b-tkt-add.jsp">添加填空题</a></div>
							<div class="span8">								
								<ul class="pager">
								  <li><a href="#">上一页</a></li>
								  <li><a href="#">下一页</a></li>
								</ul>	
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>

	</body>
</html>
