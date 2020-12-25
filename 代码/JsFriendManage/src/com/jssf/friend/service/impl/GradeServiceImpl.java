package com.jssf.friend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.GradeDao;
import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Jf;
import com.jssf.friend.service.GradeService;
@Service
public class GradeServiceImpl implements GradeService{
     @Autowired
	private GradeDao GradeDao;
	@Override
	public List<Grade> list() {
		// TODO Auto-generated method stub
		return GradeDao.list();
	}

	@Override
	public void add(Grade grade) {
		// TODO Auto-generated method stub
		GradeDao.add(grade);
	}

	@Override
	public Grade load(Grade grade) {
		// TODO Auto-generated method stub
		return GradeDao.load(grade.getId());
	}

	@Override
	public void update(Grade grade) {
		// TODO Auto-generated method stub
		Grade g = GradeDao.load(grade.getId());
		g.setEndMax(grade.getEndMax());
		g.setStartMin(grade.getStartMin());
		g.setName(grade.getName());
		g.setType(grade.getType());
		GradeDao.update(g);
	}

	@Override
	public void del(Grade grade) {
		// TODO Auto-generated method stub
		GradeDao.delete(grade.getId());
	}

}
