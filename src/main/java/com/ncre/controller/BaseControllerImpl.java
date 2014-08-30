package com.ncre.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

public class BaseControllerImpl extends Controller implements
		BaseControllerI<BaseControllerImpl> {

	public void add() {
		// TODO Auto-generated method stub
	}

	public void delete() {
		// TODO Auto-generated method stub
		
	}

	public void index() {
		// TODO Auto-generated method stub
		
	}

	public void show() {
		// TODO Auto-generated method stub
		
	}

	public void update() {
		// TODO Auto-generated method stub
		
	}

	public UploadFile getFile(String saveDirectory, int maxPostSize) {
		List<UploadFile> uploadFiles = getFiles(saveDirectory,maxPostSize);
		UploadFile uploadFile = uploadFiles.size()>0?uploadFiles.get(0):null;
		return uploadFile;
	}
	
	public UploadFile getFile(String saveDirectory){
		List<UploadFile> uploadFiles = getFiles(saveDirectory);
		UploadFile uploadFile = uploadFiles.size()>0?uploadFiles.get(0):null;
		return uploadFile;
	}

}
