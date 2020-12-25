package com.jssf.friend.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.User;
import com.jssf.friend.service.FriendService;

@Service("friendService")
public class FriendServiceImpl implements FriendService{
    @Autowired
	private FriendDao FriendDao;
    @Autowired
    private UserDao userDao;
	@Override
	public List<Friend> loadFriends(int userId) {
		// TODO Auto-generated method stub
		return FriendDao.loadFriends(userId);
	}
	@Override
	public void addFriend(int myId, int id,int groupId) {
		User my = userDao.load(myId);
		User you = userDao.load(id);
		
		Friend friend = new Friend();
		friend.setCreateTime(new Date());
		friend.setFriendUser(you);
		friend.setIsDelete(2);
		friend.setUser(my);
		friend.setGroups(groupId);
		FriendDao.add(friend);
	}
	@Override
	public void deleteFriend(int friendId) {
		// TODO Auto-generated method stub
		Friend f =FriendDao.load(friendId);
		f.setIsDelete(1);
		FriendDao.update(f);
	}
	@Override
	public List<User> loadTuiJian(int userId) {
		List<User> users = new ArrayList<User>();
		//首选进行匹配查询
		User you = userDao.load(userId);
		List<User> us =userDao.loadTuiJian(you);
		for(User u : us){
			//查询。这个人跟我是不是好友
			Friend f =FriendDao.checkIsFriend(userId, u.getId());
			if(f == null && you.getId() != u.getId() ){
				users.add(u);
			}
		}
		return users;
	}
	@Override
	public Friend loadByid(int otherId) {
		// TODO Auto-generated method stub
		return FriendDao.load(otherId);
	}

}
