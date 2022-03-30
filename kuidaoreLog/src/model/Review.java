package model;

import java.io.Serializable;

public class Review implements Serializable {
	private int revId, userId, resId;
	private double star,revAvg;
	private String revText;
	private String userNickname;
	private String revTime;
	private String revTitle;

	public Review(int revId, double star, double revAvg, String revText, String userNickname,
			String revTime, String revTitle) {
		this.revId = revId;
		this.star = star;
		this.revAvg = revAvg;
		this.revText = revText;
		this.userNickname = userNickname;
		this.revTime = revTime;
		this.revTitle = revTitle;
	}

	public Review(int revId, double star, String revTitle,String revText) {
		this.revId = revId;
		this.star = star;
		this.revText = revText;
		this.revTitle = revTitle;
	}

	public Review(String revTitle,String revText,  double star) {
		this.revTitle = revTitle;
		this.revText = revText;
		this.star = star;
	}

	public Review(int revId, String userNickname,String revTitle, String revText,double star,String revTime) {
		this.revId = revId;
		this.userNickname = userNickname;
		this.revTitle = revTitle;
		this.revText = revText;
		/*		this.userId = userId;
				this.resId = resId;*/
		this.revTime = revTime;
		this.star = star;

	}

	public int getRevId() {
		return revId;
	}

	public void setRevId(int revId) {
		this.revId = revId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getRevText() {
		return revText;
	}

	public void setRevText(String revText) {
		this.revText = revText;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getRevTime() {
		return revTime;
	}

	public void setRevTime(String revTime) {
		this.revTime = revTime;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public double getRevAvg() {
		return revAvg;
	}

}