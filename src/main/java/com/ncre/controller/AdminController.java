package com.ncre.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.ncre.model.AdminClass;
import com.ncre.utils.MD5Utils;

public class AdminController extends Controller implements
		BaseControllerI<AdminController> {
	
	//增加一个对象
	public void add() {
		AdminClass adminClass = getModel(AdminClass.class);
		adminClass.set("password",
				MD5Utils.GetMD5Code(adminClass.get("password").toString()))
				.set("authority", 2).set("reg_date", new java.util.Date())
				.save();
		redirect("/admin/index");
	}
	//删除指定id的对象
	public void delete() {
		String id = getPara("id");

		AdminClass.dao.deleteById(id);

		redirect("/admin/index");
	}
	
	
	//列出全部对象
	public void index() {
		
		List<AdminClass> adminList = AdminClass.dao.find("select * from `admin` where `authority` = '2' ");
		
		renderJson(adminList);
	}
	
	
	//寻找指定id的对象
	public void show() {
		String id = getPara("id");

		AdminClass adminClass = AdminClass.dao.findById(id);

		renderJson(adminClass);

	}
	//在前台接收一个对象属性，并更新对象
	public void update() {
		AdminClass adminClass = getModel(AdminClass.class);
		adminClass.dao.findById(adminClass.get("id").toString()).set(
				"password",
				MD5Utils.GetMD5Code(adminClass.get("password").toString()))
				.update();
		renderJson(adminClass);
	}

}
