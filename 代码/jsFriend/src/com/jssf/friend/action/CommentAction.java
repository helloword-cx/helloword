package com.jssf.friend.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Comment;
import com.jssf.friend.model.Jf;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.service.CommentService;
import com.jssf.friend.service.JfService;
import com.jssf.friend.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("commentAction")
@Scope("prototype")
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
private Comment comment;
@Autowired
private JfService JfService;
@Autowired
private UserService userService;
private int sayMoodId;
private int otherId;

public int getOtherId() {
	return otherId;
}

public void setOtherId(int otherId) {
	this.otherId = otherId;
}

public int getSayMoodId() {
	return sayMoodId;
}

public void setSayMoodId(int sayMoodId) {
	this.sayMoodId = sayMoodId;
}

@Autowired
private CommentService CommentService;
	@Override
	public Comment getModel() {
		if(comment==null) comment = new Comment();
		return comment;
	}
	
	/**
	 * 评论
	 * @return
	 */
	public String comment() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			CommentService.save(comment,userId,sayMoodId);
			/**
			 * 积分
			 */
			 User u = userService.getUser(userId);
	         Jf j = JfService.findJfByType(5);//评论 type=5
			u.setJifen(u.getJifen()+j.getFenshu());
			userService.update(u);
		}else{
			return "login";
		}
		
		ActionContext.getContext().put("url", "/sayMood_photoDetail.do?id="+sayMoodId+"&otherId="+otherId);
		return "redirect";
	}
	
	//评论说说 文字
	public String huifutext() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			CommentService.save(comment,userId,sayMoodId);
			/**
			 * 积分
			 */
			 User u = userService.getUser(userId);
	         Jf j = JfService.findJfByType(5);//评论 type=5
			u.setJifen(u.getJifen()+j.getFenshu());
			userService.update(u);
		}else{
			return "login";
		}
		ActionContext.getContext().put("url", "/sayMood_shuoshuoList.do");
		return "redirect";
	}
	/**
	 * 回复
	 * @return
	 */
	public String huifu() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			/**
			 * 积分
			 */
			 User u = userService.getUser(userId);
	         Jf j = JfService.findJfByType(5);//评论 type=5
			u.setJifen(u.getJifen()+j.getFenshu());
			userService.update(u);
			CommentService.savehuifu(comment,userId);
		}else{
			return "login";
		}
		ActionContext.getContext().put("url", "/sayMood_photoDetail.do?id="+sayMoodId+"&otherId="+otherId);
		return "redirect";
	}

	//说说文字回复
	public String huifuhft() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			/**
			 * 积分
			 */
			 User u = userService.getUser(userId);
	         Jf j = JfService.findJfByType(5);//评论 type=5
			u.setJifen(u.getJifen()+j.getFenshu());
			userService.update(u);
			CommentService.savehuifu(comment,userId);
		}else{
			return "login";
		}
		ActionContext.getContext().put("url", "/sayMood_shuoshuoList.do");
		return "redirect";
	}
}
