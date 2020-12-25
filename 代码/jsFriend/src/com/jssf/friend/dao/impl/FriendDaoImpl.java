package com.jssf.friend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.model.Friend;
import com.jssf.friend.model.User;
@Repository("friendDao")
@SuppressWarnings("unchecked")
public class FriendDaoImpl extends BaseDaoImpl<Friend>  implements FriendDao {

	@Override
	public List<Friend> loadFriends(int userId) {
		String hql = "from Friend where (user.id = :id or friendUser.id =:id)  and isDelete = 2 order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", userId);
		return listByAlias(hql, alias);
	}

	@Override
	public Friend checkIsFriend(int id, int myId) {
		// TODO Auto-generated method stub
		String hql = "from Friend where (user.id = :myId and friendUser.id =:id) or (user.id = :id and friendUser.id =:myId) order by createTime desc";
		Query qu =this.getSession().createQuery(hql);
		qu.setParameter("id", id);
		qu.setParameter("myId", myId);
		return (Friend)qu.uniqueResult();
	}


}
