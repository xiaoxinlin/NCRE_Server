package com.ncre.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
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

	public void index() {
		String pageNow = getPara("page");
		if("".equals(pageNow) || pageNow == null){
			pageNow = "1";
		}
		List<QuestionClass> questionList = QuestionClass.dao
				.find("select * from `question`");

		renderJson(questionList);

		return;
	}

	public void show() {
		String id = getPara("id");

		QuestionClass questionClass = QuestionClass.dao.findById(id.toString());

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
