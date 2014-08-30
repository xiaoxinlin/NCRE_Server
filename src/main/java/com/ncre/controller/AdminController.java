package com.ncre.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.model.AdminClass;
import com.ncre.service.AdminService;
import com.ncre.service.AnnouncementService;
import com.ncre.utils.MD5Utils;

public class AdminController extends BaseControllerImpl {

	/**
	 * 增加管理员
	 * 
	 * @param adminClass
	 *            .name adminClass.password -- MD5加密
	 * 
	 *            if true redirect b-admin.jsp
	 */
	public void add() {
		AdminClass adminClass = getModel(AdminClass.class);

		adminClass.set("password",
				MD5Utils.GetMD5Code(adminClass.get("password").toString()))
				.set("authority", 2).set("reg_date", new java.util.Date())
				.save();

		//renderJson(adminClass);
		redirect("/admin/anywhere2index");
	}

	/**
	 *  删除指定id的对象
	 *  2014年8月30日 00:33:45
	 */
	public void delete() {
		String id = getPara("id");

		AdminClass.dao.deleteById(id);

		redirect("/admin/anywhere2index");
	}


	/**
	 * 后台的管理员列表，接收一个页码 2014年8月29日 23:27:52
	 */
	public void getAdminList() {

		// 获取当前页数，若为空，则默认为1
		String pageNow = getPara("pageNow");
		int pageNowI = 0;

		try {
			pageNowI = Integer.parseInt(pageNow);
		} catch (Exception e) {
			pageNowI = 1;
		}

		// 每一页的数据数

		Page<Record> adminList = AdminService.getAdminByPage(pageNowI);

		this.getRequest().setAttribute("adminList", adminList);

		renderJsp("/adminIndex.jsp");

	}



	/**
	 * 在前台接收一个对象属性，并更新对象
	 * 2014年8月30日 00:33:30
	 */
	public void update() {
		AdminClass adminClass = getModel(AdminClass.class);
		adminClass.dao.findById(adminClass.get("id").toString()).set(
				"password",
				MD5Utils.GetMD5Code(adminClass.get("password").toString()))
				.set("name", adminClass.get("name"))
				.update();
		//renderJson(adminClass);
		redirect("/admin/anywhere2index");
	}

	/**
	 * 用户登录
	 * 
	 * @param adminClass
	 *            .name adminClass.password -- 密码采用MD5加密 if true redirect
	 *            /b-superadmin-anno.jsp session.add( adminClass ) elseif false
	 *            redirect /b-login.jsp
	 * 
	 */
	public void login() {

		AdminClass adminClass = getModel(AdminClass.class);

		List<Record> adminClass2 = Db.find("select * from `admin` where name='"
				+ adminClass.getStr("name") + "' and password='"
				+ MD5Utils.GetMD5Code(adminClass.getStr("password")) + "'");

		if (adminClass2 == null) {
			redirect("/b-login.jsp");
			return;
		}

		this.getSession()
				.setAttribute("admin", adminClass2.get(0).getColumns());

		redirect("/announcement/getAnnounList?pageNow=1");
	}

		public void index() {
		// TODO Auto-generated method stub
		
	}

	public void show() {
		// TODO Auto-generated method stub
		
	}
	
	// 以下为过渡的一些控制器，便于拦截器的控制

	/**
	 * 进入添加管理员页面 2014年8月29日 23:41:48
	 */
	public void index2add() {

		renderJsp("/admin-add.jsp");
	}
	/**
	 * 进入管理员编辑页面
	 * 2014年8月30日 00:10:52
	 */
	public void index2update(){
		String id = getPara("id");
		Record admin = Db.findById("admin", id);
		setAttr("deletedAdmin", admin);
		renderJsp("/admin-update.jsp");
	}
	
	public void anywhere2index(){
		
		Page<Record> adminList = AdminService.getAdminByPage(1);

		this.getRequest().setAttribute("adminList", adminList);

		renderJsp("/adminIndex.jsp");
	}



}
