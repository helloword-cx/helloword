package com.jssf.friend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="fw")
public class Fw {

	private Integer id;
	
	private Integer userId;
	
	private User other;//访问人id
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@ManyToOne
	@JoinColumn(name="other_id")
	public User getOther() {
		return other;
	}

	public void setOther(User other) {
		this.other = other;
	}
	
	
}
