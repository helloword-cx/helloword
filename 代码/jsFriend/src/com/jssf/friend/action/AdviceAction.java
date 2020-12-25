package com.jssf.friend.action;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.jssf.friend.model.Advice;
import com.jssf.friend.model.Jf;
import com.jssf.friend.model.User;
import com.jssf.friend.service.AdviceService;
import com.jssf.friend.service.FriendService;
import com.jssf.friend.service.JfService;
import com.jssf.friend.service.UserService;
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
@Autowired
private UserService userService;
@Autowired
private FriendService friendService;
 @Autowired
 private JfService JfService;
	@Override
	public Advice getModel() {
		if(advice==null) advice = new Advice();
		return advice;
	}
	
	/**
	 * 跳转到意见箱
	 * @return
	 */
	public String advice(){
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//查询所有意见
			Pager<Advice> pagers=adviceService.findAll();
			ActionContext.getContext().put("pagers", pagers);
			return SUCCESS;
		}else{
			return "login";
		}
	}

	/**
	 * 发表意见
	 */
	public String yijian(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			adviceService.saveAdvice(userId,advice);
			ActionContext.getContext().put("url", "/advice_advice.do");
			/**
			 * 积分
			 */
			   User u = userService.getUser(userId);
		    	Jf j = JfService.findJfByType(7);//投诉  type=7
					u.setJifen(u.getJifen()+j.getFenshu());
					userService.update(u);

			return "redirect";
		}else{
			return "login";
		}
	}
}
