package com.jssf.friend.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Jf;
import com.jssf.friend.service.GradeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller("gradeAction")
@Scope("prototype")
public class GradeAction extends ActionSupport implements ModelDriven<Grade> {
   private Grade grade;
   @Autowired
   private GradeService gradeService;
	@Override
	public Grade getModel() {
		if(grade==null) grade = new Grade();
		return grade;
	}
	public String gradeList(){
		List<Grade> gads = gradeService.list();
		ActionContext.getContext().put("gads", gads);
		return SUCCESS;
	}

	public String addgrade(){
		return SUCCESS;
	}
	public String add(){
		gradeService.add(grade);
		ActionContext.getContext().put("url", "/grade_gradeList.do");
		return "redirect";
	}
	
	/*普通会员(1-500积分)
    黄金会员(501-1200积分)
    白金会员(1201-1800积分)
    钻石会员(1800积分以上)*/
	public String updategrade(){
		Grade g = gradeService.load(grade);
		ActionContext.getContext().put("grade", g);
		return SUCCESS;
	}
	
	public String update(){
		gradeService.update(grade);
		ActionContext.getContext().put("url", "/grade_gradeList.do");
		return "redirect";
	}
	
	public String del(){
		gradeService.del(grade);
		ActionContext.getContext().put("url", "/grade_gradeList.do");
		return "redirect";
	}

}
