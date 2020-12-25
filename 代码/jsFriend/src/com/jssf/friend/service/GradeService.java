package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Jf;

public interface GradeService {

	List<Grade> list();

	void add(Grade grade);

	Grade load(Grade grade);

	void update(Grade grade);

	void del(Grade grade);

}
