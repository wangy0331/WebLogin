package com.web.bean;

import com.web.utility.PageInfo;

public class UserExample extends PageInfo{
	private String msgContentCri;
	private Integer msgStatusCri;

	public String getMsgContentCri() {
		return msgContentCri;
	}

	public void setMsgContentCri(String msgContentCri) {
		this.msgContentCri = msgContentCri;
	}

	public Integer getMsgStatusCri() {
		return msgStatusCri;
	}

	public void setMsgStatusCri(Integer msgStatusCri) {
		this.msgStatusCri = msgStatusCri;
	}
	
}
