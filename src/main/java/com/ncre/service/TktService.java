package com.ncre.service;

import java.util.ArrayList;
import java.util.List;

import com.ncre.model.TktClass;

public class TktService {

	public static final int TKT_LITTLE = 0;
	public static final int TKT_BIG = 1;

	public static List<TktClass> showLTkt(String type) {

		String sql = "select id from tkt where type = '" + TKT_LITTLE
				+ "' and subject_type = '" + type + "'";
		String index = "";
		List<TktClass> nums = TktClass.dao.find(sql);
		List<String> tktIdList = new ArrayList<String>();

		if (nums == null || nums.size() == 0) {
			return null;
		}
		// 如果数据多于十行，则进行随机抽取之后，放入列表
		if (nums.size() >= 10) {

			while (true) {
				// 获取一个随机数
				int temp = (int) (Math.random() * nums.size());
				// 如果数据等于十行，则跳出循环
				if (tktIdList.size() == 10) {
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
		// 从数据库中查询随机的数据
		sql = "select * from tkt where id in (" + index + ")";
		List<TktClass> tktList = TktClass.dao.find(sql);

		return tktList;
	}

	public static List<TktClass> showBTkt(String type) {

		int counts = 2;
		String sql = "select id from tkt where type = '" + TKT_BIG
				+ "' and subject_type = '" + type + "'";
		String index = "";
		List<TktClass> nums = TktClass.dao.find(sql);
		List<String> tktIdList = new ArrayList<String>();

		if (nums == null || nums.size() == 0) {
			return null;
		}
		// 如果数据多于2行，则进行随机抽取之后，放入列表
		if (nums.size() >= counts) {

			while (true) {
				// 获取一个随机数
				int temp = (int) (Math.random() * nums.size());
				// 如果数据等于十行，则跳出循环
				if (tktIdList.size() == counts) {
					break;
				}
				// 如果列表中不包含该id，则把该id放入列表
				if (!tktIdList.contains(nums.get(temp).get("id").toString())) {
					tktIdList.add(nums.get(temp).get("id").toString());
				}
			}

		} else {
			// 如果数据少于2行，则全部放入列表
			for (TktClass num : nums) {

				tktIdList.add(num.get("id").toString());
			}
		}
		// 把随机的id拼接成一个字符串
		for (String id : tktIdList) {

			index = index + "," + id;
		}

		index = index.substring(1);
		// 从数据库中查询随机的数据
		sql = "select * from tkt where id in (" + index + ")";
		List<TktClass> tktList = TktClass.dao.find(sql);

		return tktList;
	}
}
