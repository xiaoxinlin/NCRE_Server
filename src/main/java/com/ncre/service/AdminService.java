package com.ncre.service;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class AdminService extends CommonService{
	
	/**
	 * 接受一个页码,返回该页的管理员列表
	 * @param pageNum
	 * @return
	 */
	public static Page<Record> getAdminByPage(int pageNum){
		//每页条数为9条
		int pageSize = 9;
		return getAdminByPage(pageNum, 9);
	}
	
	/**
	 * 接受页码和每页记录的条数，返回该页的管理员列表
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public static Page<Record> getAdminByPage(int pageNum,int pageSize){
		String sql = "from `admin`";
		Page<Record>  adminList  = getRecordByPage(pageNum,pageSize,sql);
		return adminList;
	}
}
