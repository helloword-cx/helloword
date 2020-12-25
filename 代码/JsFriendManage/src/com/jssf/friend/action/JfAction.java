package com.jssf.friend.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Comment;
import com.jssf.friend.model.Jf;
import com.jssf.friend.service.JfService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("jfAction")
@Scope("prototype")
public class JfAction extends ActionSupport implements ModelDriven<Jf>{
  private Jf jf;
  @Autowired
  private JfService JfService;
	@Override
	public Jf getModel() {
		if(jf==null) jf = new Jf();
		return jf;
	}
	
	public String jfList(){
		List<Jf> jfs = JfService.list();
		ActionContext.getContext().put("jfs", jfs);
		return SUCCESS;
	}

	public String addJf(){
		return SUCCESS;
	}
	  /* <!--   1.注册本网站获得积分5分
       2.会员没登陆一次获得积分1分
       3.用户自己发一条说说获得积分2分
       4用户上传一张照片获得积分2分
       5.用户给好友评论可获得积分1分
       6.用户添加一个好友获得积分1分
       7.用户给管理员的意见箱投信件可以获得积分2分 -->*/
	public String add(){
		JfService.add(jf);
		ActionContext.getContext().put("url", "/jf_jfList.do");
		return "redirect";
	}
	
	public String updateJf(){
		Jf j = JfService.load(jf);
		ActionContext.getContext().put("jf", j);
		return SUCCESS;
	}
	
	public String update(){
		JfService.update(jf);
		ActionContext.getContext().put("url", "/jf_jfList.do");
		return "redirect";
	}
	
	public String del(){
		JfService.del(jf);
		ActionContext.getContext().put("url", "/jf_jfList.do");
		return "redirect";
	}
}
