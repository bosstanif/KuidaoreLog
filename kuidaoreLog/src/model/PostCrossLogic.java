package model;

import dao.CrossDAO;

public class PostCrossLogic {
	public boolean execute(Cross postCross) {
		CrossDAO dao = new CrossDAO(); // DAOの呼び出し
		boolean result = dao.create(postCross);
		if (result) {
			return true;
		}
		return false;
	}

}
