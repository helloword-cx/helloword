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
 * 建议
 * @author
 *
 */
@Entity
@Table(name="t_advice")
public class Advice {

	private int id;
	private User sendUser;
	private Date createTime;
	private String content;
	private int isXS;//是否需要显示 1 是 2 否
	@Column(name ="isXS",nullable=true,length=15)
	public int getIsXS() {
		return isXS;
	}
	public void setIsXS(int isXS) {
		this.isXS = isXS;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="senduser_id")
	public User getSendUser() {
		return sendUser;
	}
	public void setSendUser(User sendUser) {
		this.sendUser = sendUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
