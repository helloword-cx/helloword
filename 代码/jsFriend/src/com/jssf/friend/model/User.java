package com.jssf.friend.model;

import java.io.Serializable;
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

import org.springframework.transaction.annotation.Transactional;

@Entity
@Table(name="t_user")
public class User implements Serializable{
	private int id;
	private int age;
	private int sex;//1男2女
	private String interest;//爱好
	private String address;
	private String userName;//真实名
	private String passWord;//密码
	private int isLh;//是否拉黑
	private int isDelete;//是否删除；1是2不是
	private int jifen;//积分
	private Date dqTime;//到期时间
	private String dengji;//等级
	private String tx;
	
	public String getTx() {
		return tx;
	}
	public void setTx(String tx) {
		this.tx = tx;
	}
	@Transient
	 public String getDengji() {
		return dengji;
	}
	public void setDengji(String dengji) {
		this.dengji = dengji;
	}
	public Date getDqTime() {
		return dqTime;
	}
	public void setDqTime(Date dqTime) {
		this.dqTime = dqTime;
	}
	@Column(name ="jifen",nullable=true,length=15) 
	public int getJifen() {
		return jifen;
	}
	public void setJifen(int jifen) {
		this.jifen = jifen;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	private Date createTime;
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public int getIsLh() {
		return isLh;
	}
	public void setIsLh(int isLh) {
		this.isLh = isLh;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
}
