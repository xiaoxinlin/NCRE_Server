<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-xzt-module">
				<form class="add-xzt-form" method="post" action="xzt/add">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选择题题目：</h4></label>
		              <div class="controls add-xzt-cke">
		                <textarea name="xztClass.title" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项A：</h4></label>
		              <div class="controls">
		                <textarea name="xztClass.option1" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项B：</h4></label>
		              <div class="controls">
		                <textarea name="xztClass.option2" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项C：</h4></label>
		              <div class="controls">
		                <textarea name="xztClass.option3" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>选项D：</h4></label>
		              <div class="controls">
		                <textarea name="xztClass.option4" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>答案：</h4></label>
		              <div class="controls">
		              	<select name="xztClass.answer">
		              		<option value="A">A</option>
		              		<option value="B">B</option>
		              		<option value="C">C</option>
		              		<option value="D">D</option>
		              	</select>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>类型：</h4></label>
		              <div class="controls">
		                <select name="xztClass.subject_type">					<%--   22种类型	--%>
		                	<option value="0">计算机基础及WPS Office应用</option>
		                	<option value="1">计算机基础及MS Office应用</option>
		                	<option value="2">计算机基础及Photoshop应用</option>
		                	<option value="3">C语言程序设计</option>
		                	<option value="4">VB语言程序设计</option>
		                	<option value="5">VFP数据库程序设计</option>
		                	<option value="6">Java语言程序设计</option>
		                	<option value="7">Access语言程序设</option>
		                	<option value="8">C++语言程序设计</option>
		                	<option value="9">MySQL数据库程序设计</option>
		                	
		                	<option value="10">Web程序设计</option>
		                	<option value="11">MS Office高级应用</option>
		                	<option value="12">网络技术</option>
		                	<option value="13">数据库技术</option>
		                	<option value="14">软件测试技术</option>
		                	<option value="15">信息安全技术</option>
		                	<option value="16">嵌入式系统开发技术</option>
		                	<option value="17">网络工程师</option>
		                	<option value="18">数据库工程师</option>
		                	<option value="19">软件测试工程师</option>
		                	
		                	<option value="20">信息安全工程师</option>
		                	<option value="21">嵌入式系统开发工程师</option>
		                </select>
		              </div>
		            </div>
		            <input class="hidden" name="subject-type" value="${subjectType }" />
		            <button type="submit" class="btn" name="xzt-submit " id="xzt-submit">保存</button>
		            <button type="reset" class="btn" name="xzt-add-reset" id="xzt-add-reset">重填</button>
		            <button class="btn" name="xzt-cancel" id="xzt-cancel">取消</button>
		          </form>
			</article>
		</section>
		
		<script>
			CKEDITOR.inline( 'xztClass.title' );
			CKEDITOR.inline( 'xztClass.option1' );
			CKEDITOR.inline( 'xztClass.option2' );
			CKEDITOR.inline( 'xztClass.option3' );
			CKEDITOR.inline( 'xztClass.option4' );
		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
