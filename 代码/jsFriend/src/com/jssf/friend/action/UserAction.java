package com.jssf.friend.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jssf.friend.model.Advice;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.Fw;
import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Jf;
import com.jssf.friend.model.News;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.service.AdviceService;
import com.jssf.friend.service.FriendService;
import com.jssf.friend.service.FwService;
import com.jssf.friend.service.GradeService;
import com.jssf.friend.service.JfService;
import com.jssf.friend.service.MessageService;
import com.jssf.friend.service.NewsService;
import com.jssf.friend.service.SayMoodService;
import com.jssf.friend.service.UserService;
import com.jssf.friend.utils.Pager;
import com.jssf.friend.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	 @Autowired
	 private JfService JfService;
	@Autowired
	private UserService userService;
	@Autowired
	private SayMoodService sayMoodService;
	@Autowired
	private FriendService friendService;
	   @Autowired
		private MessageService messageService;
	   @Autowired
	   private GradeService gradeService;
	   @Autowired
	   private AdviceService adviceService;
	   @Autowired
	   private NewsService newsService;
	   @Autowired
	   private FwService fwService;
	private int otherId;
	
	private int yuefen;
	public int getYuefen() {
		return yuefen;
	}
	public void setYuefen(int yuefen) {
		this.yuefen = yuefen;
	}
	public int getJine() {
		return jine;
	}
	public void setJine(int jine) {
		this.jine = jine;
	}

	private int jine;
	
	public int getOtherId() {
		return otherId;
	}
	public void setOtherId(int otherId) {
		this.otherId = otherId;
	}

	private int groupId;
	private int friendId;

	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	private static final long serialVersionUID = 1L;

	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public SayMoodService getSayMoodService() {
		return sayMoodService;
	}
	public void setSayMoodService(SayMoodService sayMoodService) {
		this.sayMoodService = sayMoodService;
	}
	public FriendService getFriendService() {
		return friendService;
	}
	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private User user;
	//========================图片上传
    private File file;
    
    public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	//提交过来的file的名字
    private String fileFileName;
    
    //提交过来的file的MIME类型
    private String fileContentType;

	//========================图片上传
	@Override
	public User getModel() {
		if(user==null) user = new User();
		return user;
	}
	//注册
	public String register(){
		System.out.println(user.getAddress());
		user.setIsDelete(2);
		user.setCreateTime(new Date());
		user.setJifen(0);
		//注册时候需要加积分
		Jf j = JfService.findJfByType(1);//注册type=1
		User u = userService.add(user);
		u.setJifen(u.getJifen()+j.getFenshu());
		userService.update(u);
		return "login";
	}
	//登陆
	public String login(){
		
		User u =userService.load(user);
		if(u == null){
			return "register";
		}else{
		HttpSession session =	ServletActionContext.getRequest().getSession();
		session.setAttribute("userName", u.getUserName());
		session.setAttribute("userId", u.getId());
		session.setAttribute("tx", u.getTx());
		/**
		 * 下面判断这个用户有没有被警告
		 */
			int a = messageService.updatejinggao(u.getId());
			if(a>0){//没违规
				ActionContext.getContext().put("message",1);
			}else{
				ActionContext.getContext().put("message",2);
			}
			/**
			 * 登陆加积分
			 * 
			 */
			Jf j = JfService.findJfByType(2);//登陆type 2
			u.setJifen(u.getJifen()+j.getFenshu());
			userService.update(u);
			/*
			 * 首页的信息
			 */
			//最受欢迎小主模块选择点赞最多的10张照片
			List<SayMood> ays = sayMoodService.zshy();
			ActionContext.getContext().put("ays",ays);
			//公告
			List<Advice> sds = adviceService.gonggao();
			ActionContext.getContext().put("sds",sds);
			//新闻
			Pager<News> list = newsService.list(null);
			ActionContext.getContext().put("pagers",list);
			return "index";
		}
		
	}
	public String list() throws IllegalAccessException, InvocationTargetException {
		User tu = (User)ActionContext.getContext().getSession().get("loginUser");
		ActionContext.getContext().put("list", userService.listAllCanSendUser(1));
		return SUCCESS;
	}
	public String add() {
		userService.add(user);
		return "success";
	}
	
	/**
	 * 个人主页
	 * @return
	 */
	public String homePage() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//个人主页需要查询一下信息
			//1.相册信息 
			 //  1)url
			//查询访问巨鹿前十条
			
			List<Fw> fws = fwService.list(userId);
			ActionContext.getContext().put("fws", fws);
			Pager<SayMood> sayMoods = sayMoodService.loadPhoto(userId);
			ActionContext.getContext().put("sayMoods", sayMoods);
			//2.好友 查询这个用户所有的好友
			List<Friend> friends = friendService.loadFriends(userId);
			//对好友进行分组
			List<Friend> f1 = new ArrayList<Friend>();
			List<Friend> f2 = new ArrayList<Friend>();
			List<Friend> f3 = new ArrayList<Friend>();
			List<Friend> f4 = new ArrayList<Friend>();
			for(Friend fr : friends){
				if(fr.getUser().getId() == userId){
					fr.setName(fr.getFriendUser().getUserName());
				}
				if(fr.getFriendUser().getId() == userId){
					fr.setName(fr.getUser().getUserName());
				}
				//家人，同学，朋友，陌生人
				if(fr.getGroups() == 1){
					f1.add(fr);
				}
				if(fr.getGroups() == 2){
					f2.add(fr);
				}
				if(fr.getGroups() == 3){
					f3.add(fr);
				}
				if(fr.getGroups() == 4){
					f4.add(fr);
				}
			}
			/**
			 * 查询基本信息
			 */
			User uuu = userService.getUser(userId);
			/**
			 * 查询这个人等级
			 */
			List<Grade> list = gradeService.list();
			for(Grade g: list){
				if(uuu.getJifen()>=g.getStartMin() && uuu.getJifen() <=g.getEndMax()){
					uuu.setDengji(g.getName());
				}
			}
			ActionContext.getContext().put("xinxi", uuu);
			ActionContext.getContext().put("f1", f1);
			ActionContext.getContext().put("f2", f2);
			ActionContext.getContext().put("f3", f3);
			ActionContext.getContext().put("f4", f4);
			//3好友推荐 查询兴趣 年龄 地址一样的 
			List<User> friendtus = friendService.loadTuiJian(userId);
			User u = userService.loadUserById(userId);
			ActionContext.getContext().put("js", u);
			ActionContext.getContext().put("tjs", friendtus);
			return SUCCESS;
		}else{
			return "login";
		}
	}
	
	/**
	 * 会员充值
	 */
	public String chongzhi(){
		userService.updatechongzhi(user.getId(),yuefen,jine);
		 ActionContext.getContext().put("url", "/user_homePage.do");
	        return "redirect";
	}
	/**
	 * 别人的主页
	 * @return
	 */
	
	public String otherHomePage() {
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			//插入到访问记录表 如果当前id和传来的id不一样才插入
			if(userId!=otherId){
				
			}
			//个人主页需要查询一下信息
			//1.相册信息 
			 //  1)url

			/*
			 * otherId代表是从好友表的主键id
			 * 现在为了查询好友的id需要
			 */
			Friend frd =friendService.loadByid(otherId);
			int relId = 0;
			int a = 0;
			if(frd.getUser().getId() == userId){
				relId = frd.getFriendUser().getId();
				a = frd.getFriendUser().getId();
			}else{
				relId = frd.getUser().getId();
				
				a =  frd.getUser().getId();
			}
			fwService.insert(userId,a);
			Pager<SayMood> sayMoods = sayMoodService.loadPhoto(relId);
			ActionContext.getContext().put("sayMoods", sayMoods);
			
			
			//2.好友 查询这个用户所有的好友
			List<Friend> friends = friendService.loadFriends(relId);
			//对好友进行分组
			List<Friend> f1 = new ArrayList<Friend>();
			List<Friend> f2 = new ArrayList<Friend>();
			List<Friend> f3 = new ArrayList<Friend>();
			List<Friend> f4 = new ArrayList<Friend>();
			for(Friend fr : friends){
				if(fr.getUser().getId() == userId){
					fr.setName(fr.getFriendUser().getUserName());
				}
				if(fr.getFriendUser().getId() == userId){
					fr.setName(fr.getUser().getUserName());
				}
				//家人，同学，朋友，陌生人
				if(fr.getGroups() == 1){
					
					f1.add(fr);
				}
				if(fr.getGroups() == 2){
					f2.add(fr);
				}
				if(fr.getGroups() == 3){
					f3.add(fr);
				}
				if(fr.getGroups() == 4){
					f4.add(fr);
				}
			}
			ActionContext.getContext().put("f1", f1);
			ActionContext.getContext().put("f2", f2);
			ActionContext.getContext().put("f3", f3);
			ActionContext.getContext().put("f4", f4);
			//3好友推荐 查询兴趣 年龄 地址一样的 
		//	List<User> friendtus = friendService.loadTuiJian(otherId);
			User u = userService.loadUserById(relId);
			ActionContext.getContext().put("js", u);
			ActionContext.getContext().put("tjs", null);
			return "otherHomePage";
		}else{
			return "login";
		}
	}
	/**
	 * 图片上传
	 * @return
	 * @throws Exception
	 */
	public String fileUpload() throws Exception{
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			
			// String root = ServletActionContext.getServletContext().getRealPath("/")+"upload";
			    String root  = "D:/my/upload";
		        InputStream is = new FileInputStream(file);
		        fileFileName = UUIDUtils.create()+fileFileName;
		        OutputStream os = new FileOutputStream(new File(root, fileFileName));
		        System.out.println("fileFileName: " + fileFileName);
		        System.out.println("file: " + file.getName());
		        System.out.println("file: " + file.getPath());
		        byte[] buffer = new byte[500];
		        int length = 0;
		        
		        while(-1 != (length = is.read(buffer, 0, buffer.length)))
		        {
		            os.write(buffer);
		        }
		        os.close();
		        is.close();
		        //接下来存到说说表中
		        SayMood sayMood = new SayMood();
		        sayMood.setContent("\\upload\\"+fileFileName);
		        sayMood.setCreateTime(new Date());
		        sayMood.setDzs(0);
		        sayMood.setIsDelete(2);
		        sayMood.setType(2);
		        User u = userService.getUser(userId);
		        sayMood.setSayUser(u);
		        sayMoodService.save(sayMood);
		        /**
		         * 积分规则还没有做。上传图片需要加积分
		         */
		        Jf j = JfService.findJfByType(4);//照片 type=4
				u.setJifen(u.getJifen()+j.getFenshu());
				userService.update(u);
		        //上传完毕，跳转列表action
		        ActionContext.getContext().put("url", "/user_homePage.do");
		        return "redirect";
		}else{
			return "login";
		}
	}
	/**
	 * 上传
	 * @return
	 * @throws Exception
	 */
	public String fileUpload2() throws Exception{
		HttpSession session =	ServletActionContext.getRequest().getSession();
		if(session.getAttribute("userId") != null){
			int userId = Integer.parseInt( session.getAttribute("userId").toString());
			
			// String root = ServletActionContext.getServletContext().getRealPath("/")+"upload";
			    String root  = "D:/my/upload";
		        InputStream is = new FileInputStream(file);
		        fileFileName = UUIDUtils.create()+fileFileName;
		        OutputStream os = new FileOutputStream(new File(root, fileFileName));
		        System.out.println("fileFileName: " + fileFileName);
		        System.out.println("file: " + file.getName());
		        System.out.println("file: " + file.getPath());
		        byte[] buffer = new byte[500];
		        int length = 0;
		        
		        while(-1 != (length = is.read(buffer, 0, buffer.length)))
		        {
		            os.write(buffer);
		        }
		        os.close();
		        is.close();
		        //接下来存到说说表中
		        User u = userService.getUser(userId);
		        u.setTx("\\upload\\"+fileFileName);
		        session.setAttribute("tx", u.getTx());
				userService.update(u);
		        //上传完毕，跳转列表action
		        ActionContext.getContext().put("url", "/user_homePage.do");
		        return "redirect";
		}else{
			return "login";
		}
	}
	
       //================================================
		//以下是好友管理模块
		//================================================
		
	/**
	 * 查询好友
	 * @return
	 */
		
		public String findFriend(){
			HttpSession session =	ServletActionContext.getRequest().getSession();
			if(session.getAttribute("userId") != null){
				int myId = Integer.parseInt( session.getAttribute("userId").toString());
				List<User> users= userService.findFriend(user.getUserName(),myId);
			 ActionContext.getContext().put("findName", user.getUserName());
			 ActionContext.getContext().put("findFriends", users);
			  ActionContext.getContext().put("url", "user_homePage");
			}
			return "chain";
		}
		
		/**
		 * 添加
		 * @return
		 */
		public String addFriend(){
			    //需要两个id 一个是自己的，一个是传来的
			HttpSession session =	ServletActionContext.getRequest().getSession();
			if(session.getAttribute("userId") != null){
				
				int myId = Integer.parseInt( session.getAttribute("userId").toString());
			//	HttpServletRequest request = ServletActionContext.getRequest();
			//int groupId= Integer.parseInt(request.getParameter("groupId").toString());
				/**
				 * 加好友积分
				 */
				 User u = userService.getUser(myId);
				 Jf j = JfService.findJfByType(6);//加好友 type=6
				 		u.setJifen(u.getJifen()+j.getFenshu());
				 		userService.update(u);
				 friendService.addFriend(myId,user.getId(),groupId);
			}
			
			 ActionContext.getContext().put("url", "user_homePage");
				return "chain";
		}
		
		/**
		 * 删除好友
		 * @return
		 */
		public String deleteFriend(){
			friendService.deleteFriend(friendId);
			 ActionContext.getContext().put("url", "/user_homePage.do");
		        return "redirect";
		}
		
		
}  
