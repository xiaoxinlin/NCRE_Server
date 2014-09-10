package com.ncre.utils;



import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.ncre.controller.AdminController;
import com.ncre.controller.AnnouncementController;
import com.ncre.controller.FileController;
import com.ncre.controller.ItemsController;
import com.ncre.controller.QuestionController;
import com.ncre.controller.TktController;
import com.ncre.controller.XztController;
import com.ncre.interceptor.GlobalInterceptor;
import com.ncre.model.AdminClass;
import com.ncre.model.AnnouncementClass;
import com.ncre.model.FileClass;
import com.ncre.model.QuestionClass;
import com.ncre.model.TktClass;
import com.ncre.model.XztClass;


public class DemoConfig extends JFinalConfig{

	
	@Override
	public void afterJFinalStart() {
		JFinal.me().getServletContext().setAttribute("subjects", Subjects.getInstance().subjectsTable);
		//填空题类型
		List<String> tktType = new ArrayList<String>();
		tktType.add("填空题");
		tktType.add("大题");
		JFinal.me().getServletContext().setAttribute("tktType", tktType);
	}

	public void configConstant(Constants arg0) {
		loadPropertyFile("myconfig.txt");
		
		Subjects subjects = Subjects.getInstance();
		
		
		arg0.setDevMode(true);
		//arg0.setViewType(ViewType.JSP);
	}

	public void configHandler(Handlers arg0) {
		
	}

	public void configInterceptor(Interceptors arg0) {
		
		arg0.add(new GlobalInterceptor());
		arg0.add(new SessionInViewInterceptor(true));
	}

	@Override
	public void configPlugin(Plugins arg0) {
		//配置数据库
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl2"), getProperty("user"), getProperty("password"));
		arg0.add(c3p0Plugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		arp.setShowSql(true);
		arg0.add(arp);
		
		//增加表和对象之间的映射，第一个参数为所对应的表名，第二个参数是表所对应的Class类
		arp.addMapping("announcement", AnnouncementClass.class);
		arp.addMapping("admin", AdminClass.class);
		arp.addMapping("file", FileClass.class);
		arp.addMapping("question", QuestionClass.class);
		arp.addMapping("tkt", TktClass.class);
		arp.addMapping("xzt", XztClass.class);
		
		//配置二级缓存
		/**
		 * ehcache.xml文件必须放在classpath路径下，不然系统会因为找不到文件使用默认的ehcache配置
		 */
		URL url = getClass().getResource("/ehcache.xml");  
		arg0.add(new EhCachePlugin(url));
	}

	@Override
	public void configRoute(Routes arg0) {
		arg0.add("/items", ItemsController.class);
		arg0.add("/tkt",TktController.class);
		arg0.add("/xzt",XztController.class);
		arg0.add("/admin",AdminController.class);
		arg0.add("/question",QuestionController.class);
		arg0.add("/file",FileController.class);
		arg0.add("/announcement",AnnouncementController.class);
	}

}
