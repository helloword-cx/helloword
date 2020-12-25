package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Fw;

public interface FwDao extends BaseDao<Fw> {

	List<Fw> list(int userId);

}
