package com.ncre.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.ncre.model.AdminClass;
public class GlobalInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		if( ai.getController().getSessionAttr("admin") == null ){
			
			ai.getController().redirect("/login.jsp");
		}else{
			if( "/admin".equals( ai.getControllerKey() ) ){
				AdminClass adminClass = ai.getController().getSessionAttr("admin");
				
				if("sysConfig".equals(ai.getMethodName()) || "index2config".equals(ai.getMethodName()) || "importTest".equals(ai.getMethodName())){
					ai.invoke();
				}else if( 1 != adminClass.getInt("authority") ){
					ai.getController().redirect("/announcement/anywhere2index");
					
				}else{
					ai.invoke();
					//实现了跨域访问数据
					ai.getController().getResponse().setHeader("Access-Control-Allow-Origin", "http://localhost:8000");
					ai.getController().getResponse().setHeader("Access-Control-Allow-Headers", "Origin, Accept, Content-Type,x-requested-with");
				}
			}else{
				ai.invoke();
				//实现了跨域访问数据
				ai.getController().getResponse().setHeader("Access-Control-Allow-Origin", "http://localhost:8000");
				ai.getController().getResponse().setHeader("Access-Control-Allow-Headers", "Origin, Accept, Content-Type,x-requested-with");
			}
			
			
			
		}
		
	}

}
