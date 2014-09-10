package com.ncre.controller;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.model.TktClass;
import com.ncre.service.TktService;
import com.ncre.utils.SubjectType;

public class TktController extends BaseControllerImpl  {

	/**
	 * save Object
	 */
	public void add() {
		TktClass tktClass = getModel(TktClass.class);
		int subjectType = TktService.StringNum2int(getPara("subject-type"));
		TktService.save(tktClass);
		redirect("/tkt/getDiffSubIndex?subject-type="+subjectType);
	}

	/**
	 * delete Object
	 */
	public void delete() {
		String id = getPara("id");
		int subjectType = TktService.StringNum2int(getPara("subject-type"));
		TktService.delete(id);
		redirect("/tkt/getDiffSubIndex?subject-type="+subjectType);
	}

	public void index() {
		
	}


	public void show() {

	}

	/**
	 * update Object
	 */
	public void update() {
		TktClass tktClass = getModel(TktClass.class);
		int subjectType = TktService.StringNum2int(getPara("subject-type"));
		TktService.update(tktClass);
		redirect("/tkt/getDiffSubIndex?subject-type="+subjectType);
	}
	
	/**
	 * 获取不同科目的首页
	 */
	public void getDiffSubIndex(){
		int subjectType = TktService.StringNum2int( getPara("subject-type") );
		int pageNum = 1;
		int pageSize = 4;
		Page<Record> list = TktService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/tktIndex.jsp");
	}
	
	/**
	 * 获取一个对象列表
	 */
	public void getList(){
		int subjectType = TktService.StringNum2int( getPara("subject-type") );
		int pageNum = TktService.StringNum2int( getPara("pageNow") );
		int pageSize = 4;
		Page<Record> list = TktService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/tktIndex.jsp");
	}
	
	//过渡的一些控制器
	
	public void anywhere2index(){
		int pageNum = 1;
		int pageSize = 4;
		int subjectType = SubjectType.COMPUTER_BASIC_and_WPS_OFFICE;
		Page<Record> list = TktService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/tktIndex.jsp");
	}
	
	public void index2add(){
		int subjectType = TktService.StringNum2int(getPara("subject-type"));
		setAttr("subjectType", subjectType);
		renderJsp("/tkt-add.jsp");
	}
	
	public void index2update(){
		String id = getPara("id");
		TktClass tktClass = TktService.find(id);
		int subjectType = TktService.StringNum2int(getPara("subject-type"));
		setAttr("subjectType", subjectType);
		setAttr("tkt",tktClass);
		renderJsp("/tkt-update.jsp");
	}

}
