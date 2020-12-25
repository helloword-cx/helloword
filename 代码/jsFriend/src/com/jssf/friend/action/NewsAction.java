package com.jssf.friend.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Grade;
import com.jssf.friend.model.News;
import com.jssf.friend.service.NewsService;
import com.jssf.friend.utils.Pager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller("newsAction")
@Scope("prototype")
public class NewsAction extends ActionSupport implements ModelDriven<News>{
	private static final long serialVersionUID = 1L;
    private News news;
    private String titles;

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	@Autowired
    private NewsService newsService;
	@Override
	public News getModel() {
		if(news==null) news = new News();
		return news;
	}

	public String newList(){
		Pager<News> pagers = newsService.list(titles);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("titles", titles);
		return SUCCESS;
	}

	public String addnew(){
		return SUCCESS;
	}
	public String add(){
		newsService.add(news);
		ActionContext.getContext().put("url", "/news_newList.do");
		return "redirect";
	}
	
	public String updatenew(){
		News n = newsService.load(news);
		ActionContext.getContext().put("news", n);
		return SUCCESS;
	}
	
	public String update(){
		newsService.update(news);
		ActionContext.getContext().put("url", "/news_newList.do");
		return "redirect";
	}
	
	public String del(){
		newsService.del(news);
		ActionContext.getContext().put("url", "/news_newList.do");
		return "redirect";
	}
	
	public String info(){
		News n = newsService.load(news);
		ActionContext.getContext().put("news", n);
		return "success";
	}
}
