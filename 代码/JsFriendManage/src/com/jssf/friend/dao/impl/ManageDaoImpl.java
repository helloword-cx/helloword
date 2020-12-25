package com.jssf.friend.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.dao.ManageDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.Manage;
import com.jssf.friend.model.User;
@Repository("manageDao")
@SuppressWarnings("unchecked")
public class ManageDaoImpl extends BaseDaoImpl<Manage>  implements ManageDao{

	@Override
	public Manage login(Manage manage) {
		String hql = "from Manage bean where bean.name =:userName and bean.passWord= :passWord";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("userName", manage.getName());
		q.setParameter("passWord", manage.getPassWord());
		return (Manage)q.uniqueResult();
	}

}
