package com.jssf.friend.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 评论
 * @author 
 *
 */
@Entity
@Table(name="t_comment")
public class Comment {
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", fatherComment=" + fatherComment + ", sayUser="
				+ sayUser + ", comUser=" + comUser + ", createTime=" + createTime + ", sayMood=" + sayMood + "]";
	}
	private int id;
	private String content;//内容
	private Comment fatherComment;//上一级评论默认为 0
	private User sayUser;//发表人
	private User comUser;//评论人
	private Date createTime;
	private SayMood sayMood;//说说或者图片
	@ManyToOne
	@JoinColumn(name="sayMood_id")
	public SayMood getSayMood() {
		return sayMood;
	}
	public void setSayMood(SayMood sayMood) {
		this.sayMood = sayMood;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@ManyToOne
	@JoinColumn(name="father_id")
	public Comment getFatherComment() {
		return fatherComment;
	}
	public void setFatherComment(Comment fatherComment) {
		this.fatherComment = fatherComment;
	}
	@ManyToOne
	@JoinColumn(name="sayuser_id")
	public User getSayUser() {
		return sayUser;
	}
	public void setSayUser(User sayUser) {
		this.sayUser = sayUser;
	}
	@ManyToOne
	@JoinColumn(name="comuser_id")
	public User getComUser() {
		return comUser;
	}
	public void setComUser(User comUser) {
		this.comUser = comUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	

}
