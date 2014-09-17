<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>	
		<section id="main" class="column">
			<div class="spacer"></div>
			
			<article class="add-anno-module">
				<form class="add-anno-form" method="post" action="announcement/add" enctype="multipart/form-data">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>公告标题：</h4></label>
		              <div class="controls">
		                <input type="text" style="width:720px;" class="add-anno-title" id="anno-title" placeholder="" name="announcementClass.title">
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>内容：</h4></label>
		                <textarea  rows="12" cols="80" name="announcementClass.context" class="context"> 
						</textarea>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>附件：</h4></label>
		              <div class="controls">
		              	<input type="file" name="appendix"/>
		              	<div class="files" id="files">
		              	
		              	</div>
		              </div>
		            </div>
		            <button type="submit" class="btn" name="anno-submit" id="anno-submit">保存</button>
		            <button type="reset" class="btn" name="anno-add-reset" id="anno-add-reset">重填</button>
		            <a href="announcement/anywhere2index"  class="btn" name="anno-cancel" id="anno-cancel">取消</a>
		          </form>
			</article>
		</section>
		
		<script>
		
		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
