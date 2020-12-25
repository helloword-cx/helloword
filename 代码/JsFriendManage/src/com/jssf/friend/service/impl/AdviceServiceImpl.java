package com.jssf.friend.service.impl;

import java.util.Date;

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
        advice.setSendUser(UserDao.load(userId));
        adviceDao.add(ad);
	}
	@Override
	public void updatefzsy(Advice advice) {
		// TODO Auto-generated method stub
		//o?id=${ad.id}&isXS=2">取消放置首页</a> 
		Advice a = adviceDao.load(advice.getId());
		if(advice.getIsXS() == 2){
			a.setIsXS(2);
		}else{
			a.setIsXS(1);
		}
		adviceDao.update(a);
	}
	@Override
	public void del(Advice advice) {
		adviceDao.delete(advice.getId());
	}

}
