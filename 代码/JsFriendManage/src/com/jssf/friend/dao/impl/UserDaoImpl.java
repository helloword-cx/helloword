package com.jssf.friend.dao.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.User;
import com.jssf.friend.utils.Pager;

@Repository("userDao")
@SuppressWarnings("unchecked")
public class UserDaoImpl  extends BaseDaoImpl<User>  implements UserDao{
	@Override
	public List<User> listAllCanSendUser(int userId) {
		String hql = "from User";
		Query q =this.getSession().createQuery(hql);
		return q.list();
	}

	@Override
	public User load(User user) {
		String hql = "from User bean where bean.userName =:userName and bean.passWord= :passWord";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("userName", user.getUserName());
		q.setParameter("passWord", user.getPassWord());
		return (User)q.uniqueResult();
	}

	@Override
	public List<User> findFriend(String userName) {
		String hql = "from User bean where bean.userName =:userName";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("userName", userName);
		return q.list();
	}

	public List<User> loadTuiJian(User you) {
		String hql = "from User bean where (bean.userName =:userName) or (bean.address =:address) or (bean.interest =:interest)  or (bean.age =:age) and bean.id != :id and bean.isDelete = 2";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("userName", you.getUserName());
		q.setParameter("address", you.getAddress());
		q.setParameter("interest", you.getInterest());
		q.setParameter("age", you.getAge());
		q.setParameter("id", you.getId());
		return q.list();
	}

	@Override
	public Pager<User> listAll() {
		String hql = "from User where isDelete = 2 order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		return findByAlias(hql, null);
	}

	@Override
	public Pager<User> finAllByName(String userName) {
		String hql = "from User where userName like :name and isDelete = 2 order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("name", "%" + userName + "%");
		return findByAlias(hql, alias);
	}

	@Override
	public List<User> findSYuser() {
		String hal ="select  * from T_USER where to_char(T_USER.CREATETIME,'yyyymm')=to_char(add_months(sysdate,-1),'yyyymm')";
		Query q =this.getSession().createSQLQuery(hal);
		return q.list();
	}

	@Override
	public List<User> findBYuser() {
		String hal ="select  * from T_USER where to_char(T_USER.CREATETIME,'yyyymm')=to_char(add_months(sysdate,-0),'yyyymm')";
		Query q =this.getSession().createSQLQuery(hal);
		return q.list();
	}

		
}
