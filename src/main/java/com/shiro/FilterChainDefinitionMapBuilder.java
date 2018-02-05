package com.shiro;

import java.util.LinkedHashMap;

public class FilterChainDefinitionMapBuilder {



	/*1.anon:没有参数，表示可以匿名使用
	2.authc:表示需要认证(登录)才能使用，没有参数
	3.roles:/admins/user/**=roles[admin],参数可以写多个，多个时必须加上引号，并且参数之间用逗号分割，当有多个参数时，
 	例如admins/user/**=roles["admin,guest"],每个参数通过才算通过，相当于hasAllRoles()方法。
 	......
 	4.anon，authcBasic，auchc，user是认证过滤器，
 	5.perms，roles，ssl，rest，port是授权过滤器
 	*/
	public LinkedHashMap<String, String> buildFilterChainDefinitionMap(){
		LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
		
		map.put("/index.jsp", "anon");
		map.put("/**", "anon");
	/*	map.put("/shiro/logout", "logout");
		map.put("/user.jsp", "authc,roles[user]");
		map.put("/admin.jsp", "authc,roles[admin]");
		map.put("/list.jsp", "user"); //remeber me
		map.put("/**", "authc");*/
		
		return map;
	}
	
}
