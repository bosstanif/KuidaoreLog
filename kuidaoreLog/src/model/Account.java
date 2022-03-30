package model;

import java.io.Serializable;

public class Account implements Serializable {
	private int userId;
	private String pass, userNickname, userName, userAddress, userMail, birthday, userTel;

	/*⑬*/
	public Account() {
	}

	/*㉘*/
	public Account(String userNickname, String pass, String userName, String userAddress, String userMail,
			String birthday,
			String userTel) {
		/*       this.userId = userId;*/
		this.userNickname = userNickname;
		this.pass = pass;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userMail = userMail;
		this.birthday = birthday;
		this.userTel = userTel;
	}

	public Account(String userMail, String pass,String userNickname) {
		this.userMail = userMail;
		this.pass = pass;
		this.userNickname = userNickname;
	}

	public Account(int userId, String userMail, String pass,String userNickname) {
		this.userId = userId;
		this.userMail = userMail;
		this.pass = pass;
		this.userNickname = userNickname;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

}
