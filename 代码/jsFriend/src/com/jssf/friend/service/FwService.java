package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Fw;

public interface FwService {

	void insert(int userId, int otherId);

	List<Fw> list(int userId);

}
