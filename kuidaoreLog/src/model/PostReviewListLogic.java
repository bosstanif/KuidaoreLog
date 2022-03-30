package model;

import dao.ReviewDAO;

public class PostReviewListLogic {
	public boolean execute(Review postReview) {
		ReviewDAO dao = new ReviewDAO(); // DAOの呼び出し
		boolean reviewList = dao.create(postReview);// ユーザーIDと入力データを追加
		return reviewList;
	}
}
