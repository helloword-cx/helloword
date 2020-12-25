package com.jssf.friend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.SayMoodDao;
import com.jssf.friend.model.SayMood;
import com.jssf.friend.model.User;
import com.jssf.friend.utils.Pager;

@Repository("sayMoodDao")
@SuppressWarnings("unchecked")
public class SayMoodDaoImpl extends BaseDaoImpl<SayMood>  implements SayMoodDao{

	//查询用户的图片
	@Override
	public Pager<SayMood> loadPhoto(int userId) {
		String hql = "from SayMood where sayUser.id = :id and type= 2 and isDelete = 2 order by createTime asc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", userId);
		return findByAlias(hql, alias);
	}

	@Override
	public List<SayMood> loadPhotoBefore(int userId) {
		// TODO Auto-generated method stub
		String hql = "from SayMood where sayUser.id = :id and type= 2 and isDelete = 2 order by createTime desc";
		Query qu =	getSession().createQuery(hql);
		qu.setParameter("id", userId);
		qu.setFirstResult(0);
		qu.setMaxResults(5);
		return qu.list();
	}

	@Override
	public Pager<SayMood> shuoshioList(Set<Integer> sets) {
		String hql = "from SayMood where sayUser.id in (:alist) and type= 1 and isDelete = 2 order by createTime desc";
		Query query = getSession().createQuery(hql);   
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("alist", sets);
		return findByAlias(hql, alias);
	}

	@Override
	public List<SayMood> zshy() {
		String hql = "from SayMood where type= 2 and isDelete = 2 order by dzs desc";
		Query qu =	getSession().createQuery(hql);
		qu.setFirstResult(0);
		qu.setMaxResults(10);
		return qu.list();
	}

}
