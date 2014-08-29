package com.ncre.interceptor;

import com.jfinal.aop.*;
import com.jfinal.core.ActionInvocation;
public class GlobalInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {

		ai.invoke();
		System.out.println("after");
		//实现了跨域访问数据
		ai.getController().getResponse().setHeader("Access-Control-Allow-Origin", "http://localhost:8000");
		ai.getController().getResponse().setHeader("Access-Control-Allow-Headers", "Origin, Accept, Content-Type,x-requested-with");
	}

}
