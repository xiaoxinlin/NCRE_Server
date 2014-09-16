<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
<section id="main" class="column">
<div class="spacer"></div>
<article class="add-xzt-module">
<form class="add-xzt-form" method="post" action="xzt/update">
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				选择题题目：
			</h4>
		</label>
		<div class="controls add-xzt-cke">
			<textarea name="xztClass.title" style="height: 500px">
							${xzt.title }
						</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				选项A：
			</h4>
		</label>
		<div class="controls">
			<textarea name="xztClass.option1" rows="1" cols="50">${xzt.option1 }</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				选项B：
			</h4>
		</label>
		<div class="controls">
			<textarea name="xztClass.option2" rows="1" cols="50">${xzt.option2 }</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				选项C：
			</h4>
		</label>
		<div class="controls">
			<textarea name="xztClass.option3" rows="1" cols="50">${xzt.option3 }</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				选项D：
			</h4>
		</label>
		<div class="controls">
			<textarea name="xztClass.option4" rows="1" cols="50">${xzt.option4 }</textarea>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				答案：
			</h4>
		</label>
		<div class="controls">
			<select name="xztClass.answer">
				<option value="A" ${xzt.answer== "A"?"selected='selected'":"" }>
					A
				</option>
				<option value="B" ${xzt.answer== "B"?"selected='selected'":"" }>
					B
				</option>
				<option value="C" ${xzt.answer== "C"?"selected='selected'":"" }>
					C
				</option>
				<option value="D" ${xzt.answer== "D"?"selected='selected'":"" }>
					D
				</option>
			</select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h4>
				类型：
			</h4>
		</label>
		<div class="controls">
			<select name="xztClass.subject_type" disabled="disabled">
				<%--   22种类型	--%>
				<option value="0" ${xzt.subject_type==0? "selected='selected'":"" }>
					计算机基础及WPS Office应用
				</option>
				<option value="1" ${xzt.subject_type==1? "selected='selected'":"" }>
					计算机基础及MS Office应用
				</option>
				<option value="2" ${xzt.subject_type==2? "selected='selected'":"" }>
					计算机基础及Photoshop应用
				</option>
				<option value="3" ${xzt.subject_type==3? "selected='selected'":"" }>
					C语言程序设计
				</option>
				<option value="4" ${xzt.subject_type==4? "selected='selected'":"" }>
					VB语言程序设计
				</option>
				<option value="5" ${xzt.subject_type==5? "selected='selected'":"" }>
					VFP数据库程序设计
				</option>
				<option value="6" ${xzt.subject_type==6? "selected='selected'":"" }>
					Java语言程序设计
				</option>
				<option value="7" ${xzt.subject_type==7? "selected='selected'":"" }>
					Access语言程序设
				</option>
				<option value="8" ${xzt.subject_type==8? "selected='selected'":"" }>
					C++语言程序设计
				</option>
				<option value="9" ${xzt.subject_type==9? "selected='selected'":"" }>
					MySQL数据库程序设计
				</option>

				<option value="10" ${xzt.subject_type==10? "selected='selected'":"" }>
					Web程序设计
				</option>
				<option value="11" ${xzt.subject_type==11? "selected='selected'":"" }>
					MS Office高级应用
				</option>
				<option value="12" ${xzt.subject_type==12? "selected='selected'":"" }>
					网络技术
				</option>
				<option value="13" ${xzt.subject_type==13? "selected='selected'":"" }>
					数据库技术
				</option>
				<option value="14" ${xzt.subject_type==14? "selected='selected'":"" }>
					软件测试技术
				</option>
				<option value="15" ${xzt.subject_type==15? "selected='selected'":"" }>
					信息安全技术
				</option>
				<option value="16" ${xzt.subject_type==16? "selected='selected'":"" }>
					嵌入式系统开发技术
				</option>
				<option value="17" ${xzt.subject_type==17? "selected='selected'":"" }>
					网络工程师
				</option>
				<option value="18" ${xzt.subject_type==18? "selected='selected'":"" }>
					数据库工程师
				</option>
				<option value="19" ${xzt.subject_type==19? "selected='selected'":"" }>
					软件测试工程师
				</option>

				<option value="20" ${xzt.subject_type==20? "selected='selected'":"" }>
					信息安全工程师
				</option>
				<option value="21" ${xzt.subject_type==21? "selected='selected'":"" }>
					嵌入式系统开发工程师
				</option>
			</select>
		</div>
	</div>
	<input class="hidden" value="${xzt.id }" name="xztClass.id" />
	<input class="hidden" name="subject-type" value="${subjectType }" />
	<button type="submit" class="btn" name="xzt-submit " id="xzt-submit">
		保存
	</button>
	<button type="reset" class="btn" name="xzt-add-reset"
		id="xzt-add-reset">
		重填
	</button>
	<button class="btn" name="xzt-cancel" id="xzt-cancel">
		取消
	</button>
</form>
</article>
</section>

<script>
	CKEDITOR.inline('xztClass.title');

</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
