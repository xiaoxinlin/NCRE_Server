package com.ncre.service;

import java.util.ArrayList;
import java.util.List;

import com.ncre.model.XztClass;


public class XztService {
	
	public static List<XztClass> showXzt(String type) {

		String sql = "select id from xzt where subject_type = '" + type + "'";
		String index = "";
		List<XztClass> nums = XztClass.dao.find(sql);
		List<String> xztIdList = new ArrayList<String>();

		// 如果数据多于十行，则进行随机抽取之后，放入列表
		if (nums.size() >= 10) {

			while (true) {
				// 获取一个随机数
				int temp = (int) (Math.random() * nums.size());
				// 如果数据等于十行，则跳出循环
				if (xztIdList.size() == 10) {
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

				xztIdList.add(num.get("id").toString());
			}
		}
		// 把随机的id拼接成一个字符串
		for (String id : xztIdList) {

			index = index + "," + id;
		}
		index = index.substring(1);
		// 从数据库中查询随机的数据
		sql = "select * from xzt where id in (" + index + ")";
		List<XztClass> xztList = XztClass.dao.find(sql);

		return xztList;
	}
}
