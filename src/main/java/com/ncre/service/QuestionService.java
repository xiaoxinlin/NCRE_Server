package com.ncre.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.ncre.model.FileClass;
import com.ncre.model.QuestionClass;

public class QuestionService extends CommonService{
	
	/**
	 * 返回一个记录列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page<Record> getRecordListByPage(int pageNum,int pageSize){
		
		String select = "select *";
		String sqlExceptSelect = "from `question`";
		
		Page<Record> list = Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
		
		return list;
	}
	
	/**
	 * 返回一个对象列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page<QuestionClass> getObjectListByPage(int pageNum,int pageSize){
		
		String select = "select *";
		String sqlExceptSelect = "from `question`";
		
		Page<QuestionClass> list = QuestionClass.dao.paginate(pageNum, pageSize, select, sqlExceptSelect);
		
		return list;
	}
	
	/**
	 * 查找一条记录
	 * @param id
	 * @return
	 */
	public static Record find(Object id){
		Record record = Db.findById("question", id);
		return record;
	}
	
	/**
	 * 更新
	 * @param questionClass
	 * @param uploadFile
	 * @return
	 */
	public static boolean update(QuestionClass questionClass,UploadFile uploadFile){
		
		//原问题对象的附件id
		Object fileId = null;
		//如果没上传附件，则只更新标题和内容
		if(uploadFile != null){
			//判断原问题对象是否有附件，有则把文件id赋给fileId
			QuestionClass questionClass2 = QuestionClass.dao.findById(questionClass.get("id"));
			fileId = questionClass2.get("file_id");
			
			//增加一个新的文件对象，并修改问题对象的字段
			FileClass fileClass = FileService.add(uploadFile);
			if(fileClass != null){
				questionClass.set("uri", fileClass.get("uri"));
				questionClass.set("file_id", fileClass.get("id"));
				
			}
			
		}
		//更新问题对象
		boolean flag = questionClass.update();
		//如果有新附件，则把旧附件删除
		if(fileId != null&&uploadFile != null)FileService.delete(fileId);
		return flag;
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public static boolean delete(Object id){
		return QuestionClass.dao.deleteById(id);
	}
	
	public static boolean save(QuestionClass questionClass,UploadFile uploadFile){
		
		boolean flag = false;
		if(uploadFile != null){
		
			FileClass fileClass = FileService.add(uploadFile);
			questionClass.set( "uri", fileClass.get("uri") );
			questionClass.set( "file_id", fileClass.get("id") );
		}
		
		questionClass.set("is_legal", false);
		flag = questionClass.save();
		return flag;
	}
}
