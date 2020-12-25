package com.jssf.friend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.AdviceDao;
import com.jssf.friend.model.Advice;
import com.jssf.friend.model.Comment;
import com.jssf.friend.utils.Pager;
@Repository("adviceDao")
@SuppressWarnings("unchecked")
public class AdviceDaoImpl extends BaseDaoImpl<Advice>  implements AdviceDao{

	@Override
	public Pager<Advice> findAll() {
		String hql = "from Advice order by createTime desc";
		return findByAlias(hql, null);
	}

	@Override
	public List<Advice> gonggao() {
		// TODO Auto-generated method stub
		String hql = "from Advice where  isXS = 1 order by createTime desc";
		return list(hql);
	}

}
