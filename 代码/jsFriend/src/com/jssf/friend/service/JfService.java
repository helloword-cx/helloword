package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Jf;

public interface JfService {

	List<Jf> list();

	Jf findJfByType(int i);

}
