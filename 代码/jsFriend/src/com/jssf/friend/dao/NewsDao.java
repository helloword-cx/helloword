package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.News;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.utils.Pager;

public interface NewsDao extends BaseDao<News>{

	Pager<News> list();

	Pager<News> listByTitle(String title);

}
