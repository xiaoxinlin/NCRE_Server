package com.ncre.controller;

import com.jfinal.upload.UploadFile;

public interface BaseControllerI<T> {
	
	//显示全部对象
	public void index();
	
	//显示指定id的单个对象
	public void show();
	
	//增加对象
	public void add();
	
	//删除对象
	public void delete();
	
	//更新对象
	public void update();
	
	//从前台接收一个文件
	public UploadFile getFile(String saveDirectory, int maxPostSize);
	
	public UploadFile getFile(String saveDirectory);
	
}
