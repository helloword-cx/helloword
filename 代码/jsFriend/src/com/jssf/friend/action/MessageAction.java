package com.jssf.friend.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Message;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.service.MessageService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("messageAction")
@Scope("prototype")
public class MessageAction extends ActionSupport implements ModelDriven<Message> {

	private Message message;
	
	@Autowired
	private MessageService messageService;
	@Override
	public Message getModel() {
		if(message==null) message = new Message();
		return message;
	}
	
	/**
	 * 页面一开始加载的时候，就进行聊天记录查询
	 * @throws IOException 
	 */
	public void findMessageJIluList() throws IOException{
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = null;
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			List<Message> messages = messageService.findMessageJIluList(userId);
			out = resp.getWriter();
			 System.out.println(JSONArray.fromObject(messages).toString());
			 out.write(JSONArray.fromObject(messages).toString());
	    }
	}
	
	/**
	 * 发送消息
	 * @throws IOException
	 */
	public void sendMessage() throws IOException{
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = null;
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			JSONObject json  = new JSONObject();
			int re = messageService.saveMessage(userId,message);
			if(re<0){//失败
				json.put("result", 2);
			}else{
				json.put("result", 1);
			}
			
			out = resp.getWriter();
			/* System.out.println(JSONArray.fromObject(messages).toString());*/
			 out.write(json.toString());
	    }
		
	}
}
