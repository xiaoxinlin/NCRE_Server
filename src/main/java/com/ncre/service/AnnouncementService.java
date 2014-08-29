package com.ncre.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public final class AnnouncementService extends CommonService{
	
	/**
	 * 接受一个页码,返回该页的公告列表
	 * @param pageNum
	 * @return
	 */
	public static Page<Record> getAnnounByPage(int pageNum){
		//每页条数为9条
		int pageSize = 9;
		return getAnnounByPage(pageNum, 9);
	}
	
	/**
	 * 接受页码和每页记录的条数，返回该页的公告列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page<Record> getAnnounByPage(int pageNum,int pageSize){
		String sql = "from `announcement`";
		Page<Record>  annoList  = getRecordByPage(pageNum,pageSize,sql);
		return annoList;
	}
}
