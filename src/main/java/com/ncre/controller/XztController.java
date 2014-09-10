package com.ncre.controller;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.model.XztClass;
import com.ncre.service.XztService;
import com.ncre.utils.SubjectType;

public class XztController extends BaseControllerImpl{

	/**
	 * save Object
	 */
	public void add() {
		XztClass xztClass = getModel(XztClass.class);
		int subjectType = XztService.StringNum2int(xztClass.getStr("subject_type"));
		XztService.save(xztClass);
		redirect("/xzt/getDiffSubIndex?subject-type="+subjectType);
	}

	/**
	 * delete Object
	 */
	public void delete() {
		String id = getPara("id");
		int subjectType = XztService.StringNum2int(getPara("subject-type"));
		XztService.delete(id);
		redirect("/xzt/getDiffSubIndex?subject-type="+subjectType);
	}

	public void index() {
		
	}


	public void show() {

	}

	/**
	 * update Object
	 */
	public void update() {
		XztClass tktClass = getModel(XztClass.class);
		int subjectType = XztService.StringNum2int(getPara("subject-type"));
		XztService.update(tktClass);
		redirect("/xzt/getDiffSubIndex?subject-type="+subjectType);
	}
	
	/**
	 * 获取不同科目的首页
	 */
	public void getDiffSubIndex(){
		int subjectType = XztService.StringNum2int( getPara("subject-type") );
		int pageNum = 1;
		int pageSize = 2;
		Page<Record> list = XztService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/xztIndex.jsp");
	}
	
	/**
	 * 获取一个对象列表
	 */
	public void getList(){
		int subjectType = XztService.StringNum2int( getPara("subject-type") );
		int pageNum = XztService.StringNum2int( getPara("pageNow") );
		int pageSize = 2;
		Page<Record> list = XztService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/xztIndex.jsp");
	}
	
	//过渡的一些控制器
	
	public void anywhere2index(){
		int pageNum = 1;
		int pageSize = 2;
		int subjectType = SubjectType.COMPUTER_BASIC_and_WPS_OFFICE;
		Page<Record> list = XztService.getRecordList(pageNum, pageSize, subjectType);
		setAttr("list", list);
		setAttr("subjectType",subjectType);
		renderJsp("/xztIndex.jsp");
	}
	
	public void index2add(){
		int subjectType = XztService.StringNum2int(getPara("subject-type"));
		setAttr("subjectType", subjectType);
		renderJsp("/xzt-add.jsp");
	}
	
	public void index2update(){
		String id = getPara("id");
		XztClass xztClass = XztService.find(id);
		int subjectType = XztService.StringNum2int(getPara("subject-type"));
		setAttr("subjectType", subjectType);
		setAttr("xzt",xztClass);
		renderJsp("/xzt-update.jsp");
	}
}
