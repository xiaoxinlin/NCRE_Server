<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>

<section id="main" class="column">
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
					${i.title }
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
				<ul class="pager">
					<li>
						<a
							href="file/getDocList?pageNow=${list.pageNumber == 1?1:list.pageNumber-1}">上一页</a>
					</li>
					<li>　第&nbsp${list.pageNumber }&nbsp页　 /　 共&nbsp${list.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="file/getDocList?pageNow=${list.pageNumber == list.totalPage?list.pageNumber:list.pageNumber+1}">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>

