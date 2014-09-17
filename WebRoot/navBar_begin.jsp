<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>后台管理首页</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="css/b-anno.css" type="text/css"
			media="screen" />
		<link href="css/cke.css" rel="stylesheet">
		<link rel="stylesheet" href="css/b-admin.css" type="text/css"
			media="screen" />
		<link rel="stylesheet" href="css/b-question.css" type="text/css"
			media="screen" />
		<link rel="stylesheet" href="css/b-soft.css" type="text/css"
			media="screen" />
		<link rel="stylesheet" href="css/b-exam.css" type="text/css"
			media="screen" />
		<link href="css/b-tkt.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="css/b-xzt.css" type="text/css"
			media="screen" />





		<script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		
		<script src="ckeditor/ckeditor.js"></script>
		
		<!-- jwysiwyg editer -->
		<link rel="stylesheet" href="lib/jquery.wysiwyg.css" type="text/css" />
		<script type="text/javascript" src="lib/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
		<script type="text/javascript" src="lib/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="controls/wysiwyg.image.js"></script>
		<script type="text/javascript" src="controls/wysiwyg.link.js"></script>
		<script type="text/javascript" src="controls/wysiwyg.table.js"></script>

		<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('.context').wysiwyg();
		});
		$('.column').equalHeight();
	});
	function confirmDel(){
			var r = confirm("确定删除该条记录吗？");
			return r;
		}
		
	</script>
		<!--[if lt IE 9]>
		<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>

	<body>

		<header id="header">
		<hgroup>
		<h1 class="site_title">
			管理员
		</h1>
		<h2 class="section_title">
			全国计算机等级考试培训系统后台管理
		</h2>
		<div class="btn_view_site">
			<a class="btn btn-inverse" href="admin/index2chgpas">修改密码</a>
			<a class="btn btn-inverse" href="admin/logout">退出</a>
		</div>
		</hgroup>
		</header>
		<!-- end of header bar -->

		<section id="secondary_bar">
		<div class="user">
			<p>
				${ session.admin.name }
			</p>
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs">
			<a class="current">后台管理</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
		</section>
		<!-- end of secondary bar -->

		<aside id="sidebar" class="column">
		<!--  <form class="quick_search">
				<input type="text" value="" placeholder="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
			</form>-->
		<hr />
		<div class="accordion" id="b-anno-accordion">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="announcement/anywhere2index">
						公告管理<span class="badge pull-right ">＞</span> </a>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="xzt/anywhere2index"> 选择题管理<span
						class="badge pull-right ">＞</span> </a>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="tkt/anywhere2index"> 填空题管理<span
						class="badge pull-right ">＞</span> </a>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="file/anywhere2doc"> 考试资料管理<span
						class="badge pull-right ">＞</span> </a>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="file/anywhere2soft"> 相关软件管理<span
						class="badge pull-right ">＞</span> </a>
				</div>
			</div>

			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="question/anywhere2index">
						常见问题管理<span class="badge pull-right">＞</span> </a>
				</div>
			</div>
			<div
				class="accordion-group ${session.admin.authority==2?'hidden':'' }">
				<div class="accordion-heading">
					<a class="accordion-toggle" href="admin/anywhere2index"> 管理员管理<span
						class="badge pull-right">＞</span> </a>
				</div>
			</div>
		</div>

		<footer>
		<hr />
		<p>
			<strong>Copyright &copy; 2014 中山大学南方学院电子通信与软件工程系</strong>
		</p>
		</footer>
		</aside>
		<!-- end of sidebar -->