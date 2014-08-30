<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
			<div class="spacer"></div>
			<article class="update-anno-module">
				<form class="update-anno-form" method="post" action="announcement/update"  enctype="multipart/form-data">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>标题：</h4></label>
		              <div class="controls">
		                <input name="announcementClass.title" type="text" class="update-anno-title" id="anno-title" placeholder="" value="${updatedAnno.title }">
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>内容：</h4></label>
		              <div class="controls update-anno-cke">
		                <textarea name="announcementClass.context" style="height: 500px" >
							${updatedAnno.context }
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for="inputPassword"><h4>附件：</h4></label>
		              <div class="controls">
		              	<input type="file" name="appendix"/>
		              	<div class="files" id="files">
		              		<p>原附件：${updatedAnno.uri }</p>
		              	</div>
		              </div>
		            </div>
		            <input value="${updatedAnno.id }" class="hidden" name="announcementClass.id"/>
		            <button type="submit" class="btn" name="anno-update">保存</button>
		            <button type="reset" class="btn" name="anno-update-reset" id="anno-update-reset">重填</button>
		            <a href="b-superadmin-anno.jsp"  class="btn" name="anno-cancel" id="anno-cancel">取消</a>
		          </form>
			</article>
		</section>
		
		<script>
			CKEDITOR.inline( 'announcementClass.context' );
		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>