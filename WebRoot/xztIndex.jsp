<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>

<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">选择题列表</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
<div class="spacer"></div>
<div class="xzt-btn">
	<div class="btn-toolbar">
		<div class="btn-group ">
			<button class="btn dropdown-toggle" data-toggle="dropdown">
				一级
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" id="dropdown-menu">
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=0">计算机基础及WPS Office应用</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=1">计算机基础及MS Office应用</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=2">计算机基础及Photoshop应用</a>
				</li>
			</ul>
		</div>
		<div class="btn-group ">
			<button class="btn dropdown-toggle" data-toggle="dropdown">
				二级
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" id="dropdown-menu">
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=3">C语言程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=4">VB语言程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=5">VFP数据库程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=6">Java语言程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=7">Access语言程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=8">C++语言程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=9">MySQL数据库程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=10">Web程序设计</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=11">MS Office高级应用</a>
				</li>
			</ul>
		</div>
		<div class="btn-group ">
			<button class="btn dropdown-toggle" data-toggle="dropdown">
				三级
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" id="dropdown-menu">
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=12">网络技术</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=13">数据库技术</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=14">软件测试技术</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=15">信息安全技术</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=16">嵌入式系统开发技术</a>
				</li>
			</ul>
		</div>
		<div class="btn-group ">
			<button class="btn dropdown-toggle" data-toggle="dropdown">
				四级
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" id="dropdown-menu">
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=17">网络工程师</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=18">数据库工程师</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=19">软件测试工程师</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=20">信息安全工程师</a>
				</li>
				<li>
					<a href="xzt/getDiffSubIndex?subject-type=21">嵌入式系统开发工程师</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="spacer"></div>

<article class="module">
<table class="table table-bordered">
	<c:forEach items="${list.list}" var="i">
		<tr>
		<th style="width:50px;">
			题目
		</th>
		<td style="width:500px;">
			${i.title }
		</td>
		<td rowspan="6" style="width:100px;">
			<a name="delete-xzt" class="btn" href="xzt/delete?id=${i.id }&subject-type=${subjectType}" onclick="return confirmDel();">删除</a>
			<a name="update-xzt" class="btn" href="xzt/index2update?id=${i.id }&subject-type=${subjectType}">编辑</a>
		</td>
	</tr>
	<tr>
		<th style="width:50px;">
			选项A
		</th>
		<td >
			${i.option1 }
		</td>
	</tr>
	<tr>
		<th style="width:50px;">
			选项B
		</th>
		<td >
			${i.option2 }
		</td>
	</tr>
	<tr>
		<th style="width:50px;">
			选项C
		</th>
		<td>
			${i.option3 }
		</td>
	</tr>
	<tr>
		<th style="width:50px;">
			选项D
		</th>
		<td >
			${i.option4 }
		</td>
	</tr>
	<tr>
		<th style="width:50px;">
			答案
		</th>
		<td >
			${i.answer }
		</td>
	</tr>
	</c:forEach>
</table>
<div class="b-s-page">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 pull-left">
				<a name="add-zxt" class="btn" href="xzt/index2add?subject-type=${subjectType}">添加选择题</a>
			</div>
			<div class="span8">
				<ul class="pager">
					<li>
						<a
							href="xzt/getList?pageNow=${list.pageNumber == 1?1:list.pageNumber-1}&subject-type=${subjectType}">上一页</a>
					</li>
					<li>　第&nbsp${list.pageNumber }&nbsp页　 /　 共&nbsp${list.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="xzt/getList?pageNow=${list.pageNumber == list.totalPage?list.pageNumber:list.pageNumber+1}&subject-type=${subjectType}">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
