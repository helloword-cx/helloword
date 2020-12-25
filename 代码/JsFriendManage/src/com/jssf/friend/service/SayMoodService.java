package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.SayMood;
import com.jssf.friend.utils.Pager;

public interface SayMoodService {

	Pager<SayMood> loadPhoto(int userId);

	void save(SayMood sayMood);

	SayMood loadPhotoById(int id);

	List<SayMood> loadPhotoBefore(int userId);

	void update(int id);

	void delete(int id);

	Pager<SayMood> shuoshioList(int userId);

	Pager<SayMood> findAllphotosById(int userId);

	void del(int sayId);

	List<SayMood> findSYusay();

	List<SayMood> findBYsay();

}
