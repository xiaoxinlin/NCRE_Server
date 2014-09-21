<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
	<article class="breadcrumbs">
	<a class="current">文件详情</a>
	<div class="breadcrumb_divider"></div>
	<%--<a class="current">Dashboard</a>--%>
	</article>
</div>
<div style="width: 98%; margin-left: 1%">
	<h3>
		<center>
			${file.title}
		</center>
	</h3>
	<hr>
	<h5>
		<center style="color:#666666;">
			分类：
			<i>${file.type==1?"文档":"软件" }</i>
			&nbsp &nbsp &nbsp&nbsp&nbsp
			创建时间：
			<i>${file.upload_date }</i>
			&nbsp &nbsp &nbsp&nbsp&nbsp
			附件：
			<i><a href="file/download?id=${file.id }" style="color:#666666;">${file.uri }</a>
			</i>
		</center>
	</h5>
	<div style="width: 94%; margin:2% 3%">
		${file.context }
	</div>
</div>
</section>

<script>
	
</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
