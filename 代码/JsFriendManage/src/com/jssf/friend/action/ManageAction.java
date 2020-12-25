package com.jssf.friend.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Pie;
import com.jssf.friend.model.Advice;
import com.jssf.friend.model.Comment;
import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Manage;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.service.FriendService;
import com.jssf.friend.service.GradeService;
import com.jssf.friend.service.ManageService;
import com.jssf.friend.service.MessageService;
import com.jssf.friend.service.SayMoodService;
import com.jssf.friend.service.UserService;
import com.jssf.friend.utils.Pager;
import com.jssf.friend.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
@Controller("manageAction")
@Scope("prototype")
public class ManageAction extends ActionSupport implements ModelDriven<Manage>{
   private Manage manage;
   @Autowired
	private UserService userService;
   @Autowired
   private GradeService gradeService;
	@Autowired
	private SayMoodService sayMoodService;
	@Autowired
	private FriendService friendService;
    @Autowired
   private ManageService manageService;
    @Autowired
	private MessageService messageService;
    private int userId;
    private String userName;
    private int sayId;
    
    
    public int getSayId() {
		return sayId;
	}
	public void setSayId(int sayId) {
		this.sayId = sayId;
	}

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
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public Manage getModel() {
		if(manage==null) manage = new Manage();
		return manage;
	}
   
	/**
	 * 登陆以后进入首页
	 * @return
	 */
	public String index(){
		Manage ma =	manageService.login(manage);
		if(ma == null){
			return "login";
		}
		HttpSession session =	ServletActionContext.getRequest().getSession();
		session.setAttribute("userName", ma.getName());
		session.setAttribute("userId", ma.getId());
	    return SUCCESS;
	}
	
	/**
	 * 获取用户列表
	 * @return
	 */
	public String userList(){
	Pager<User>	pagers = userService.listAll(userName);
	//这里需要对等级进行遍历
	List<Grade> list = gradeService.list();
	if(pagers != null && pagers.getDatas() != null && pagers.getDatas().size()>0){
		for(User u : pagers.getDatas()){
			//对这里的人 进行遍历
			for(Grade g: list){
				if(u.getJifen()>=g.getStartMin() && u.getJifen() <=g.getEndMax()){
					u.setDengji(g.getName());
				}
			}
		}
	}
	ActionContext.getContext().put("pagers", pagers);
	ActionContext.getContext().put("userName1", userName);
	return SUCCESS;
	}
	
	/**
	 * 根据用户id查询所有图片
	 * @return
	 */
	public String userPhotos(){
		Pager<SayMood>	pagers = sayMoodService.findAllphotosById(userId);
		ActionContext.getContext().put("pagers", pagers);
		return SUCCESS;
	}
	
	/**
	 * 删除照片
	 * @return
	 */
	public String delsay(){
		 sayMoodService.del(sayId);
		ActionContext.getContext().put("url", "/manage_userPhotos.do");
		return "redirect";
	}
	//删除用户
	public String delUse(){
		userService.delUse(userId);
		ActionContext.getContext().put("url", "/manage_userList.do");
		return "redirect";
	}
	
	//经警告用户
	
