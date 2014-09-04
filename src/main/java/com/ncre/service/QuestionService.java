package com.ncre.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
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
	 * @return
	 */
	public static boolean update(QuestionClass questionClass){
		boolean flag = questionClass.update();
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
	
}
