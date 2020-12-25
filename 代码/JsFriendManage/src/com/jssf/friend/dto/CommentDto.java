package com.jssf.friend.dto;

import java.util.ArrayList;
import java.util.List;

import com.jssf.friend.model.Comment;

public class CommentDto {
	private Comment comment;
	private List<Comment> comments = new ArrayList<Comment>();
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

}
