package com.jssf.friend.service;
import java.util.List;

import com.jssf.friend.model.User;

public interface UserService {
	public List<User> listAllCanSendUser(int userId);

	public User add(User user);

	public User load(User user);

	public User getUser(int userId);

	public List<User> findFriend(String userName, int myId);

	public User loadUserById(int userId);

	public void update(User u);

	public void updatechongzhi(int id, int yuefen, int jine);
}
