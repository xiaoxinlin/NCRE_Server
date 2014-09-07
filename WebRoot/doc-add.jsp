<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="spacer"></div>
<article class="add-soft-module">
<form class="add-soft-form" method="post" action="file/add" enctype="multipart/form-data">
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				标题：
			</h4>
		</label>
		<div class="controls">
			<input type="text" 
				placeholder="" name="fileClass.title">
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

			</div>
		</div>
	</div>
	<input class="hidden" name="fileClass.type" value="1"/>
	<div class="control-group">
		<div class="controls">
			<input type="hidden" name="type" value="soft" />
			<button type="submit" class="btn" name="soft-submit" id="soft-submit">
				保存
			</button>
			<a href="b-soft.jsp" class="btn" name="soft-cancel" id="soft-cancel">取消</a>
		</div>
	</div>

</form>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>


