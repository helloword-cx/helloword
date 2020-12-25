package com.jssf.friend.dao;

import java.util.List;
import java.util.Set;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.utils.Pager;

public interface SayMoodDao extends BaseDao<SayMood>{

	Pager<SayMood> loadPhoto(int userId);

	List<SayMood> loadPhotoBefore(int userId);

	Pager<SayMood> shuoshioList(Set<Integer> sets);

	Pager<SayMood> findAllphotosById(int userId);

	List<SayMood> findSYusay();

	List<SayMood> findBYsay();

}
