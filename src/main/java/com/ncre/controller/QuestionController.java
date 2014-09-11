package com.ncre.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.interceptor.AccessControlAllowOrigin;
import com.ncre.model.QuestionClass;
import com.ncre.model.TktClass;
import com.ncre.service.AnnouncementService;
import com.ncre.service.QuestionService;

public class QuestionController extends BaseControllerImpl  {

	public void add() {

		QuestionClass questionClass = getModel(QuestionClass.class);

		questionClass.set("is_legal", false).save();

		redirect("/question/anywhere2index");
	}

	public void delete() {
		String id = getPara("id");

		QuestionService.delete(id);

		redirect("/question/anywhere2index");
	}

	/**
	 * 给前台返回一个问题列表
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(AccessControlAllowOrigin.class)
	public void index() {
		int pageNumber = QuestionService.StringNum2int( getPara("page") );
		int pageSize = 14;
		String select = "select id,title";
		String sqlExceptSelect = "from `question`";
		Page<QuestionClass> questionList = QuestionClass.dao.paginate(pageNumber, pageSize, select, sqlExceptSelect);

		renderJson(questionList);
		return;

	}
	/**
	 * 给前台返回一个问题对象
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(AccessControlAllowOrigin.class)
	public void show() {
		String id = getPara("id");

		QuestionClass questionClass = QuestionClass.dao.findById(id);

		renderJson(questionClass);

		return;
	}

	public void update() {
		QuestionClass questionClass = getModel(QuestionClass.class);

		QuestionService.update(questionClass);

		redirect("/question/anywhere2index");
	}
	
	/**
	 * 获取记录列表
	 * @param pageNum,pageSize
	 * 2014年9月4日 12:45:22
	 */
	public void getList(){
		int pageNum = 1;
		int pageSize = 9;
		
		pageNum = QuestionService.StringNum2int(getPara("pageNow"));
		System.out.println(pageNum);
		Page<Record> list = QuestionService.getRecordListByPage(pageNum, pageSize);
		
		setAttr("list", list);
		
		renderJsp("/questionIndex.jsp");
		
	}
	
	//一些额外的控制器
	//2014年9月3日 16:51:05
	public void anywhere2index(){
		
		int pageNum = 1;
		int pageSize = 9;
		
		Page<Record> list  = QuestionService.getRecordListByPage(pageNum, pageSize);
		
		this.getRequest().setAttribute("list", list);

		renderJsp("/questionIndex.jsp");
	}
	
	public void index2add(){
		renderJsp("/question-add.jsp");
	}
	
	public void index2update(){
		
		String id = getPara("id");
		
		Record record = QuestionService.find(id);
		
		setAttr("question", record);
		
		renderJsp("/question-update.jsp");
	}

}
