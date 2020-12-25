package com.jssf.friend.dao;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Manage;
import com.jssf.friend.model.Message;

public interface ManageDao extends BaseDao<Manage>{

	Manage login(Manage manage);

}
