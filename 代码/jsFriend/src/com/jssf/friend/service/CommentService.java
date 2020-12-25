package com.jssf.friend.service;

import java.util.List;

import com.jssf.friend.model.Comment;
import com.jssf.friend.utils.Pager;

public interface CommentService {

	Pager<Comment> findBySayId(int id);

	List<Comment> listNextComByFatherId(int id);

	void comment(Comment comment, int userId, int sayMoodId);

	void save(Comment comment, int userId, int sayMoodId);

	void savehuifu(Comment comment, int userId);

	List<Comment> findBySayIdList(int id);

}
