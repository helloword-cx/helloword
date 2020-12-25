package com.jssf.friend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.MessageDao;
import com.jssf.friend.dao.NewsDao;
import com.jssf.friend.model.Message;
import com.jssf.friend.model.News;
import com.jssf.friend.utils.Pager;
@Repository("newsDao")
@SuppressWarnings("unchecked")
public class NewsDaoImpl extends BaseDaoImpl<News>  implements NewsDao{

	@Override
	public Pager<News> list() {
		String hql = "from News order by createTime desc";
		return findByAlias(hql, null);
	}

	@Override
	public Pager<News> listByTitle(String title) {
		// TODO Auto-generated method stub
		String hql = "from News where title like :title order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("title", "%" + title + "%");
		return findByAlias(hql, alias);
	}

}
