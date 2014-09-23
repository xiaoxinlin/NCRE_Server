<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>

<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">文档列表</a>
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
				文档标题
			</th>
			<th>
				文档地址
			</th>
			<th>
				上传时间
			</th>
			<th>
				操作
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list.list}" var="i">
			<tr>
				<td>
					<a href="file/index2detail?id=${i.id }">${i.title }</a>
				</td>
				<td>
					<a href="file/download?id=${i.id }">${i.uri }</a>
				</td>
				<td>
					${i.upload_date }
				</td>
				<td>
					<a name="delete-soft" class="btn" href="file/delete?id=${i.id }" onclick="return confirmDel();">删除</a>
					<a name="update-soft" class="btn" href="file/index2docUpdate?id=${i.id }">编辑</a>

				</td>
			</tr>
		</c:forEach>


	</tbody>
</table>
<div class="b-s-page">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 pull-left">
				<a name="add-soft" class="btn" href="file/index2docAdd">添加相关文档</a>
			</div>
			<div class="span8">
				<!--  <ul class="pager">
					<li>
						<a
							href="file/getDocList?pageNow=${list.pageNumber == 1?1:list.pageNumber-1}">上一页</a>
					</li>
					<li>　第&nbsp${list.pageNumber }&nbsp页　 /　 共&nbsp${list.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="file/getDocList?pageNow=${list.pageNumber == list.totalPage?list.pageNumber:list.pageNumber+1}">下一页</a>
					</li>
				</ul>-->
				<center>
				<div class="pagination" style="margin-top:40px;">
				  <ul id="pager">
				  </ul>
				  <p>第&nbsp${list.pageNumber }&nbsp页　 /　 共&nbsp${list.totalPage }&nbsp页　</p>
				</div>
				</center>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<script>
$(function(){
	var pageNow = ${list.pageNumber};
	var pageTotal = ${list.totalPage};
	var address ='file/getDocList?pageNow=';
	page(address,pageNow,pageTotal);
});

</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>

