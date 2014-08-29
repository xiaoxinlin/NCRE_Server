<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">    
		<title>添加选择题</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="css/b-anno.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/b-xzt.css" type="text/css" media="screen" />
		<link href="css/cke.css" rel="stylesheet">
		
		<script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
		<script src="ckeditor/ckeditor.js"></script>
		
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
				<article class="breadcrumbs"><a href="b-xzt.jsp">选择题管理</a> <div class="breadcrumb_divider"></div> <a class="current">添加选择题</a></article>
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
			<article class="add-xzt-module">
				<form class="add-xzt-form" method="post" action="b-tkt.jsp">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选择题题目：</h4></label>
		              <div class="controls add-xzt-cke">
		                <textarea name="zxt-add-title" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项A：</h4></label>
		              <div class="controls">
		                <textarea name="xzt-add-answerA" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项B：</h4></label>
		              <div class="controls">
		                <textarea name="xzt-add-answerB" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项C：</h4></label>
		              <div class="controls">
		                <textarea name="xzt-add-answerC" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项D：</h4></label>
		              <div class="controls">
		                <textarea name="xzt-add-answerD" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>答案：</h4></label>
		              <div class="controls">
		              	<select name="xzt-add-answer">
		              		<option value="A">A</option>
		              		<option value="B">B</option>
		              		<option value="C">C</option>
		              		<option value="D">D</option>
		              	</select>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>类型：</h4></label>
		              <div class="controls">
		                <select name="xzt-sub_type">					<%--   22种类型	--%>
		                	<option value="计算机基础及WPS Office应用">计算机基础及WPS Office应用</option>
		                	<option value="计算机基础及MS Office应用">计算机基础及MS Office应用</option>
		                	<option value="计算机基础及Photoshop应用">计算机基础及Photoshop应用</option>
		                	<option value="C语言程序设计">C语言程序设计</option>
		                	<option value="VB语言程序设计">VB语言程序设计</option>
		                	<option value="VFP数据库程序设计">VFP数据库程序设计</option>
		                	<option value="Java语言程序设计">Java语言程序设计</option>
		                	<option value="Access语言程序设">Access语言程序设</option>
		                	<option value="C++语言程序设计">C++语言程序设计</option>
		                	<option value="MySQL数据库程序设计">MySQL数据库程序设计</option>
		                	
		                	<option value="Web程序设计">Web程序设计</option>
		                	<option value="MS Office高级应用">MS Office高级应用</option>
		                	<option value="网络技术">网络技术</option>
		                	<option value="数据库技术">数据库技术</option>
		                	<option value="软件测试技术">软件测试技术</option>
		                	<option value="信息安全技术">信息安全技术</option>
		                	<option value="嵌入式系统开发技术">嵌入式系统开发技术</option>
		                	<option value="网络工程师">网络工程师</option>
		                	<option value="数据库工程师">数据库工程师</option>
		                	<option value="软件测试工程师">软件测试工程师</option>
		                	
		                	<option value="信息安全工程师">信息安全工程师</option>
		                	<option value="嵌入式系统开发工程师">嵌入式系统开发工程师</option>
		                </select>
		              </div>
		            </div>
		            <button type="submit" class="btn" name="xzt-submit " id="xzt-submit">保存</button>
		            <button type="reset" class="btn" name="xzt-add-reset" id="xzt-add-reset">重填</button>
		            <a href="b-xzt.jsp"  class="btn" name="xzt-cancel" id="xzt-cancel">取消</a>
		          </form>
			</article>
		</section>
		
		<script>
			CKEDITOR.inline( 'zxt-add-title' );
			CKEDITOR.inline( 'xzt-add-answerA' );
			CKEDITOR.inline( 'xzt-add-answerB' );
			CKEDITOR.inline( 'xzt-add-answerC' );
			CKEDITOR.inline( 'xzt-add-answerD' );
		</script>
	
	</body>
</html>
