package com.jssf.friend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.FwDao;
import com.jssf.friend.model.Fw;
import com.jssf.friend.model.User;
import com.jssf.friend.service.FwService;
@Service("fwService")
public class FwServiceImpl implements FwService {

	 @Autowired
	 private FwDao fwDao;
	@Override
	public void insert(int userId, int otherId) {
		User u = new User();
		u.setId(userId);
		Fw f = new Fw();
		f.setOther(u);
		f.setUserId(otherId);
		fwDao.add(f);
	}
	@Override
	public List<Fw> list(int userId) {
		// TODO Auto-generated method stub
		return fwDao.list(userId);
	}

}
