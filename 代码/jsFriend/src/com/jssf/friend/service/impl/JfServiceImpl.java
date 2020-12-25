package com.jssf.friend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.JfDao;
import com.jssf.friend.model.Jf;
import com.jssf.friend.service.JfService;
@Service
public class JfServiceImpl implements JfService {
    @Autowired
	private JfDao jfDao;

	@Override
	public List<Jf> list() {
		// TODO Auto-generated method stub
		return jfDao.list();
	}

	@Override
	public Jf findJfByType(int i) {
		// TODO Auto-generated method stub
		return jfDao.findJfByType(i);
	}
}
