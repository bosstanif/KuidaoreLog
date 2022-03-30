package model;

import dao.RestaurantDAO;

public class RegisterRestaurantLogic {
	public boolean execute(Restaurant registerRes) {
		RestaurantDAO dao = new RestaurantDAO();
		boolean registed = dao.findByCheck(registerRes); //入力された飲食店が既にあるかを確認
		if (!registed) {
			dao.create(registerRes); //店舗が登録されていないので、INSERTする
			return true;
		} else {
			return false;//登録済み
	}
	}
}
