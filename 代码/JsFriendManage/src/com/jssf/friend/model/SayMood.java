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
 * 说说
 * @author
 *
 */
@Entity
@Table(name="t_sayMood")
public class SayMood {
	private int id;
	private String content;//发表内容，如果是文字就是内容，如果是图片就是url
	private User sayUser;//发表人
	private Date createTime;
	private int isDelete;//是否删除 1是 2否
	private int dzs;//如果是图片，点赞数
	private int type;//1说 2图片
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
	@JoinColumn(name="user_id")
	public User getSayUser() {
		return sayUser;
	}
	public void setSayUser(User sayUser) {
		this.sayUser = sayUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getDzs() {
		return dzs;
	}
	public void setDzs(int dzs) {
		this.dzs = dzs;
	}

}
