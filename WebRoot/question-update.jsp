<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-question-module">
				<form class="add-question-form form-horizontal" method="post" action="question/update">
		            <div class="control-group">
		              <label class="control-label" for=""><h4>常见问题：</h4></label>
		              <div class="controls">
		              	<textarea rows="5" cols="50" name="questionClass.title" >${question.title }</textarea>
		              </div>
		            </div>
		            <div class="control-group">
		              <label class="control-label" for=""><h4>回答：</h4></label>
		              <div class="controls">
		              	<textarea rows="8" cols="50" name="questionClass.answer" >${question.answer }</textarea>
		              </div>
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
	

