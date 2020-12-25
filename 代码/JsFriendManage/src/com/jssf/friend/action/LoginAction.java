package com.jssf.friend.action;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction {
	
	//首页
	public String index() {
		return "success";
	}
	//登陆页面
	public String login() {
		return "success";
	}
   //注册页面
	public String register() {
		return "success";
	}
	   //退出
		public String tuichu() {
			ActionContext ac = ActionContext.getContext();
			Map session = ac.getSession();
			session.remove("userName");
			session.remove("userId");
			return "login";
		}
}
