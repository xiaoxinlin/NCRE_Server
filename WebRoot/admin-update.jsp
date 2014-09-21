<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">修改管理员</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
			<div class="spacer"></div>
			<article class="update-admin-module">
				<form class="update-admin-form form-horizontal" method="post" action="admin/update">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>名称：</h4></label>
		              <div class="controls">
		              	<input type="text" name="adminClass.name" disabled="disabled" value="${deletedAdmin.name }"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>密码：</h4></label>
		              <div class="controls">
		              	<input type="password" name="adminClass.password"/>
		              </div>
		            </div>
		            <input class="hidden" name="adminClass.id" value="${deletedAdmin.id}" />
		            <div class="control-group">
		              <div class="controls">
		              	<input type="hidden" name="authority" value="admin"/>
		                <button type="submit" class="btn" name="admin-update" id="admin-update">保存</button>
		                <button type="reset" class="btn" name="admin-update-reset" id="admin-update-reset">重填</button>
		            	<a href="admin/anywhere2index"  class="btn" name="admin-cancel" id="admin-cancel">取消</a>
		              </div>
		            </div>
		            
		          </form>
			</article>
		</section>
	
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>