	public String jinggao(){
		messageService.updatejinggao(userId);
		ActionContext.getContext().put("url", "/manage_userList.do");
		return "redirect";
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
			
			 String root = ServletActionContext.getServletContext().getRealPath("/")+"upload";
			//String root = ServletActionContext.getServletContext().getRealPath("upload"); 
			//String root = ServletActionContext.getRequest().getContextPath()+"/"+"upload";
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
		     /*   SayMood sayMood = new SayMood();
		        sayMood.setContent("\\upload\\"+fileFileName);
		        sayMood.setCreateTime(new Date());
		        sayMood.setDzs(0);
		        sayMood.setIsDelete(2);
		        sayMood.setType(2);
		        User u = userService.getUser(userId);
		        sayMood.setSayUser(u);
		        sayMoodService.save(sayMood);*/
		        /**
		         * 积分规则还没有做。上传图片需要加积分
		         */
		        //上传完毕，跳转列表action
		        ActionContext.getContext().put("url", "/user_homePage.do");
		        return "redirect";
		}else{
			return "login";
		}
	}
	
	public String report(){
		return SUCCESS;
	}
	//下面进行报表
	/**
	 * 查询上个月和这个月 账号注册
	 * @throws IOException 
	 */
	public void reportUser() throws IOException{
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = null;
		//首先查询本月和上个月用户总人数
		List<User>	users = userService.findSYuser();
		List<User>	users2 = userService.findBYuser();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("NAME", getsy());
		if(users != null && users.size()>0){
			map1.put("TOTAL", users.size());
		}else{
			map1.put("TOTAL", 0);
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("NAME", getBy());
		if(users2 != null && users2.size()>0){
			map2.put("TOTAL", users2.size());
		}else{
			map2.put("TOTAL", 0);
		}
		list.add(map1);
		list.add(map2);
		
		 //创建Option
	    GsonOption option = new GsonOption();
	    option.title("注册人数").tooltip(Trigger.axis).legend("数量（人）");
	    //横轴为值轴
	    option.xAxis(new ValueAxis().boundaryGap(0d, 0.01));
	    //创建类目轴
	    CategoryAxis category = new CategoryAxis();
	    //柱状数据
	    Bar bar = new Bar("月份");
	    //饼图数据
	    Pie pie = new Pie("月份");
	    //循环数据
	    for (Map<String, Object> objectMap : list) {
	        //设置类目
	        category.data(objectMap.get("NAME"));
	        //类目对应的柱状图
	        bar.data(objectMap.get("TOTAL"));
	        //饼图数据
	        pie.data(new PieData(objectMap.get("NAME").toString(), objectMap.get("TOTAL")));
	    }
	    //设置类目轴
	    option.yAxis(category);
	    //饼图的圆心和半径
	    pie.center(900,380).radius(100);
	    //设置数据
	    option.series(bar, pie);
	    //由于药品名字过长，图表距离左侧距离设置180，关于grid可以看ECharts的官方文档
	    option.grid().x(180);
	    //返回Option
	    out = resp.getWriter();
		 out.write(option.toString());
	}
	
	
	  public String getBy(){
		  Calendar c = Calendar.getInstance();
		   c.add(Calendar.MONTH, -0);
		  SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM");
		  String time = format.format(c.getTime());
		  System.out.println(time);
		  return time;
	}
	  
	  public String getsy(){
		  Calendar c = Calendar.getInstance();
		   c.add(Calendar.MONTH, -1);
		  SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM");
		  String time = format.format(c.getTime());
		  System.out.println(time);
		  return time;
	}
	  
	  
	  public void reportSay() throws IOException{
		  HttpServletResponse resp = ServletActionContext.getResponse();
			resp.setContentType("application/json;charset=UTF-8");
			PrintWriter out = null;
			//首先查询本月和上个月用户总人数
			List<SayMood>	users = sayMoodService.findSYusay();
			List<SayMood>	users2 = sayMoodService.findBYsay();
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("NAME", getsy());
			if(users != null && users.size()>0){
				map1.put("TOTAL", users.size());
			}else{
				map1.put("TOTAL", 0);
			}
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("NAME", getBy());
			if(users2 != null && users2.size()>0){
				map2.put("TOTAL", users2.size());
			}else{
				map2.put("TOTAL", 0);
			}
			list.add(map1);
			list.add(map2);
			
			 //创建Option
		    GsonOption option = new GsonOption();
		    option.title("发表图片数").tooltip(Trigger.axis).legend("数量（人）");
		    //横轴为值轴
		    option.xAxis(new ValueAxis().boundaryGap(0d, 0.01));
		    //创建类目轴
		    CategoryAxis category = new CategoryAxis();
		    //柱状数据
		    Bar bar = new Bar("月份");
		    //饼图数据
		    Pie pie = new Pie("月份");
		    //循环数据
		    for (Map<String, Object> objectMap : list) {
		        //设置类目
		        category.data(objectMap.get("NAME"));
		        //类目对应的柱状图
		        bar.data(objectMap.get("TOTAL"));
		        //饼图数据
		        pie.data(new PieData(objectMap.get("NAME").toString(), objectMap.get("TOTAL")));
		    }
		    //设置类目轴
		    option.yAxis(category);
		    //饼图的圆心和半径
		    pie.center(900,380).radius(100);
		    //设置数据
		    option.series(bar, pie);
		    //由于药品名字过长，图表距离左侧距离设置180，关于grid可以看ECharts的官方文档
		    option.grid().x(180);
		    //返回Option
		    out = resp.getWriter();
			 out.write(option.toString());
	  }
}
