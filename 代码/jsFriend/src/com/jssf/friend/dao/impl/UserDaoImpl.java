package com.jssf.friend.dao.impl;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.UserDao;
import com.jssf.friend.model.User;

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
		String hql = "from User bean where bean.userName =:userName and bean.passWord= :passWord and isDelete = 2";
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
	public User get(int userId) {
		// TODO Auto-generated method stub
		return (User) this.getSession().get(User.class, userId);
	}

		
}
