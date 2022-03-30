package model;

import java.util.List;

import dao.ReviewDAO;

public class GetReviewListLogic {
	public List<Review> findAll(Review postReview) {
		ReviewDAO dao = new ReviewDAO(); // DAO呼び出し

		// 取得した店舗IDをクエリにレビューの取得、ArrayListに格納
		List<Review> reviewList = dao.findAll(postReview);
		return reviewList;
	}

	public Review find() {
		ReviewDAO dao = new ReviewDAO();

		Review reviewId = dao.find();
		return reviewId;
	}

	public List<Review> findReview(int resId) {
		ReviewDAO dao = new ReviewDAO(); // DAO呼び出し

		// 取得した店舗IDをクエリにレビューの取得、ArrayListに格納
		List<Review> reviewList = dao.findAll(resId);
		return reviewList;
	}
}
