package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Advice;
import com.jssf.friend.utils.Pager;

public interface AdviceDao extends BaseDao<Advice>{

	Pager<Advice> findAll();

	List<Advice> gonggao();

}
