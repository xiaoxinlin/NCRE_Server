package com.ncre.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.model.XztClass;


public class XztService extends CommonService{
	
	//增加一个对象
	public static boolean save(XztClass xztClass){
		return xztClass.save();
	}
	
	//删除一个对象
	public static boolean delete(Object id){
		return XztClass.dao.deleteById(id);
	}
	
	//更新一个对象
	public static boolean update(XztClass xztClass){
		return xztClass.update();
	}
	
	//查找一个对象
	public static XztClass find(Object id){
		return XztClass.dao.findById(id);
	}
	
	//得到对象记录
	public static Page<Record> getRecordList(int pageNum,int pageSize,int subjectType){
		String select = "select *";
		String sqlExceptSelect = "from `xzt` where subject_type = '"+subjectType+"'";
		Page<Record> list = Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
		return list;
	}
	
	//返回一个选择题对象
	public static XztClass getSingleXzt(int subjectType){
		String index = getSingleRandom(subjectType,1);
		String sql = "select * from `xzt` where id in ("+index+")";
		XztClass xztClass = XztClass.dao.findFirst(sql);
		return xztClass;
		
	}
	//返回3个选择题对象
	public static List<XztClass> getXztList(int subjectType){
		String index = getSingleRandom(subjectType,3);
		String sql = "select * from `xzt` where id in ("+index+")";
		List<XztClass> xztClass = XztClass.dao.find(sql);
		return xztClass;
		
	}
	
	//返回指定长度的选择题随机数
	public static String getSingleRandom(int subjectType,int size){
		String sql = "select id from `xzt` where subject_type='"+subjectType+"'";
		String index = getRandom(sql, size);
		return index;
	}
	
	//产生指定长度的随机数
	private static String getRandom(String sql,int size){
		String index = "";
		List<XztClass> nums = XztClass.dao.find(sql);
		List<String> xztIdList = new ArrayList<String>();

		if (nums == null || nums.size() == 0) {
			return null;
		}
		// 如果数据多于pageSize，则进行随机抽取之后，放入列表
		if (nums.size() >= size) {

			while (true) {
				// 获取一个随机数
				int temp = (int) (Math.random() * nums.size());
				// 如果数据等于十行，则跳出循环
				if (xztIdList.size() == size) {
					break;
				}
				// 如果列表中不包含该id，则把该id放入列表
				if (!xztIdList.contains(nums.get(temp).get("id").toString())) {
					xztIdList.add(nums.get(temp).get("id").toString());
				}
			}

		} else {
			// 如果数据少于十行，则全部放入列表
			for (XztClass num : nums) {

				xztIdList.add(num.getStr("id"));
			}
		}
		// 把随机的id拼接成一个字符串
		for (String id : xztIdList) {

			index = index + "," + id;
		}

		index = index.substring(1);
		return index;
	}
}
