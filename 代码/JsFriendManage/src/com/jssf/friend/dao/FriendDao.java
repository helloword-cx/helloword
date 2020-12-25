package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.User;

public interface FriendDao extends BaseDao<Friend>{

	List<Friend> loadFriends(int userId);

	Friend checkIsFriend(int id, int myId);


}
