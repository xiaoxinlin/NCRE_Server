<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">公告列表</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
<div class="spacer"></div>
<article class="module">
<table class="table table-hover">
	<thead>
		<tr>
			<th>
				公告标题
			</th>
			<th>
				上传时间
			</th>
			<th>
				附件
			</th>
			<th>
				操作
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${annoList.list}" var="i">
			<tr>
				<td>
					<a href="announcement/index2detail?id=${i.id }">${i.title }</a>
				</td>
				<td>
					${i.create_date }
				</td>
				<td>
					<a href="file/download?id=${i.file_id }">${i.uri }</a>
				</td>
				<td>
					<a name="delete-anno" class="btn"
						href="announcement/delete?id=${i.id }" onclick="return confirmDel();">删除</a>
					<a name="update-anno" class="btn"
						href="announcement/index2update?id=${i.id }">编辑</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="b-s-page">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 pull-left">
				<a name="add-anno" class="btn" href="announcement/index2add">添加公告</a>
			</div>
			<div class="span8">
				<ul class="pager">
					<li>
						<a
							href="announcement/getAnnounList?pageNow=${annoList.pageNumber == 1?1:annoList.pageNumber-1}">上一页</a>
					</li>
					<li>　第&nbsp${annoList.pageNumber }&nbsp页　 /　 共&nbsp${annoList.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="announcement/getAnnounList?pageNow=${annoList.pageNumber == annoList.totalPage?annoList.pageNumber:annoList.pageNumber+1}">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
