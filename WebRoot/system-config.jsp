<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navBar_begin.jsp" flush="true"></jsp:include>

<section id="main" class="column">
<div class="user">
	<article class="breadcrumbs">
	<a class="current">系统设置</a>
	<div class="breadcrumb_divider"></div>
	<%--<a class="current">Dashboard</a>--%>
	</article>
</div>
<div class="config-p">
	<!-- <form>
	<div>
		<h3>每日一练选项设置</h3>
		<p>选择题数目：<input type="text"/></p>
		<p>填空题数目：<input type="text"/></p>
	</div>
	<div>
		<h3>在线测试选项设置</h3>
		<p>选择题数目：<input type="text"/></p>
		<p>填空题数目：<input type="text"/></p>
		<p>&nbsp&nbsp大题数目&nbsp&nbsp：<input type="text"/></p>
	</div>
	<div>
		<button type="submit" class="btn">保存设置</button>
		<input type="reset" class="btn" value="重填"/>
		<a  class="btn" href="announcement/anywhere2index">取消</a>
	</div>
	</form> -->
	<ul class="nav nav-tabs">
	  <li class="active"><a href="#home" data-toggle="tab">试题设置</a></li>
	  <li><a href="#importfile" data-toggle="tab">试题导入</a></li>
	</ul>
	<div class="tab-content">
	  <div class="tab-pane active" id="home">
	 	<form action="admin/sysConfig" method="post">
		<div>
			<h3>每日一练选项</h3>
			<p>
			选择题数目：<input type="number" min="1" max="5" value="1" name="xztNumsOfTEST"/>
			<small>（默认值为1）</small>
			</p>
			<p>
			填空题数目：<input type="number" min="1" max="5" value="1" name="tktNumsOfTEST"/>
			<small>（默认值为1）</small>
			</p>
		</div>
		<div>
			<h3>在线测试选项</h3>
			<p>
			选择题数目：<input type="number" min="1" max="5" value="3" name="xztNumsOfEXAM"/>
			<small>（默认值为3）</small>
			</p>
			<p>
			填空题数目：<input type="number" min="1" max="5" value="2" name="tktNumsOfEXAM"/>
			<small>（默认值为2）</small>
			</p>
			<p>
			&nbsp&nbsp大题数目&nbsp&nbsp：<input type="number" min="1" max="5" value="1" name="dtNumsOfEXAM"/>
			<small>（默认值为1）</small>
			</p>
		</div>
		<div>
			<button type="submit" class="btn">保存设置</button>
			<input type="reset" class="btn" value="重填"/>
			<a  class="btn" href="announcement/anywhere2index">取消</a>
		</div>
		</form>
	  </div>
	  <div class="tab-pane" id="importfile">
	  <form action="admin/importTest" method="post" enctype="multipart/form-data">
	  <p>上传文件：<input type="file" name="file"/>
	  <small>（该文件必须是以.txt文件格式结尾的文本文件，否则导入试题出错）</small></p>
	  <p>
	  题型：
	  <select name="type">
	  	<option value="2">选择题</option>
	  	<option value="1">填空题</option>
	  </select>
	  </p>
	  <p><input class="btn" type="submit" value="导入试题"/>
	  <input class="btn" type="reset"></p>
	  </form>
	  </div>
	  

	</div>

</div>
</section>

<jsp:include page="navBar_end.jsp" flush="true"></jsp:include>
