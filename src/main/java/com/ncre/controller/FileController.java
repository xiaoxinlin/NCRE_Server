package com.ncre.controller;

import java.io.File;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.ncre.model.FileClass;
import com.ncre.service.FileService;
import com.ncre.utils.EnvVar;
import com.ncre.utils.FileType;

public class FileController extends BaseControllerImpl  {
	/**
	 * 增加一个文件，前台的表单中的enctype必须为multipart/form-data
	 * 
	 * @param fileClass
	 *            .title,fileClass.type,file
	 * @return
	 */
	@Before(Tx.class)
	public void add() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile(EnvVar.SAVEFOLDER,600000000);
		FileClass fileClass = getModel(FileClass.class);
		FileService.save(fileClass, uploadFile);
		if(fileClass.getInt("type") == FileType.DOC){
			
			redirect("/file/anywhere2doc");
		}else if(fileClass.getInt("type") == FileType.SOFTWARE){
			
			redirect("/file/anywhere2soft");
		}
	}

	/**
	 * 删除一个文件对象（并删除文件对象）
	 * 
	 * @param id
	 * @return
	 */
	@Before(Tx.class)
	public void delete() {

		String id = getPara("id");
		FileService.delete(id);
		redirect("/file/anywhere2soft");
	}
	/**
	 * 获取文件第一页列表,每一页为14条记录
	 * @param pageNum
	 * @return 返回一个page对象
	 */
	public void index() {
		int pageNumber = 1;
		if(getPara("page") != null){
			pageNumber = Integer.parseInt( getPara("page") );
		}
		
		int pageSize = 14;
		Page<FileClass> fileList = FileClass.dao.paginate(pageNumber, pageSize,
				"select *", " from file " );
		renderJson(fileList);
	}
	/**
	 * 通过类型获取文件第一页列表,每一页为14条记录
	 * 
	 * @param type
	 *            -- 需要传入一个文件类型
	 *        pageNum
	 *        	  -- 页码
	 * @return 返回一个page对象
	 */
	public void indexByType() {
		String type = getPara("type");
		int pageNumber = 1;
		if(getPara("page") != null){
			pageNumber = Integer.parseInt( getPara("page") );
		}
		int pageSize = 14;
		Page<FileClass> fileList = FileClass.dao.paginate(pageNumber, pageSize,
				"select *", " from file where type = ?", type);

		renderJson(fileList);
	}

	/**
	 * 显示一个文件对象的详细信息
	 * 
	 * @param id
	 * @return
	 */
	public void show() {

		String id = getPara("id");

		FileClass fileClass = FileClass.dao.findById(id);

		renderJson(fileClass);
	}
	
	/**
	 * 修改一个文件对象，前台的表单中的enctype必须为multipart/form-data
	 * 如果修改对象中的文件，若文件在upload文件夹中存在，则不会再次保存，不存在则保存
	 * 
	 * @param fileClass.id,fileClass.title,fileClass.type,file
	 * @return
	 */
	public void update() {

		UploadFile uploadFile = getFile(EnvVar.SAVEFOLDER,600000000);
		if(uploadFile == null){
			//TODO:
		}
		FileClass fileClass = getModel(FileClass.class);
		
		FileService.update(fileClass,uploadFile);
		
		redirect("/file/anywhere2soft");
	}
	
	/**文件下载功能
	 *@param id 
	 */
	public void download(){
		String id = getPara("id");
		
		FileClass fileClass = FileClass.dao.findById(id);
		
		String fileName= fileClass.get("uri");
		
		
		File file = new File(EnvVar.getFileAbsPath(fileName));
		
		renderFile(file);
      
	}
	
	public void getSoftList(){
		int pageNum = FileService.StringNum2int(getPara("pageNow"));
		int pageSize = 9;
		Page<Record> list = FileService.getRecordList(pageNum, pageSize, FileType.SOFTWARE);
		setAttr("list", list);
		renderJsp("/softIndex.jsp");
	}
	
	public void getDocList(){
		int pageNum = FileService.StringNum2int(getPara("pageNow"));
		int pageSize = 9;
		Page<Record> list = FileService.getRecordList(pageNum, pageSize, FileType.DOC);
		setAttr("list", list);
		renderJsp("/docIndex.jsp");
	}
	
	//到软件管理过渡的控制器
	public void anywhere2soft(){
		int pageNum = 1;
		int pageSize = 9;
		
		Page<Record> list = FileService.getRecordList(pageNum, pageSize, FileType.SOFTWARE);
		
		setAttr("list", list);
		
		renderJsp("/softIndex.jsp");
	}
	
	public void index2softAdd(){
		renderJsp("/soft-add.jsp");
	}
	
	public void index2softUpdate(){
		String id = getPara("id");
		
		FileClass fileClass = FileService.find(id);
		
		setAttr("file", fileClass);
		
		renderJsp("/soft-update.jsp");
	}
	
	//到文档管理的过渡控制器
	public void anywhere2doc(){
		int pageNum = 1;
		int pageSize = 9;
		
		Page<Record> list = FileService.getRecordList(pageNum, pageSize, FileType.DOC);
		
		setAttr("list", list);
		
		renderJsp("/docIndex.jsp");
	}
	
	public void index2docAdd(){
		renderJsp("/doc-add.jsp");
	}
	
	public void index2docUpdate(){
		String id = getPara("id");
		
		FileClass fileClass = FileService.find(id);
		
		setAttr("file", fileClass);
		
		renderJsp("/doc-update.jsp");
	}
}
