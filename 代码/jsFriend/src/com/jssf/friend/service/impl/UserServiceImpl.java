package com.jssf.friend.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.User;
import com.jssf.friend.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
    @Autowired
	private UserDao userdao;
    @Autowired
    private FriendDao friendDao;
	@Override
	public List<User> listAllCanSendUser(int userId) {
		return userdao.listAllCanSendUser(userId);
	}
	@Override
	public User add(User user) {
		return userdao.add(user);
	}
	@Override
	public User load(User user) {
		return userdao.load(user);
	}
	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return userdao.load(userId);
	}
	@Override
	public List<User> findFriend(String userName,int myId) {
		// TODO Auto-generated method stub
		List<User> us = new ArrayList<User>();
		List<User> users=  userdao.findFriend(userName);
		//排除已经添加过得
		for(User u : users){
			Friend ch =friendDao.checkIsFriend(u.getId(),myId);
			if(ch==null){
				us.add(u);
			}
		}
		
		return us;
	}
	@Override
	public User loadUserById(int userId) {
		// TODO Auto-generated method stub
		return userdao.load(userId);
	}
	@Override
	public void update(User u) {
		// TODO Auto-generated method stub
		userdao.update(u);
	}
	@Override
	public void updatechongzhi(int id, int yuefen, int jine) {
		// TODO Auto-generated method stub
		User loadu = userdao.load(id);
		if(loadu.getDqTime() == null){
			loadu.setDqTime(later(yuefen,new Date()));
		}else if(loadu.getDqTime() != null && loadu.getDqTime().getTime()<new Date().getTime()){
			loadu.setDqTime(later(yuefen,new Date()));
		}else{
			loadu.setDqTime(later(yuefen,loadu.getDqTime()));
		}
		
		loadu.setJifen(loadu.getJifen()+yuefen*25);
		userdao.update(loadu);
	}

	
  public Date later(int y,Date da ){
		Calendar calendar = Calendar.getInstance();

		calendar.setTime(da);

		calendar.add(Calendar.MONTH, y);

		System.out.println("增加月份后的日期："+calendar.getTime());
		return calendar.getTime();
  }
}
