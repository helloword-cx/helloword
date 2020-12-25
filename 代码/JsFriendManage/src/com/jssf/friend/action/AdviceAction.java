package com.jssf.friend.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Advice;
import com.jssf.friend.model.Comment;
import com.jssf.friend.service.AdviceService;
import com.jssf.friend.utils.Pager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("adviceAction")
@Scope("prototype")
public class AdviceAction extends ActionSupport implements ModelDriven<Advice>{
private Advice advice;
@Autowired
private AdviceService adviceService;
	@Override
	public Advice getModel() {
		if(advice==null) advice = new Advice();
		return advice;
	}
	
	/**
	 * 璺宠浆鍒版剰瑙佺
	 * @return
	 */
	public String advice(){
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//鏌ヨ鎵�湁鎰忚
			Pager<Advice> pagers=adviceService.findAll();
			ActionContext.getContext().put("pagers", pagers);
			return SUCCESS;
		}else{
			return "login";
		}
	}

	/**
	 * 鍙戣〃鎰忚
	 */
	public String yijian(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			adviceService.saveAdvice(userId,advice);
			ActionContext.getContext().put("url", "/advice_advice.do");
			return "redirect";
		}else{
			return "login";
		}
	}
	
	public String adviceList(){
		Pager<Advice> pagers=adviceService.findAll();
		ActionContext.getContext().put("pagers", pagers);
		return SUCCESS;
	}
	
	//设置取消是否在首页显示
	public String fzsy(){
		adviceService.updatefzsy(advice);
		ActionContext.getContext().put("url", "/advice_adviceList.do");
		return "redirect";
	}
	public String del(){
		adviceService.del(advice);
		ActionContext.getContext().put("url", "/advice_adviceList.do");
		return "redirect";
	}
}
