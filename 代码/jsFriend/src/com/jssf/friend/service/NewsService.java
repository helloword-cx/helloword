package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.News;
import com.jssf.friend.utils.Pager;

public interface NewsService {

	Pager<News> list(String title);

	void add(News news);

	News load(News news);

	void update(News news);

	void del(News news);

}
