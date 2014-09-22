package com.ncre.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ncre.model.TktClass;
import com.ncre.utils.ExamConfig;

public class TktService extends CommonService{

	public static final int TKT_LITTLE = 0;
	public static final int TKT_BIG = 1;
	
	
	//增加一个对象
	public static boolean save(TktClass tktClass){
		return tktClass.save();
	}
	
	//删除一个对象
	public static boolean delete(Object id){
		return TktClass.dao.deleteById(id);
	}
	
	//更新一个对象
	public static boolean update(TktClass tktClass){
		return tktClass.update();
	}
	
	//查找一个对象
	public static TktClass find(Object id){
		return TktClass.dao.findById(id);
	}
	
	//得到随机填空题对象列表
	public static List<TktClass> getRandomLTktList(int type,int pageSize) {

		String index = getLtktRandom(type,pageSize);
		// 从数据库中查询随机的数据
		String sql = "select * from tkt where id in (" + index + ")";
		List<TktClass> tktList = TktClass.dao.find(sql);

		return tktList;
	}
	
	//得到随机填空题对象记录
	public static List<Record> getRandomLTktRecord(int type,int pageSize) {

		String index = getLtktRandom(type,pageSize);
		// 从数据库中查询随机的数据
		String sql = "select * from `tkt` where id in (" + index + ")";
		
		List<Record> list = Db.find(sql);

		return list;
	}
	
	//得到填空题对象记录
//	public static Page<Record> getLtktRecord(int pageNum,int pageSize,int subjectType){
//		String select = "select *";
//		String sqlExceptSelect = "from `tkt` where type = '"+TKT_LITTLE+"' and subject_type = '"+subjectType+"'";
//		Page<Record> list = Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
//		return list;
//	}
	
	//得到随机大题对象列表
	public static List<TktClass> getRandomBTktList(int type,int counts) {

		String index = getBtktRandom(type,counts);
		// 从数据库中查询随机的数据
		String sql = "select * from tkt where id in (" + index + ")";
		List<TktClass> tktList = TktClass.dao.find(sql);

		return tktList;
	}
	
	//得到随机大题对象记录
	public static List<Record> getRandomBTktRecord(int type,int counts) {

		String index = getBtktRandom(type,counts);
		// 从数据库中查询随机的数据
		String sql = "select * from tkt where id in (" + index + ")";
		List<Record> list = Db.find(sql);

		return list;
	}
	
	//得到对象记录
	public static Page<Record> getRecordList(int pageNum,int pageSize,int subjectType){
		String select = "select *";
		String sqlExceptSelect = "from `tkt` where subject_type = '"+subjectType+"'";
		Page<Record> list = Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
		return list;
	}
	
	
	//产生指定长度的随机数
	private static String getRandom(String sql,int size){
		String index = "";
		List<TktClass> nums = TktClass.dao.find(sql);
		List<String> tktIdList = new ArrayList<String>();

		if (nums == null || nums.size() == 0) {
			return null;
		}
		// 如果数据多于pageSize，则进行随机抽取之后，放入列表
		if (nums.size() >= size) {

			while (true) {
				// 获取一个随机数
				int temp = (int) (Math.random() * nums.size());
				// 如果数据等于十行，则跳出循环
				if (tktIdList.size() == size) {
					break;
				}
				// 如果列表中不包含该id，则把该id放入列表
				if (!tktIdList.contains(nums.get(temp).get("id").toString())) {
					tktIdList.add(nums.get(temp).get("id").toString());
				}
			}

		} else {
			// 如果数据少于十行，则全部放入列表
			for (TktClass num : nums) {

				tktIdList.add(num.get("id").toString());
			}
		}
		// 把随机的id拼接成一个字符串
		for (String id : tktIdList) {

			index = index + "," + id;
		}

		index = index.substring(1);
		return index;
	}
	//得到填空题的随机数
	private static String getLtktRandom(int type,int size){
		String sql = "select id from tkt where type = '" + TKT_LITTLE
		+ "' and subject_type = '" + type + "'";
		String index = getRandom(sql,size);
		return index;
	}
	//得到大题的随机数
	private static String getBtktRandom(int type,int size){
		String sql = "select id from tkt where type = '" + TKT_BIG
		+ "' and subject_type = '" + type + "'";
		String index = getRandom(sql,size);
		return index;
	}
	
	//得到每日一练填空题
	public static List<TktClass> getTestLTktList(int type){
		
		ExamConfig examConfig = (ExamConfig)JFinal.me().getServletContext().getAttribute("examConfig");
		String index = getLtktRandom(type, examConfig.getTktNumsOfTEST());
		
		String sql = "select * from `tkt` where id in (" + index + ")";
		
		return TktClass.dao.find(sql);
	}
	//得到在线测试大题
	public static List<TktClass> getExamDtList(int type){
		
		ExamConfig examConfig = (ExamConfig)JFinal.me().getServletContext().getAttribute("examConfig");
		String index = getBtktRandom(type, examConfig.getDtNumsOfEXAM());
		
		String sql = "select * from `tkt` where id in (" + index + ")";
		
		return TktClass.dao.find(sql);
	}
	
	//得到在线测试填空题
	public static List<TktClass> getExamLTktList(int type){
		
		ExamConfig examConfig = (ExamConfig)JFinal.me().getServletContext().getAttribute("examConfig");
		String index = getLtktRandom(type,examConfig.getTktNumsOfEXAM());
		
		String sql = "select * from `tkt` where id in (" + index + ")";
		
		return TktClass.dao.find(sql);
	}
}
