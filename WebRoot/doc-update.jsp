<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="spacer"></div>
<article class="add-soft-module">
<form class="add-soft-form" method="post" action="file/update" enctype="multipart/form-data">
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				标题：
			</h4>
		</label>
		<div class="controls">
			<input type="text" 
				placeholder="" name="fileClass.title" value="${file.title }">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				上传文件：
			</h4>
		</label>
		<div class="controls">
			<input type="file" name="soft-appendix" />
			<div class="files" id="files">
				<p>原附件&nbsp：&nbsp ${file.uri }</p>
			</div>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<input type="hidden" name="fileClass.id" value="${file.id }" />
			<input type="hidden" name="fileClass.type" value="1" />
			<button type="submit" class="btn" name="soft-submit" id="soft-submit">
				保存
			</button>
			<a href="file/anywhere2doc" class="btn" name="soft-cancel" id="soft-cancel">取消</a>
		</div>
	</div>

</form>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
