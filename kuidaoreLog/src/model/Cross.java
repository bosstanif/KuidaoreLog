package model;

import java.io.Serializable;

public class Cross implements Serializable {
	private int userId,resId,revId;

	public Cross(int userId, int resId) {
		this.userId = userId;
		this.resId = resId;
	}

	public Cross(int userId, int resId, int revId) {
		this.userId = userId;
		this.resId = resId;
		this.revId = revId;
	}

	public int getUserId() {
		return userId;
	}

	public int getResId() {
		return resId;
	}

	public int getRevId() {
		return revId;
	}

}
