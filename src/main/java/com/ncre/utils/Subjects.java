package com.ncre.utils;

import java.util.ArrayList;
import java.util.List;

public class Subjects {
	
	private static Subjects subjects = new Subjects();
	public  List<String> subjectsTable = new ArrayList<String>();
	
	//类型的映射表
	private Subjects(){
		subjectsTable.add("计算机基础及WPS Office应用");
		subjectsTable.add("计算机基础及MS Office应用");
		subjectsTable.add("计算机基础及Photoshop应用");
		subjectsTable.add("C语言程序设计");
		subjectsTable.add("Visual Basic语言程序设计");
		subjectsTable.add("Visual FoxPro数据库程序设计");
		subjectsTable.add("Java语言程序设计");
		subjectsTable.add("Access数据库程序设计");
		subjectsTable.add("C++语言程序设计");
		subjectsTable.add("My SQL数据库程序设计");
		subjectsTable.add("Web程序设计");
		subjectsTable.add("MS Office高级应用");
		subjectsTable.add("网络技术");
		subjectsTable.add("数据库技术");
		subjectsTable.add("软件测试技术");
		subjectsTable.add("信息安全技术");
		subjectsTable.add("嵌入式系统开发技术");
		subjectsTable.add("网络工程师");
		subjectsTable.add("数据库工程师");
		subjectsTable.add("软件测试工程师");
		subjectsTable.add("信息安全工程师");
		subjectsTable.add("嵌入式系统开发工程师");
	}
	public static Subjects getInstance(){
		return subjects;
	}
}
