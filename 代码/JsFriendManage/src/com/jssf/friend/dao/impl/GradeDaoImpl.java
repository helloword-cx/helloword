package com.jssf.friend.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.GradeDao;
import com.jssf.friend.dao.JfDao;
import com.jssf.friend.model.Grade;
import com.jssf.friend.model.Jf;
@Repository("gradeDao")
@SuppressWarnings("unchecked")
public class GradeDaoImpl extends BaseDaoImpl<Grade>  implements GradeDao{

	@Override
	public List<Grade> list() {
		String hql = "from Grade";
		Query q = this.getSession().createQuery(hql);
		return q.list();
	}

}
