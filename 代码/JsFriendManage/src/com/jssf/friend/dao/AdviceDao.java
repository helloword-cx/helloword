package com.jssf.friend.dao;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Advice;
import com.jssf.friend.utils.Pager;

public interface AdviceDao extends BaseDao<Advice>{

	Pager<Advice> findAll();

}
