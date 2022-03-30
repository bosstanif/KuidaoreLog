package model;

import java.util.List;

import dao.RestaurantDAO;

public class GetRestaurantLogic {
	public boolean execute(Restaurant res) {
		RestaurantDAO dao = new RestaurantDAO();
		boolean resList = dao.findByRestaurant(res);

		return resList;
	}

	public List<Restaurant> findByAll() {
		RestaurantDAO dao = new RestaurantDAO();
		List<Restaurant> resList = dao.findByAll();

		return resList;
	}

	public Restaurant findBySelect(String resId) {
		RestaurantDAO dao = new RestaurantDAO();
		Restaurant res = dao.findBySelect(resId);
		return res;

	}

}
