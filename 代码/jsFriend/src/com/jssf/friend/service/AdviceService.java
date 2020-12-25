package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Advice;
import com.jssf.friend.utils.Pager;

public interface AdviceService {

	Pager<Advice> findAll();

	void saveAdvice(int userId, Advice advice);

	List<Advice> gonggao();

}
