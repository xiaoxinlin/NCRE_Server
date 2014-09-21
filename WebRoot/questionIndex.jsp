<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">常见问题列表</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
<div class="spacer"></div>
<article class="module">
<table class="table table-hover">
	<thead>
		<tr>
			<th >
				常见问题
			</th>
			<th style="width:250px;">
				附件
			</th>
			<th style="width:200px;">
				操作
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list.list}" var="i">
			<tr>
				<td>
					${i.title }
				</td>
				<td>
					<a href="file/download?id=${i.file_id }">${i.uri }</a>
				</td>
				
				<td>
					<a name="delete-admin" class="btn" href="question/delete?id=${i.id }" onclick="return confirmDel();">删除</a>
					<a name="update-admin" class="btn"
						href="question/index2update?id=${i.id }">编辑</a>

				</td>
			</tr>
		</c:forEach>
		
	</tbody>
</table>
<div class="b-s-page">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 pull-left">
				<a name="add-question" class="btn" href="question/index2add">添加常见问题</a>
			</div>
			<div class="span8">
				<ul class="pager">
					<li>
						<a
							href="question/getList?pageNow=${list.pageNumber == 1?1:list.pageNumber-1}">上一页</a>
					</li>
					<li>　第&nbsp${list.pageNumber }&nbsp页　 /　 共&nbsp${list.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="question/getList?pageNow=${list.pageNumber == list.totalPage?list.pageNumber:list.pageNumber+1}">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>