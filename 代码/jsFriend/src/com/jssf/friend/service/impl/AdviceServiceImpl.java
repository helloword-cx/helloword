package com.jssf.friend.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.AdviceDao;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.Advice;
import com.jssf.friend.model.User;
import com.jssf.friend.service.AdviceService;
import com.jssf.friend.utils.Pager;

@Service("adviceService")
public class AdviceServiceImpl implements AdviceService{
    @Autowired
	private AdviceDao adviceDao;
    @Autowired
    private UserDao UserDao;
	@Override
	public Pager<Advice> findAll() {
		// TODO Auto-generated method stub
		return adviceDao.findAll();
	}
	@Override
	public void saveAdvice(int userId, Advice advice) {
		// TODO Auto-generated method stub
		Advice ad = new Advice();
		ad.setContent(advice.getContent());
        ad.setCreateTime(new Date());
        ad.setIsXS(2);
        User u = UserDao.get(userId);
        System.out.println(u.getUserName());
        ad.setSendUser(u);
        adviceDao.add(ad);
	}
	@Override
	public List<Advice> gonggao() {
		// TODO Auto-generated method stub
		return adviceDao.gonggao();
	}

}
