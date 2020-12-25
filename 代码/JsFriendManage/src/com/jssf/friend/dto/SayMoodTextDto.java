package com.jssf.friend.dto;

import java.util.List;
import java.util.Map;

import com.jssf.friend.model.SayMood;

public class SayMoodTextDto {
	private SayMood sayMood;
	private List<Map<String,Object>> pingluHuifu;
	public SayMood getSayMood() {
		return sayMood;
	}
	public void setSayMood(SayMood sayMood) {
		this.sayMood = sayMood;
	}
	public List<Map<String, Object>> getPingluHuifu() {
		return pingluHuifu;
	}
	public void setPingluHuifu(List<Map<String, Object>> pingluHuifu) {
		this.pingluHuifu = pingluHuifu;
	}

}
