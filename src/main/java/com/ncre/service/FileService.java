package com.ncre.service;

import java.io.File;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.ncre.model.FileClass;
import com.ncre.utils.EnvVar;
import com.ncre.utils.FileType;

public class FileService extends CommonService{
	
	/**
	 * 返回记录列表
	 * 2014年9月4日 16:47:08
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page<Record> getRecordList(int pageNum, int pageSize,int type){
		String select = "select *";
		String sqlExceptSelect = "from file where type = '"+type+"'";
		Page<Record> list = Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
		return list;
	}
	
	/**
	 * 保存一个对象
	 * @param fileClass
	 * @param uploadFile
	 * @return
	 */
	public static boolean save(FileClass fileClass,UploadFile uploadFile){
		boolean flag = false;
		 
		if(uploadFile == null ){
			return flag;
		}
		fileClass.set("uri", uploadFile.getFileName() );
		fileClass.set("upload_date", new java.util.Date() );
		flag = fileClass.save();
		return flag;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public static boolean delete(Object id){
		boolean flag = false;
		FileClass fileClass = null;
		fileClass = FileClass.dao.findById(id);
		if(fileClass != null){
			File file = new File( EnvVar.getFileAbsPath( fileClass.get("uri").toString() ) );
			if(file.exists()) file.delete();
			flag = fileClass.delete();
		}
		return flag;
	}
	
	public static boolean update(FileClass fileClass,UploadFile uploadFile){
		boolean flag = false;
		
		
		if(uploadFile == null ){
			flag = fileClass.update();
		}else{
			FileService.delete( fileClass.get("id") );
			flag = FileService.save(fileClass, uploadFile);
		}
		
		return flag;
	}
	
	public static FileClass find(Object id){
		return FileClass.dao.findById(id);
	}
	
	/**
	 * 增加一个对象
	 * @param uploadFile
	 * @return
	 */
	public static FileClass add(UploadFile uploadFile){
		if(uploadFile == null) return null;
		FileClass fileClass = new FileClass();
		fileClass.set("title", uploadFile.getOriginalFileName());
		fileClass.set("type", FileType.ENCLOSURE);
		FileService.save(fileClass, uploadFile);
		return fileClass;
	}
	
	
}
