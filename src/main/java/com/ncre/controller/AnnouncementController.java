package com.ncre.controller;

import java.io.File;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.ncre.interceptor.AccessControlAllowOrigin;
import com.ncre.model.AnnouncementClass;
import com.ncre.model.FileClass;
import com.ncre.service.AnnouncementService;
import com.ncre.utils.EnvVar;
import com.ncre.utils.FileType;

public class AnnouncementController extends BaseControllerImpl {
	/**
	 * 添加公告信息
	 * 
	 * @param announcementClass
	 *            .title 公告标题 ,announcementClass.context 公告内容
	 * @return
	 */
	public void add() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile(EnvVar.SAVEFOLDER);

		// 利用模型驱动给对象赋值
		AnnouncementClass announcementClass = getModel(AnnouncementClass.class);
		AnnouncementService.addAnnouncement(announcementClass, uploadFile);
		renderText("添加公告成功！！");
	}

	/**
	 * 删除公告信息，连带删除上传的附件
	 * 2014年8月30日 18:35:48
	 * @param id
	 */
	@Before(Tx.class)
	public void delete() {

		String id = getPara("id");
		AnnouncementService.deleteAnnouncement(id);
		redirect("/announcement/anywhere2index");
	}

	/**
	 * 前台显示公告列表
	 * 
	 * @param pageNow
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(AccessControlAllowOrigin.class)
	public void index() {

		// 获取当前页数，若为空，则默认为1
		int pageNumber = AnnouncementService.StringNum2int( getPara("page") );
		
		// 每一页的数据数
		int pageSize = 14;
		
		String select = "select id,title,create_date";
		
		String sqlExceptSelect = "from `announcement`";

		Page<AnnouncementClass> announcementList = AnnouncementClass.dao.paginate(pageNumber, pageSize, select, sqlExceptSelect);

		renderJson(announcementList);

	}
	
	/**
	 * 后台的公告列表，接收一个页码
	 */
	public void getAnnounList() {

		// 获取当前页数，若为空，则默认为1
		String pageNow = getPara("pageNow");

		// 每一页的数据数
		
		Page<Record>  annoList  = AnnouncementService.getAnnounByPage(pageNow);
		
		this.getRequest().setAttribute("annoList", annoList);

		renderJsp("/annoIndex.jsp");

	}

	/**
	 * 前台返回一个公告对象
	 * 
	 * @param id
	 * @return
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(AccessControlAllowOrigin.class)
	public void show() {

		String id = getPara("id");

		AnnouncementClass announcementClass = AnnouncementClass.dao
				.findById(id);
		if (announcementClass != null) {
			renderJson(announcementClass);
		} else {
			renderText("object is null!!");
		}
	}

	/**
	 * 更新某条公告的信息
	 * 2014年8月30日 19:11:07
	 * @param announcementClass
	 * @return
	 */
	@Before(Tx.class)
	public void update() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile(EnvVar.SAVEFOLDER,50000000);
		// 利用模型驱动给对象赋值
		AnnouncementClass updatedAnnouncementClass = getModel(AnnouncementClass.class);
		AnnouncementService.updateAnnouncement(updatedAnnouncementClass, uploadFile);
		renderText("修改公告成功！");
	}

	/**
	 * 显示前台首页公告
	 * 
	 */
	@ClearInterceptor(ClearLayer.ALL)
	@Before(AccessControlAllowOrigin.class)
	public void showIndexAnnouncement(){
		
		String  counts = "7";
		
		List<AnnouncementClass> Announcements =  AnnouncementClass.dao.find("SELECT id,title,create_date FROM `announcement` GROUP BY id DESC LIMIT 0 , "+counts);
		
		
		renderJson(Announcements);
	}

	//以下为过渡的一些控制器，便于拦截器的控制
	
	/**
	 * 进入添加公告页面
	 * 2014年8月29日 23:41:48
	 */
	public void index2add(){
	
		renderJsp("/anno-add.jsp");
	}
	
	public void anywhere2index(){
		
		Page<Record>  annoList  = AnnouncementService.getAnnounByPage("1");
		
		this.getRequest().setAttribute("annoList", annoList);

		renderJsp("/annoIndex.jsp");
	}
	
	public void index2update(){
		String id = getPara("id");
		
		Record anno = Db.findById("announcement", id);
		
		setAttr("updatedAnno", anno);
		
		renderJsp("/anno-update.jsp");
	}
	
	public void index2detail(){
		
		String id = getPara("id");
		
		AnnouncementClass announcementClass = AnnouncementService.find(id);
		
		setAttr("anno", announcementClass);
		
		renderJsp("/anno-detail.jsp");
	}
}
