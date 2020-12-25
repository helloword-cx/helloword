package com.jssf.friend.dao;

import java.util.List;
import java.util.Set;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.Message;

public interface MessageDao extends BaseDao<Message>{

	List<Message> findMessageJIluList(Set<Integer> sets);
	Message findJGByUserId(int userId);
}
