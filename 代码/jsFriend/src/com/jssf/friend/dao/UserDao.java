package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.User;

public interface UserDao extends BaseDao<User>{
	public List<User> listAllCanSendUser(int userId);
	@Override
	User add(User t);
	public User load(User user);
	public List<User> findFriend(String userName);
	public List<User> loadTuiJian(User you);
	public User get(int userId);

}
