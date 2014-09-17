<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-admin-module">
				<form class="add-admin-form form-horizontal" method="post" action="admin/chgPass" onsubmit="return validate();">
		            <div class="control-group">
		              <label class="control-label" for="" ><h4>&nbsp名　称&nbsp：</h4></label>
		              <div class="controls">
		              	<input type="text" name="adminClass.name" value="${ session.admin.name }"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>&nbsp密　码&nbsp：</h4></label>
		              <div class="controls">
		              	<input type="password" name="adminClass.password" id="newpassword"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>确认密码：</h4></label>
		              <div class="controls">
		              	<input type="password" id="renewpassword"/>
		              </div>
		            </div>
		            <div class="control-group">
		              <div class="controls">
		              	<input type="hidden" name="adminClass.id" value="${session.admin.id }"/>
		                <button type="submit" class="btn" name="admin-submit" id="admin-submit">保存</button>
		                <button type="reset" class="btn" name="admin-add-reset" id="admin-add-reset">重填</button>
		            	<a href="admin/anywhere2index"  class="btn" name="admin-cancel" id="admin-cancel">取消</a>
		              </div>
		            </div>
		            
		          </form>
			</article>
		</section>
		<<script>
			
			function validate(){
				if( $('#newpassword').val() == $('#renewpassword').val() )
				{
					alert("修改密码成功！！跳往首页重新登录！");
					return true;
				}else{
					alert("密码不一致！！，请重新输入！！");
					return false;	
				}	
				
			}
		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>