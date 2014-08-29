package com.ncre.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class CommonService {
	
	/**
	 * 接受页码和记录条数，和查询的sql语句
	 * @param pageNum
	 * @param pageSize
	 * @param sql
	 * @return recordList
	 */
	public static Page<Record> getRecordByPage(int pageNum,int pageSize,String sql){
		
		Page<Record>  recordList  = Db.paginate(pageNum, pageSize,  "select *",  sql);
		return recordList;
	}
}
