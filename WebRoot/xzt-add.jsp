<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		<section id="main" class="column">
		<div class="user">
			<article class="breadcrumbs">
			<a class="current">添加选择题</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
			<div class="spacer"></div>
			<article class="add-xzt-module">
				<form class="add-xzt-form" method="post" action="xzt/add">
		            <div class="control-group">
		            <h5>选择题题目：</h5>
		                <textarea name="xztClass.title"  rows="7" cols="100" class="context">
						</textarea>
		            </div>
		            <div class="control-group">
		             
						<b>选项A：</b><input name="xztClass.option1" type="text" style="width:670px;"/>
		             
		            </div>
		            <div class="control-group">
		              <b>选项B：</b><input name="xztClass.option2" type="text" style="width:670px;"/>
		            </div>
		            <div class="control-group">
		              
		              <b>选项C：</b><input name="xztClass.option3" type="text" style="width:670px;"/>
		            </div>
		            <div class="control-group">
		              <b>选项D：</b><input name="xztClass.option4" type="text" style="width:670px;"/>
		            </div>
		            <div class="control-group">
		              <div class="controls">
		              <b>答案：</b>
		              	<select name="xztClass.answer">
		              		<option value="A">A</option>
		              		<option value="B">B</option>
		              		<option value="C">C</option>
		              		<option value="D">D</option>
		              	</select>
		              	&nbsp　　　 &nbsp
		              	 <b>类型：</b>
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
		            <a class="btn" name="xzt-cancel" id="xzt-cancel" href="xzt/anywhere2index">取消</a>
		          </form>
			</article>
		</section>
		
		<script>
			

		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
