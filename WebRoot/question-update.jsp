<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		<section id="main" class="column">
		<div class="user">
			<article class="breadcrumbs">
			<a class="current">修改常见问题</a>
			<div class="breadcrumb_divider"></div>
			<%--<a class="current">Dashboard</a>--%>
			</article>
		</div>
			<div class="spacer"></div>
			<article class="add-question-module">
				<form class="add-question-form form-horizontal uploadForm" method="post" action="question/update" enctype="multipart/form-data">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>常见问题：</h4></label>
		              <div class="controls">
		              	<textarea rows="5" cols="50" name="questionClass.title" >${question.title }</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>回答：</h4></label>
		              <div class="controls">
		              	<textarea rows="5" cols="50" name="questionClass.answer" class="context">${question.answer }</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>附件：</h4></label>
		              <div class="controls">
		               <input type="file" name="file"/>
		               <p>原附件：${question.uri }</p>
		              </div>
		              <p>
					<div class="progress" style="width:70%;margin-left:17%">
						<div class="bar"></div>
						 <div class="percent">0%</div >
					</div>
					</p>
		              
		            </div>
		            <input class="hidden" name="questionClass.id" value="${question.id }"/>
		            <div class="control-group">
		              <div class="controls">
		                <button type="submit" class="btn" name="question-submit" id="question-submit">保存</button>
		                <button type="reset" class="btn" name="question-update-reset" id="question-update-reset">重填</button>
		            	<a href="question/anywhere2index"  class="btn" name="question-cancel" id="question-cancel">取消</a>
		              </div>
		            </div>
		            
		          </form>
			</article>
		</section>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>	
	

