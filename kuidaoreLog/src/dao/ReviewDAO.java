package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Review;

public class ReviewDAO {/*⑧*/
	private final String JDBC_URL = "jdbc:mysql://localhost:3306"
			+ "/kuidaore?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public List<Review> findAll(int resId) {/*⑨*/

		// ArrayListの呼び出し
		List<Review> reviewList = new ArrayList<>();
		Review rev = null;
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT * FROM X_TABLE "
					+ " JOIN USER_ACCOUNT ON X_TABLE.U_ID = USER_ACCOUNT.U_ID"
					+ " JOIN RESTAURANT ON X_TABLE.RES_ID = RESTAURANT.RES_ID"
					+ " JOIN REVIEW ON X_TABLE.REV_ID = REVIEW.REV_ID WHERE X_TABLE.RES_ID = ?"
					+ " ORDER BY X_TABLE.REV_ID DESC";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, resId); // 店舗ID

			// SELECT文を実行する
			ResultSet rs = pStmt.executeQuery();

			// SELECT文の結果をArrayListに格納
			while (rs.next()) {
				int revId = rs.getInt("REV_ID");
				String userNickname = rs.getString("U_NICKNAME");
				String revTitle = rs.getString("REV_TITLE");
				String revText = rs.getString("REV_TEXT");
				double star = rs.getDouble("REV_STAR");
				String revTime = rs.getString("REV_TIME");

				rev = new Review(revId, userNickname, revTitle, revText, star, revTime); //インスタンスに格納
				reviewList.add(rev); //ArrayListに追加
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return reviewList;

	}

	public boolean create(Review postReview) {
		// データベースに接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL,
				DB_USER, DB_PASS)) {
			String sql = "INSERT INTO REVIEW (REV_TITLE, REV_TEXT, REV_STAR)"
					+ "VALUES(?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// INSERT文中の「?」に使用する値を設定しSQLを完成
			pStmt.setString(1, postReview.getRevTitle()); // レビュータイトル
			pStmt.setString(2, postReview.getRevText()); // コメント内容
			pStmt.setDouble(3, postReview.getStar()); // 五段階評価

			// INSERT文を実行(resultには正常終了した場合は「1」、
			// 正常終了しなかった場合は「0」が代入される)
			int result = pStmt.executeUpdate();
			if (result != 1) {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public Review find() {/*⑨*/

		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT * FROM REVIEW ORDER BY REV_ID DESC";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECT文を実行する
			ResultSet rs = pStmt.executeQuery();

			// SELECT文の結果をArrayListに格納
			if (rs.next()) {
				int revId = rs.getInt("REV_ID");
				String revTitle = rs.getString("REV_TITLE");
				String revText = rs.getString("REV_TEXT");
				double star = rs.getDouble("REV_STAR");

				Review resPostReview = new Review(revId, star, revTitle,revText); //インスタンスに格納
				return resPostReview;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;

	}

	public List<Review> findAll(Review postReview) {/*⑨*/

		// ArrayListの呼び出し
		List<Review> reviewList = new ArrayList<>();

		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT * FROM X_TABLE "
					+ " JOIN USER_ACCOUNT ON X_TABLE.U_ID = USER_ACCOUNT.U_ID"
					+ " JOIN RESTAURANT ON X_TABLE.RES_ID = RESTAURANT.RES_ID"
					+ " JOIN REVIEW ON X_TABLE.REV_ID = REVIEW.REV_ID WHERE X_TABLE.RES_ID = ?"
					+ " ORDER BY X_TABLE.REV_ID DESC";

			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, postReview.getResId()); // 店舗ID

			// SELECT文を実行する
			ResultSet rs = pStmt.executeQuery();

			// SELECT文の結果をArrayListに格納
			while (rs.next()) {
				int revId = rs.getInt("REV_ID");
				String userNickname = rs.getString("U_NICKNAME");
				String revTitle = rs.getString("REV_TITLE");
				String revText = rs.getString("REV_TEXT");
				double star = rs.getDouble("REV_STAR");
				String revTime = rs.getString("REV_TIME");

				postReview = new Review(revId, userNickname, revTitle, revText, star, revTime); //インスタンスに格納
				reviewList.add(postReview); //ArrayListに追加
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return reviewList;
	}

//		public List<Review> revAvg(Review postReview) {/*⑨*/
//
//			// ArrayListの呼び出し
//			List<Review> reviewList = new ArrayList<>();
//
//			// データベースへ接続
//			try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
//
//				// SELECT文を準備
//				String sql = "SELECT AVG(REV_STAR)AS REV_STAR,REVIEW.REV_ID,USER_ACCOUNT.U_NICKNAME,REV_TITLE,REV_TEXT,REV_TIME FROM REVIEW"
//						+ " JOIN X_TABLE ON REVIEW.REV_ID = X_TABLE.REV_ID"
//						+ " JOIN RESTAURANT ON X_TABLE.RES_ID = RESTAURANT.RES_ID"
//						+ " JOIN USER_ACCOUNT ON X_TABLE.U_ID = USER_ACCOUNT.U_ID"
//						+ " WHERE RESTAURANT.RES_ID = ?";
//
//				PreparedStatement pStmt = conn.prepareStatement(sql);
//
//				pStmt.setInt(1, postReview.getResId()); // 店舗ID
//
//				// SELECT文を実行する
//				ResultSet rs = pStmt.executeQuery();
//
//				// SELECT文の結果をArrayListに格納
//				while (rs.next()) {
//					int revId = rs.getInt("REV_ID");
//					String userNickname = rs.getString("U_NICKNAME");
//					String revTitle = rs.getString("REV_TITLE");
//					String revText = rs.getString("REV_TEXT");
//					double star = rs.getDouble("REV_STAR");
//					String revTime = rs.getString("REV_TIME");
//					double revAvg = rs.getDouble("REV_AVG");
//
//					postReview = new Review(revId, star,revAvg,userNickname, revText, revTime,revTitle); //インスタンスに格納
//					reviewList.add(postReview); //ArrayListに追加
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//				return null;
//			}
//			return reviewList;

		}

