<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>

<section id="main" class="column">
<div class="user">
	<article class="breadcrumbs">
	<a class="current">修改填空题</a>
	<div class="breadcrumb_divider"></div>
	<%--<a class="current">Dashboard</a>--%>
	</article>
</div>
<div class="spacer"></div>
<article class="add-tkt-module">
<form class="add-tkt-form" method="post" action="tkt/update">
	<div class="control-group">
		<label class="control-label" for="">
			<h5>
				填空题题目：
			</h5>
		</label>
		<textarea name="tktClass.title" rows="5" cols="100" class="context">
						${tkt.title }
						</textarea>
	</div>
	<div class="control-group">
		<label class="control-label" for="">
			<h5>
				答案：
			</h5>
		</label>
		<textarea name="tktClass.answer" rows="5" cols="100" class="context">
		              ${tkt.answer }
						</textarea>
	</div>
	<div class="control-group">
		<b>题型：</b>
		<select name="tktClass.type">
			<option value="0" ${tkt.type==0? "selected='selected'":"" }>
				填空题
			</option>
			<option value="1" ${tkt.type==1? "selected='selected'":"" }>
				大题
			</option>
		</select>
		&nbsp &nbsp
		<b>类型：</b>
		<select name="tktClass.subject_type" disabled="disabled">
			<%--   22种类型	--%>
			<option value="0" ${tkt.subject_type==0? "selected='selected'":"" }>
				计算机基础及WPS Office应用
			</option>
			<option value="1" ${tkt.subject_type==1? "selected='selected'":"" }>
				计算机基础及MS Office应用
			</option>
			<option value="2" ${tkt.subject_type==2? "selected='selected'":"" }>
				计算机基础及Photoshop应用
			</option>
			<option value="3" ${tkt.subject_type==3? "selected='selected'":"" }>
				C语言程序设计
			</option>
			<option value="4" ${tkt.subject_type==4? "selected='selected'":"" }>
				VB语言程序设计
			</option>
			<option value="5" ${tkt.subject_type==5? "selected='selected'":"" }>
				VFP数据库程序设计
			</option>
			<option value="6" ${tkt.subject_type==6? "selected='selected'":"" }>
				Java语言程序设计
			</option>
			<option value="7" ${tkt.subject_type==7? "selected='selected'":"" }>
				Access语言程序设
			</option>
			<option value="8" ${tkt.subject_type==8? "selected='selected'":"" }>
				C++语言程序设计
			</option>
			<option value="9" ${tkt.subject_type==9? "selected='selected'":"" }>
				MySQL数据库程序设计
			</option>

			<option value="10" ${tkt.subject_type==10? "selected='selected'":"" }>
				Web程序设计
			</option>
			<option value="11" ${tkt.subject_type==11? "selected='selected'":"" }>
				MS Office高级应用
			</option>
			<option value="12" ${tkt.subject_type==12? "selected='selected'":"" }>
				网络技术
			</option>
			<option value="13" ${tkt.subject_type==13? "selected='selected'":"" }>
				数据库技术
			</option>
			<option value="14" ${tkt.subject_type==14? "selected='selected'":"" }>
				软件测试技术
			</option>
			<option value="15" ${tkt.subject_type==15? "selected='selected'":"" }>
				信息安全技术
			</option>
			<option value="16" ${tkt.subject_type==16? "selected='selected'":"" }>
				嵌入式系统开发技术
			</option>
			<option value="17" ${tkt.subject_type==17? "selected='selected'":"" }>
				网络工程师
			</option>
			<option value="18" ${tkt.subject_type==18? "selected='selected'":"" }>
				数据库工程师
			</option>
			<option value="19" ${tkt.subject_type==19? "selected='selected'":"" }>
				软件测试工程师
			</option>

			<option value="20" ${tkt.subject_type==20? "selected='selected'":"" }>
				信息安全工程师
			</option>
			<option value="21" ${tkt.subject_type==21? "selected='selected'":"" }>
				嵌入式系统开发工程师
			</option>
		</select>
	</div>
	<input class="hidden" value="${tkt.id }" name="tktClass.id" />
	<input class="hidden" name="subject-type" value="${subjectType }" />
	<button type="submit" class="btn" name="tkt-submit " id="tkt-submit">
		保存
	</button>
	<button type="reset" class="btn" name="tkt-add-reset"
		id="tkt-add-reset">
		重填
	</button>
	<a class="btn" name="tkt-cancel" id="tkt-cancel"
		href="tkt/anywhere2index">取消</a>
</form>
</article>
</section>

<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
