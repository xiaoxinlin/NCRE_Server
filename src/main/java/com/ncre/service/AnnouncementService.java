package com.ncre.service;

import java.io.File;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.ncre.model.AnnouncementClass;
import com.ncre.model.FileClass;
import com.ncre.utils.EnvVar;
import com.ncre.utils.FileType;

public final class AnnouncementService extends CommonService{
	
	public static int ANNOOFRECORD	=	1;
	public static int ANNOOFOBJECT	=	2;
	
	/**
	 * 接受一个页码,返回该页的公告列表
	 * @param pageNum
	 * @return
	 */
	public static Page<Record> getAnnounByPage(String pageNum){
		//每页条数为9条
		int pageSize = 9;
		return getAnnounByPage(pageNum, pageSize,ANNOOFRECORD);
	}
	
	/**
	 * 接受页码和每页记录的条数，返回该页的公告列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page getAnnounByPage(String pageNum,int pageSize,int annoType){
		int pageNumI = 0;
		
		try{
			pageNumI = Integer.parseInt(pageNum);
		}catch(Exception e){
			pageNumI = 1;
		}
		String sql = "from `announcement`";
		switch (annoType) {
		case 1:
			Page  annoList  = getRecordByPage(pageNumI,pageSize,sql);
			return annoList;
		case 2:
			Page annoList1 = AnnouncementClass.dao.paginate(pageNumI,pageSize,"select * ",sql);
			return annoList1;
		default:
			return null;
		}
		
		
	}
	
	/**
	 * 删除一条公告
	 * @param id
	 */
	public static void deleteAnnouncement(Object id){
		/**
		 * 1、查找该id对应的对象
		 * 2、查看该对象有没有附件，如果有，继续第3步，如果没有，直接删除该对象
		 * 3、查看该附件对应的文件对象，并查看该附件
		 * 4、删除附件
		 * 5、删除对象，并删除对应的文件对象
		 * 
		 */
		AnnouncementClass announcementClass = AnnouncementClass.dao.findById(id);
		FileClass fileClass = null;
		File enclosure = null;
		
		//如果有附件,处理附件
		if(announcementClass.get("uri")!=null){
			fileClass = FileClass.dao.findById(announcementClass.get("file_id"));
			enclosure = new File( EnvVar.getFileAbsPath( fileClass.get("uri").toString() ) );
			if( enclosure.exists() )enclosure.delete();
		}
		
		announcementClass.delete();
		if(fileClass != null) fileClass.delete();
		
	}
	
	//增加一条公告
	public static void addAnnouncement(AnnouncementClass announcementClass,UploadFile uploadFile){
			
			if(uploadFile!=null){
				FileClass fileClass = new FileClass();
				
				fileClass.set("title", uploadFile.getOriginalFileName())
				.set("uri", uploadFile.getFileName())
				.set("upload_date", new java.util.Date() )
				.set("type", FileType.ENCLOSURE)
				.save();
				
				announcementClass.set("file_id", fileClass.get("id") )
				.set("uri", uploadFile.getOriginalFileName());
			}
			announcementClass.set("create_date", new java.util.Date()).save();
			
	}
	
	public static void updateAnnouncement(AnnouncementClass updatedAnnouncementClass,UploadFile uploadFile){
		AnnouncementClass announcementClass = AnnouncementClass.dao
				.findById(updatedAnnouncementClass.get("id"));
		if( ( uploadFile == null) || ( announcementClass.get("uri") == uploadFile.getOriginalFileName() ) ){
			
			
			announcementClass.set("title", updatedAnnouncementClass.get("title"));
			announcementClass.set("context", updatedAnnouncementClass.get("context"));
			
		}else if( announcementClass.get("uri") != uploadFile.getOriginalFileName() ){
			
			AnnouncementService.deleteAnnouncement(updatedAnnouncementClass.get("id"));
			AnnouncementService.addAnnouncement(updatedAnnouncementClass, uploadFile);
			
		}
		
		announcementClass.update();
	}
	
	public static AnnouncementClass find(Object id){
		return AnnouncementClass.dao.findById(id);
	}
}
