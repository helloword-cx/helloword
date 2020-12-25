package com.jssf.friend.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jssf.friend.base.dao.impl.BaseDaoImpl;
import com.jssf.friend.dao.CommentDao;
import com.jssf.friend.dao.FriendDao;
import com.jssf.friend.model.Comment;
import com.jssf.friend.utils.Pager;

@Repository("commentDao")
@SuppressWarnings("unchecked")
public class CommentDaoImpl extends BaseDaoImpl<Comment>  implements CommentDao{

	//根据shuoshuoid查询一级评论
	@Override
	public Pager<Comment> commentDao(int id) {
		String hql = "from Comment where sayMood.id = :id and fatherComment is null order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", id);
		return findByAlias(hql, alias);
	}

	@Override
	public List<Comment> listNextComByFatherId(int id) {
		String hql = "from Comment where fatherComment.id = :id order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", id);
		return listByAlias(hql, alias);
	}

	@Override
	public List<Comment> findBySayIdList(int id) {
		String hql = "from Comment where sayMood.id = :id and fatherComment is null order by createTime desc";
		Map<String,Object> alias = new HashMap<String,Object>();
		alias.put("id", id);
		return listByAlias(hql, alias);
	}

}
