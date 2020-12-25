package com.jssf.friend.service;

import com.jssf.friend.model.Advice;
import com.jssf.friend.utils.Pager;

public interface AdviceService {

	Pager<Advice> findAll();

	void saveAdvice(int userId, Advice advice);

	void updatefzsy(Advice advice);

	void del(Advice advice);

}
