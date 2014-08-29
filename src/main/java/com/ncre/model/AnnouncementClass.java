package com.ncre.model;

import java.util.Map;

import com.jfinal.plugin.activerecord.Model;

public class AnnouncementClass extends Model<AnnouncementClass> {
	
	public static final AnnouncementClass dao = new AnnouncementClass();
	
	public Map<String, Object> getAttrs(){
	    return super.getAttrs();
	}
}
