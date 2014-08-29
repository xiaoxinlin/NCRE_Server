package com.ncre.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.ncre.model.AnnouncementClass;
import com.ncre.model.FileClass;
import com.ncre.service.AnnouncementService;
import com.ncre.utils.EnvVar;
import com.ncre.utils.FileType;

public class AnnouncementController extends Controller implements
		BaseControllerI<AnnouncementController> {
	/**
	 * 添加公告信息
	 * 
	 * @param announcementClass
	 *            .title 公告标题 ,announcementClass.context 公告内容
	 * @return
	 */
	public void add() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		List<UploadFile> uploadFiles = getFiles(EnvVar.SAVEFOLDER);
		UploadFile uploadFile = uploadFiles.size()>0?uploadFiles.get(0):null;

		// 利用模型驱动给对象赋值
		AnnouncementClass announcementClass = getModel(AnnouncementClass.class);

		// 如果有附件存在，则给uri赋值
		if (uploadFile != null) {

			announcementClass.set("uri",uploadFile.getFileName());
			//创建一个文件对象
			FileClass fileClass = new FileClass();
			fileClass.set("title", uploadFile.getOriginalFileName())
			.set("uri", uploadFile.getFileName())
			.set("upload_date", new java.util.Date())
			.set("type", FileType.ENCLOSURE)
			.save();
			
		}
		// 设置公告创建时间
		announcementClass.set("create_date", new java.util.Date());
		// 保存
		announcementClass.save();

		//renderJson(announcementClass);
		redirect("/announcement/anywhere2index");
	}

	/**
	 * 删除公告信息，连带删除上传的附件
	 * 
	 * @param id
	 */
	@Before(Tx.class)
	public void delete() {

		String id = getPara("id");
		boolean flag = false;

		AnnouncementClass announcementClass = AnnouncementClass.dao
				.findById(id);

		File file = new File(announcementClass.getStr("uri"));
		if (file.exists())
			file.delete();

		flag = announcementClass.delete();

		renderText(flag + "");

	}

	/**
	 * 显示公告列表
	 * 
	 * @param pageNow
	 */
	public void index() {

		// 获取当前页数，若为空，则默认为1
		String pageNow = getPara("pageNow");

		if ("".equals(pageNow) || pageNow == null) {
			pageNow = "1";
		}

		// 每一页的数据数
		int pageSize = 10;

		Page<AnnouncementClass> announcementList = AnnouncementClass.dao
				.paginate(Integer.parseInt(pageNow), pageSize, "select *",
						"from `announcement`");

		renderJson(announcementList);

	}
	
	/**
	 * 后台的公告列表，接收一个页码
	 */
	public void getAnnounList() {

		// 获取当前页数，若为空，则默认为1
		String pageNow = getPara("pageNow");
		int pageNowI = 0;
		
		try{
			pageNowI = Integer.parseInt(pageNow);
		}catch(Exception e){
			pageNowI = 1;
		}

		// 每一页的数据数
		
		Page<Record>  annoList  = AnnouncementService.getAnnounByPage(pageNowI);
		
		this.getRequest().setAttribute("annoList", annoList);

		renderJsp("/annoIndex.jsp");

	}

	/**
	 * 显示某一条公告的详细信息
	 * 
	 * @param id
	 * @return
	 */
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
	 * 
	 * @param announcementClass
	 * @return
	 */
	public void update() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile();

		// 利用模型驱动给对象赋值
		AnnouncementClass newAnnouncementClass = getModel(AnnouncementClass.class);

		AnnouncementClass announcementClass = AnnouncementClass.dao
				.findById(newAnnouncementClass.get("id"));
		announcementClass.set("title", newAnnouncementClass.get("title"));
		announcementClass.set("context", newAnnouncementClass.get("context"));

		// 删除原公告的附件
		if (!("".equals(announcementClass.get("uri")) || announcementClass
				.get("uri") == null)) {
			File file = new File(announcementClass.getStr("uri"));
			if (file.exists())
				file.delete();
		}

		// 如果新附件存在，则给uri赋值，不存在，则将uri置空
		if (uploadFile == null) {

			announcementClass.set("uri", null);
		} else {

			announcementClass.set("uri", uploadFile.getSaveDirectory()
					+ uploadFile.getFileName());
		}

		announcementClass.update();
	}

	/**
	 * 显示首页公告
	 * 
	 */
	public void showIndexAnnouncement(){
		
		String  counts = "7";
		
		List<AnnouncementClass> Announcements =  AnnouncementClass.dao.find("SELECT * FROM `announcement` GROUP BY id DESC LIMIT 0 , "+counts);

		
		renderJson(Announcements);
	}

	//以下为过渡的一些控制器，便于拦截器的控制
	
	/**
	 * 进入添加公告页面
	 * 2014年8月29日 23:41:48
	 */
	public void index2add(){
	
		renderJsp("/b-anno-add.jsp");
	}
	
	public void anywhere2index(){
		
		Page<Record>  annoList  = AnnouncementService.getAnnounByPage(1);
		
		this.getRequest().setAttribute("annoList", annoList);

		renderJsp("/b-superadmin-anno.jsp");
	}
}
