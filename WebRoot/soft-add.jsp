<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="user">
			<article class="breadcrumbs">
			<a class="current">添加软件</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
<div class="spacer"></div>
<article class="add-soft-module">
<form class="add-soft-form uploadForm" method="post" action="file/add" enctype="multipart/form-data">
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				标题：
			</h4>
		</label>
		<div class="controls">
			<input type="text" 
				placeholder="" name="fileClass.title" style="width:450px;">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				说明：
			</h4>
		</label>
		<div class="controls">
			<textarea rows="5" cols="80" class="context" name="fileClass.context">
			</textarea>
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
			<p>
			<div class="progress" style="width:70%;">
				<div class="bar"></div>
				 <div class="percent">0%</div >
			</div>
			</p>
		</div>
	</div>
	<input class="hidden" name="fileClass.type" value="2"/>
	<div class="control-group">
		<div class="controls">
			<input type="hidden" name="type" value="soft" />
			<button type="submit" class="btn" name="soft-submit" id="soft-submit">
				保存
			</button>
			<a href="file/anywhere2soft" class="btn" name="soft-cancel" id="soft-cancel">取消</a>
		</div>
	</div>

</form>
</article>
</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>


