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
import javax.persistence.Transient;

/**
 * 留言和 消息
 * @author
 *
 */
@Entity
@Table(name="t_message")
public class Message {
	private int id;
	private String content;
	private User sendUser;//发送人
	private Date createTime;//发送时间
	private int type;//1消息 2留言3警告
	private int isRead;//1已读 2未读
	private String createTimeStr;
	@Transient
	public String getCreateTimeStr() {
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

}
