package com.jssf.friend.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Advice;
import com.jssf.friend.model.News;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.service.AdviceService;
import com.jssf.friend.service.NewsService;
import com.jssf.friend.service.SayMoodService;
import com.jssf.friend.utils.Pager;
import com.opensymphony.xwork2.ActionContext;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction {
	@Autowired
	private SayMoodService sayMoodService;
	@Autowired
	private AdviceService adviceService;
	@Autowired
    private NewsService newsService;
	//首页
	public String index() {
		
		//最受欢迎小主模块选择点赞最多的10张照片
		List<SayMood> ays = sayMoodService.zshy();
		ActionContext.getContext().put("ays",ays);
		//公告
		List<Advice> sds = adviceService.gonggao();
		ActionContext.getContext().put("sds",sds);
		//新闻
		Pager<News> list = newsService.list(null);
		ActionContext.getContext().put("pagers",list);
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
