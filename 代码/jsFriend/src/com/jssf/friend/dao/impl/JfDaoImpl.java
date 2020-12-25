package com.jssf.friend.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.JfDao;
import com.jssf.friend.model.Jf;
@Repository("jsDaoImpl")
@SuppressWarnings("unchecked")
public class JfDaoImpl extends BaseDaoImpl<Jf>  implements JfDao{

	@Override
	public List<Jf> list() {
		String hql = "from Jf";
		Query q = this.getSession().createQuery(hql);
		return q.list();
	}

	@Override
	public Jf findJfByType(int i) {
		String hql = "from Jf where type = :type";
		Query q = this.getSession().createQuery(hql);
		q.setParameter("type", i);
		return (Jf)q.uniqueResult();
	}

}
