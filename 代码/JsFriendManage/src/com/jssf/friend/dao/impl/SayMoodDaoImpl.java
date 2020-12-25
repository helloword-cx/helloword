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
	public Pager<SayMood> findAllphotosById(int userId) {
		String hql = "from SayMood where sayUser.id = :id and type= 2 and isDelete = 2 order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", userId);
		return findByAlias(hql, alias);
	}

	@Override
	public List<SayMood> findSYusay() {
		String hal ="select  * from T_SAYMOOD where  type= 2 and to_char(T_SAYMOOD.CREATETIME,'yyyymm')=to_char(add_months(sysdate,-1),'yyyymm')";
		Query q =this.getSession().createSQLQuery(hal);
		return q.list();
	}

	@Override
	public List<SayMood> findBYsay() {
		String hal ="select  * from T_SAYMOOD where  type= 2 and to_char(T_SAYMOOD.CREATETIME,'yyyymm')=to_char(add_months(sysdate,-0),'yyyymm')";
		Query q =this.getSession().createSQLQuery(hal);
		return q.list();
	}

}
