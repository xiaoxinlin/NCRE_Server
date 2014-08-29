<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-admin-module">
				<form class="add-admin-form form-horizontal" method="post" action="admin/add">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>名称：</h4></label>
		              <div class="controls">
		              	<input type="text" name="adminClass.name"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>密码：</h4></label>
		              <div class="controls">
		              	<input type="password" name="adminClass.password"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <div class="controls">
		              	<input type="hidden" name="authority" value="admin"/>
		                <button type="submit" class="btn" name="admin-submit" id="admin-submit">保存</button>
		                <button type="reset" class="btn" name="admin-add-reset" id="admin-add-reset">重填</button>
		            	<a href="b-admin.jsp"  class="btn" name="admin-cancel" id="admin-cancel">取消</a>
		              </div>
		            </div>
		            
		          </form>
			</article>
		</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>