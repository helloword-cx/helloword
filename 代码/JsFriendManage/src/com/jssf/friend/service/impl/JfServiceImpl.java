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
	public void add(Jf jf) {
		// TODO Auto-generated method stub
		jfDao.add(jf);
	}

	@Override
	public void update(Jf jf) {
		// TODO Auto-generated method stub
	 Jf jfd =jfDao.load(jf.getId());
	 jfd.setFenshu(jf.getFenshu());
	 jfd.setMiaoshu(jf.getMiaoshu());
	 jfd.setType(jf.getType());
	 jfDao.update(jfd);
	}

	@Override
	public Jf load(Jf jf) {
		// TODO Auto-generated method stub
		return jfDao.load(jf.getId());
	}

	@Override
	public void del(Jf jf) {
		// TODO Auto-generated method stub
		jfDao.delete(jf.getId());
	}
	
	
}
