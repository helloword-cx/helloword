package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Jf;

public interface JfService {

	List<Jf> list();

	void add(Jf jf);

	void update(Jf jf);

	Jf load(Jf jf);

	void del(Jf jf);

}
