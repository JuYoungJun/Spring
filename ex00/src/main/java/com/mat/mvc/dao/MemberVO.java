package com.mat.mvc.dao;

import java.util.*;

public class MemberVO {
	private String userID;
	private String userPW;
	private String userName;
	private Date regDAte;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegDAte() {
		return regDAte;
	}

	public void setRegDAte(Date regDAte) {
		this.regDAte = regDAte;
	}

}
