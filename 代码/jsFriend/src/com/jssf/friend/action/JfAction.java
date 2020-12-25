package com.jssf.friend.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Comment;
import com.jssf.friend.model.Jf;
import com.jssf.friend.service.JfService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("jsAction")
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
		return null;
	}

	
	public String findJfByType(){
		Jf jf =	JfService.findJfByType(1);
		return null;
	}
}
