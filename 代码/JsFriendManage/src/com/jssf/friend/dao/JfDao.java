package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Jf;
import com.jssf.friend.model.Message;

public interface JfDao extends BaseDao<Jf>{

	List<Jf> list();

}
