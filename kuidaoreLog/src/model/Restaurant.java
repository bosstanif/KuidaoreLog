package model;

import java.io.Serializable;

public class Restaurant implements Serializable {
	private int resId;
	private double resEV;
	private String resTel,resName, resAddress, resBusinessTime;
	private String resHoliday;

	public Restaurant() {
	}

	//情報取得用コンストラクタ
	public Restaurant(String resName, String resAddress, String resTel, String resBusinessTime,
			String resHoliday) {
		this.resTel = resTel;
		this.resName = resName;
		this.resAddress = resAddress;
		this.resBusinessTime = resBusinessTime;
		this.resHoliday = resHoliday;
	}


	//重複チェック用コンストラクタ
	public Restaurant(int resId, String resName,String resAddress,String resTel, String resBusinessTime,
			String resHoliday) {
		this.resId = resId;
		this.resTel = resTel;
		this.resName = resName;
		this.resAddress = resAddress;
		this.resBusinessTime = resBusinessTime;
		this.resHoliday = resHoliday;
	}



	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}

	public String getResTel() {
		return resTel;
	}

	public void setResTel(String resTel) {
		this.resTel = resTel;
	}

	public double getResEV() {
		return resEV;
	}

	public void setResEV(double resEV) {
		this.resEV = resEV;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResAddress() {
		return resAddress;
	}

	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
	}

	public String getResBusinessTime() {
		return resBusinessTime;
	}

	public void setResBusinessTime(String resBusinessTime) {
		this.resBusinessTime = resBusinessTime;
	}

	public String getResHoliday() {
		return resHoliday;
	}

	public void setResHoliday(String resHoliday) {
		this.resHoliday = resHoliday;
	}
}


