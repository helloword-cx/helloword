package com.jssf.friend.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.dao.FwDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.Fw;
@Repository("fwDao")
@SuppressWarnings("unchecked")
public class FwDaoImpl extends BaseDaoImpl<Fw>  implements FwDao {

	@Override
	public List<Fw> list(int userId) {
		// TODO Auto-generated method stub
		String hqi = "from Fw where userId = "+userId +"order by id desc";
		Query q = getSession().createQuery(hqi);
		q.setMaxResults(10);
		q.setFirstResult(1);
		return q.list();
	}

}
