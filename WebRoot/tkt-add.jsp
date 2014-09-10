<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		
		<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-tkt-module">
				<form class="add-tkt-form" method="post" action="tkt/add">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>填空题题目：</h4></label>
		              <div class="controls add-tkt-cke">
		                <textarea name="tktClass.title" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>答案：</h4></label>
		              <div class="controls add-tkt-cke">
		                <textarea name="tktClass.answer" style="height: 500px" >
							请点击这里添加公告内容......
						</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>题型：</h4></label>
		              <div class="controls">
		                <select name="tktClass.type">
		                	<option value="0">填空题</option>
		                	<option value="1">大题</option>
		                </select>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>类型：</h4></label>
		              <div class="controls">
		                <select name="tktClass.subject_type">					<%--   22种类型	--%>
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
		            <button type="submit" class="btn" name="tkt-submit " id="tkt-submit">保存</button>
		            <button type="reset" class="btn" name="tkt-add-reset" id="tkt-add-reset">重填</button>
		            <button class="btn" name="tkt-cancel" id="tkt-cancel">取消</button>
		          </form>
			</article>
		</section>
		
		<script>
			CKEDITOR.inline( 'tktClass.title' );
			CKEDITOR.inline( 'tktClass.answer' );
		</script>
	
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
