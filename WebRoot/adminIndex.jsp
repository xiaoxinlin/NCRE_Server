<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">管理员列表</a>
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
				名称
			</th>
			<th>
				密码
			</th>
			<th>
				权限
			</th>
			<th>
				创建时间
			</th>
			<th>
				操作
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${adminList.list}" var="i">
			<tr>
				<td>
					${i.name }
				</td>
				<td>
					${i.password }
				</td>
				<td>
					${i.authority }
				</td>
				<td>
					${i.reg_date }
				</td>
				<td>
					<a name="delete-admin" class="btn" href="admin/delete?id=${i.id }" onclick="return confirmDel();">删除</a>
					<a name="update-admin" class="btn" href="admin/index2update?id=${i.id }">编辑</a>

				</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
<div class="b-s-page">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2 pull-left">
				<a name="add-admin" class="btn" href="admin/index2add">添加管理员</a>
			</div>
			<div class="span8">
				<ul class="pager">
					<li>
						<a
							href="admin/getAdminList?pageNow=${adminList.pageNumber == 1?1:adminList.pageNumber-1}">上一页</a>
					</li>
					<li>　第&nbsp${adminList.pageNumber }&nbsp页　 /　 共&nbsp${adminList.totalPage }&nbsp页　 </li>
					<li>
						<a
							href="admin/getAdminList?pageNow=${adminList.pageNumber == adminList.totalPage?adminList.pageNumber:adminList.pageNumber+1}">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>