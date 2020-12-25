package com.jssf.friend.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.jssf.friend.dto.SayMoodTextDto;
import com.jssf.friend.model.Comment;
import com.jssf.friend.model.Jf;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.service.CommentService;
import com.jssf.friend.service.FriendService;
import com.jssf.friend.service.JfService;
import com.jssf.friend.service.SayMoodService;
import com.jssf.friend.service.UserService;
import com.jssf.friend.utils.Pager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("sayMoodAction")
@Scope("prototype")
public class SayMoodAction extends ActionSupport implements ModelDriven<SayMood>{
	@Autowired
	private SayMoodService sayMoodService;
	@Autowired
	private  CommentService commentService;
	@Autowired
	private UserService userService;
	@Autowired
	private FriendService friendService;
	 @Autowired
	 private JfService JfService;
	private SayMood sayMood;
	private int otherId;
	
	public int getOtherId() {
		return otherId;
	}

	public void setOtherId(int otherId) {
		this.otherId = otherId;
	}

	private static List<Comment> list = new ArrayList<Comment>();
	
	/**
	 * 根据照片id查询出来，这个照片的详细信息，以及照片的评论信息
	 * @return
	 */
	public String photoDetail() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//取出前5张照片
			if(otherId != 0){
				if(otherId != userId){
					userId = otherId;
				}
			}
			List<SayMood> sayMoods = sayMoodService.loadPhotoBefore(userId);
			User u = userService.loadUserById(otherId);
			ActionContext.getContext().put("js", u);
			ActionContext.getContext().put("sayMoods", sayMoods);
		}
		//照片信息
		SayMood say = sayMoodService.loadPhotoById(sayMood.getId());
		/*private int id;
		private String content;//内容
		private Comment fatherComment;//上一级评论
		private User sayUser;//发表人
		private User comUser;//评论人
		private Date createTime;
		private SayMood SayMood;//说说或者图片
*/		//查询评论信息
		//首先查询以一级评论
		List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
		Pager<Comment> pagers = commentService.findBySayId(sayMood.getId());
		if(pagers != null && pagers.getDatas()!=null && pagers.getDatas().size()>0){
			List<Comment> datas = pagers.getDatas();
			for(Comment com : datas){
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("com", com);
				map.put("datas", digui(finByFather(com)));
				list = new ArrayList<Comment>();
				maps.add(map);
			}
		}
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("say", say);
		ActionContext.getContext().put("maps", maps);
		
		System.out.println(maps.toString());
		return "success";
	}

/**
 * 点赞
 * @return
 */
	 public String dianzan(){
		 HttpSession session =	ServletActionContext.getRequest().getSession();
			if(session.getAttribute("userId") != null){
				sayMoodService.update(sayMood.getId());
				
			}else{
				return "login";
			}
			ActionContext.getContext().put("url", "/sayMood_photoDetail.do?id="+sayMood.getId()+"&otherId="+otherId);
			return "redirect";
	 }

	 /**
	  * 删除说说/相册
	  * @return
	  */
    public String delete(){
    	 HttpSession session =	ServletActionContext.getRequest().getSession();
			if(session.getAttribute("userId") != null){
				sayMoodService.delete(sayMood.getId());
				
			}else{
				return "login";
			}
			ActionContext.getContext().put("url", "/user_homePage.do");
			return "redirect";
    }







	private List<Comment> digui(List<Comment> datas) {
		
		if(datas != null && datas.size()>0){
			for(Comment com : datas){
				//存储每一个父节点对应 的子节点集合
					//现在根据每一个一级评论查询下一个子节点
				    list.add(com);
					List<Comment> coms = finByFather(com);
					//list.addAll(coms);
					if(coms!=null && coms.size()>0){
						digui(coms);
					}
			}
			//派讯
			Collections.sort(list, new Comparator<Comment>() {
				@Override
				public int compare(Comment o1, Comment o2) {
				return o1.getCreateTime().compareTo(o2.getCreateTime());
				}
				});
			return list;
			
		}
		
		return new ArrayList<Comment>();
	}
	
	private List<Comment> finByFather(Comment com) {
			return commentService.listNextComByFatherId(com.getId());
	}
	
	@Override
	public SayMood getModel() {
		if(sayMood==null) sayMood = new SayMood();
		return sayMood;
	}

	//======================================================================
	//一下是说说模块。文字说说
	/**
	 * 进入说说页面，并查询说说内容
	 * @return
	 */
	public String shuoshuoList(){
		
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//查询，我自己和好友们的说说
			Pager<SayMood> asys = sayMoodService.shuoshioList(userId);
			
			//下面对每一个说说，递归查询出所有的评论和回复
			List<SayMoodTextDto> sts = new ArrayList<SayMoodTextDto>();
			if(asys != null){
				List<SayMood> diSays = asys.getDatas();
				for(SayMood s :diSays ){
					SayMoodTextDto st = new SayMoodTextDto();
					st.setSayMood(s);
					
					List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
					//查询出这个说说所有的评论一级评论
					List<Comment> lists = commentService.findBySayIdList(s.getId());
					Collections.sort(lists, new Comparator<Comment>() {
						@Override
						public int compare(Comment o1, Comment o2) {
						return o1.getCreateTime().compareTo(o2.getCreateTime());
						}
						});
					//查询出这条评论的所有回复
					for(Comment com : lists){
						Map<String,Object> map = new HashMap<String, Object>();
						map.put("com", com);
						map.put("datas", digui(finByFather(com)));
						list = new ArrayList<Comment>();
						maps.add(map);
					}
					st.setPingluHuifu(maps);
					sts.add(st);
				}
			}
			ActionContext.getContext().put("pagers", asys);
			ActionContext.getContext().put("sts", sts);
			return SUCCESS;
		}else{
			return "login";
		}
	}
	
	/**
	 * 发表说说
	 */
	public String commentShuo(){
		//接下来存到说说表中
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			 SayMood say = new SayMood();
			 say.setContent(sayMood.getContent());
			 say.setCreateTime(new Date());
			 say.setDzs(0);
			 say.setIsDelete(2);
			 say.setType(1);
		        User u = userService.getUser(userId);
		        say.setSayUser(u);
		        sayMoodService.save(say);
		        /**
		         * 积分
		         */
		        Jf j = JfService.findJfByType(3);//说说 tye 3
				u.setJifen(u.getJifen()+j.getFenshu());
				userService.update(u);
		        ActionContext.getContext().put("url", "/sayMood_shuoshuoList.do");
		        return "redirect";
		}else{
			return "login";
		}
		
	}
	
	
	//删除说说
	
	 public String delTxt(){
   	 HttpSession session =	ServletActionContext.getRequest().getSession();
			if(session.getAttribute("userId") != null){
				sayMoodService.delete(sayMood.getId());
			}else{
				return "login";
			}
			 ActionContext.getContext().put("url", "/sayMood_shuoshuoList.do");
		        return "redirect";
   }
}
