package com.ncre.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;
import com.ncre.interceptor.AccessControlAllowOrigin;
import com.ncre.model.TktClass;
import com.ncre.model.XztClass;
import com.ncre.service.CommonService;
import com.ncre.service.TktService;
import com.ncre.service.XztService;

@ClearInterceptor(ClearLayer.ALL)
@Before(AccessControlAllowOrigin.class)
public class ItemsController extends BaseControllerImpl{
	
	//获取一套测试题目
	@Before(CacheInterceptor.class)
	@CacheName("items2Index")
	public void index(){	
	}

	public void add() {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 删除缓存
	 */
	@Before(EvictInterceptor.class)
	@CacheName("itemsIndex")
	public void delete() {
		int subjectType = CommonService.StringNum2int(getPara("subject-type"));
		redirect("/items/examList?subject-type="+subjectType);
	}


	public void show() {

	}

	public void update() {
		// TODO Auto-generated method stub
		
	}
	
	//获取每日一练的题目
	public void testList(){
		int subjectType = CommonService.StringNum2int(getPara("subject-type"));
		XztClass xzt = XztService.getSingleXzt(subjectType);
		TktClass tkt = TktService.getSingleLTkt(subjectType);
		List list = new ArrayList();
		list.add(xzt);
		list.add(tkt);
		renderJson(list);
	}
	
	//获取在线测试的题目
	@Before(CacheInterceptor.class)
	@CacheName("itemsIndex")
	public void examList(){
		int subjectType = CommonService.StringNum2int(getPara("subject-type"));
		List<XztClass> xztList = XztService.getXztList(subjectType);
		List<TktClass> tktList = TktService.getLTktList(subjectType);
		TktClass bTkt = TktService.getSingleBTkt(subjectType);
		
		List list = new ArrayList();
		list.add(xztList);
		list.add(tktList);
		list.add(bTkt);
		
		renderJson(list);
	}
	
	public void RefreshExamList(){
		int subjectType = CommonService.StringNum2int(getPara("subject-type"));
		List<XztClass> xztList = XztService.getXztList(subjectType);
		List<TktClass> tktList = TktService.getLTktList(subjectType);
		TktClass bTkt = TktService.getSingleBTkt(subjectType);
		
		List list = new ArrayList();
		list.add(xztList);
		list.add(tktList);
		list.add(bTkt);
		
		renderJson(list);
	}
	
}
