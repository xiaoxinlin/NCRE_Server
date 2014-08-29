package com.ncre.utils;

import java.io.File;

import com.jfinal.kit.PathKit;

public final class EnvVar {
	
	public static  String SAVEFOLDER = PathKit.getWebRootPath()+File.separator+"upload";
	
	public static void display(){
		System.out.println(SAVEFOLDER);
	}
	
	public static String getFileAbsPath(String fileName){
		return SAVEFOLDER + File.separator + fileName;
	}
}
