package com.jssf.friend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.ManageDao;
import com.jssf.friend.model.Manage;
import com.jssf.friend.service.ManageService;
@Service("manageService")
public class ManageServiceImpl implements ManageService {
     @Autowired
	 private ManageDao manageDao;
	@Override
	public Manage login(Manage manage) {
		// TODO Auto-generated method stub
		Manage m = new Manage();
		 m.setName(manage.getName());
		 m.setPassWord(manage.getPassWord());
		return manageDao.login(m);
	}
	

}
