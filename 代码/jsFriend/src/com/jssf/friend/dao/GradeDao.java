package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.Grade;

public interface GradeDao extends BaseDao<Grade>{

	List<Grade> list();

}
