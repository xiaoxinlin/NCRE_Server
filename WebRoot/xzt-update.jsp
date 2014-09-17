<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>
		<section id="main" class="column">
			<div class="spacer"></div>
			<article class="add-xzt-module">
				<form class="add-xzt-form" method="post" action="xzt/update">
		            <div class="control-group">
		            <h5>选择题题目：</h5>
		                <textarea name="xztClass.title"  rows="7" cols="100" class="context">
		                ${xzt.title}
						</textarea>
		            </div>
		            <div class="control-group">
		             
						<b>选项A：</b><input name="xztClass.option1" type="text" style="width:670px;" value="${xzt.option1 }"/>
		             
		            </div>
		            <div class="control-group">
		              <b>选项B：</b><input name="xztClass.option2" type="text" style="width:670px;" value="${xzt.option2 }"/>
		            </div>
		            <div class="control-group">
		              
		              <b>选项C：</b><input name="xztClass.option3" type="text" style="width:670px;" value="${xzt.option3 }"/>
		            </div>
		            <div class="control-group">
		              <b>选项D：</b><input name="xztClass.option4" type="text" style="width:670px;" value="${xzt.option4 }"/>
		            </div>
		            <div class="control-group">
		              <div class="controls">
		              <b>答案：</b>
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
		              	&nbsp　　　 &nbsp
		              	 <b>类型：</b>
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
		            <button type="submit" class="btn" name="xzt-submit " id="xzt-submit">保存</button>
		            <button type="reset" class="btn" name="xzt-add-reset" id="xzt-add-reset">重填</button>
		            <a class="btn" name="xzt-cancel" id="xzt-cancel" href="xzt/anywhere2index">取消</a>
		          </form>
			</article>
		</section>
		
		<script>
			

		</script>
<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>

