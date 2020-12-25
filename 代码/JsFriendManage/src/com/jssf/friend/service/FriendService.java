package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Friend;
import com.jssf.friend.model.User;

public interface FriendService {

	List<Friend> loadFriends(int userId);

	void addFriend(int myId, int id, int groupId);

	void deleteFriend(int friendId);

	List<User> loadTuiJian(int userId);

	Friend loadByid(int otherId);

}
