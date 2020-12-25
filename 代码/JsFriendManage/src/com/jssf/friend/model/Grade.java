package com.jssf.friend.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 等级
 * @author
 *会员等级:普通会员(1-500积分)
                 黄金会员(501-1200积分)
                 白金会员(1201-1800积分)
                 钻石会员(1800积分以上)

操作:1.注册本网站获得积分5分
         2.会员没登陆一次获得积分1分
         3.用户自己发一条说说获得积分2分
         4用户上传一张照片获得积分2分
         5.用户给好友评论可获得积分1分
         6.用户添加一个好友获得积分1分
         7.用户给管理员的意见箱投信件可以获得积分2分
 */
@Entity
@Table(name="t_grade")
public class Grade {
	private int id;
	private int startMin;//开始分数
	private int endMax;//结束分数
	private String  name;
	private Date createTime;
	private int type;//类型
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
	public int getStartMin() {
		return startMin;
	}
	public void setStartMin(int startMin) {
		this.startMin = startMin;
	}
	public int getEndMax() {
		return endMax;
	}
	public void setEndMax(int endMax) {
		this.endMax = endMax;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
