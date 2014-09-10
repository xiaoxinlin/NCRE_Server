package com.ncre.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;
import com.ncre.model.TktClass;
import com.ncre.model.XztClass;
import com.ncre.service.TktService;
import com.ncre.service.XztService;

public class ItemsController extends BaseControllerImpl{
	
	//获取一套测试题目
	@Before(CacheInterceptor.class)
	@CacheName("items2Index")
	public void index(){	
//		String type = getPara("type");
//		System.out.println(type);
//		if("".equals(type) || type == null){
//			renderText("参数出错");
//			return;
//		}
//		List items = new ArrayList();
//		
//
//		List<XztClass> xztList = XztService.showXzt(type);
//		List<TktClass> tktList1 = TktService.showLTkt(type);
//		List<TktClass> tktList2 = TktService.showBTkt(type);
//	
//		items.add(xztList);
//		items.add(tktList1);
//		items.add(tktList2);
//		
//		if(items!=null) renderJson(items);
//		return;
	}

	public void add() {
		// TODO Auto-generated method stub
		
	}
	@Before(EvictInterceptor.class)
	@CacheName("itemsIndex")
	public void delete() {
		// TODO Auto-generated method stub
		renderText("invoke delete!!");
	}


	public void show() {
//		String type = getPara("type");
//		System.out.println(type);
//		if("".equals(type) || type == null){
//			renderText("参数出错");
//			return;
//		}
//		
//		List<XztClass> xztList = XztService.showXzt(type);
//		
//		renderJson(xztList);
//		return;
	}

	public void update() {
		// TODO Auto-generated method stub
		
	}
}
