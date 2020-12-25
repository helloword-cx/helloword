package com.jssf.friend.dao;

import java.util.List;

import com.jssf.friend.base.dao.BaseDao;
import com.jssf.friend.model.Comment;
import com.jssf.friend.utils.Pager;

public interface CommentDao extends BaseDao<Comment>{

	Pager<Comment> commentDao(int id);

	List<Comment> listNextComByFatherId(int id);

	List<Comment> findBySayIdList(int id);

}
