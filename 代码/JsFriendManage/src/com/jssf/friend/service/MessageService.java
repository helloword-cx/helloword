package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Message;

public interface MessageService {

	List<Message> findMessageJIluList(int userId);

	int saveMessage(int userId, Message message);

	void updatejinggao(int userId);

}
