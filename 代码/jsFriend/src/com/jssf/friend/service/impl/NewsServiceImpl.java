package com.jssf.friend.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jssf.friend.dao.NewsDao;
import com.jssf.friend.model.News;
import com.jssf.friend.service.NewsService;
import com.jssf.friend.utils.Pager;

@Service
public class NewsServiceImpl implements NewsService{
	@Autowired
	private NewsDao NewsDao;

	@Override
	public Pager<News> list(String title) {
		if(title == null || "".equals(title)){
			return NewsDao.list();
		}else{
			return NewsDao.listByTitle(title);
		}
		
	}

	@Override
	public void add(News news) {
		news.setCreateTime(new Date());
		NewsDao.add(news);
	}

	@Override
	public News load(News news) {
		return NewsDao.load(news.getId());
	}

	@Override
	public void update(News news) {
		News nn = NewsDao.load(news.getId());
		nn.setContent(news.getContent());
		nn.setTitle(news.getTitle());
		NewsDao.update(nn);
	}

	@Override
	public void del(News news) {
		NewsDao.delete(news.getId());
	}

}
