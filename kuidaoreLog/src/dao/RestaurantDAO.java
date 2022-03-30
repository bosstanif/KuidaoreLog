package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Restaurant;

public class RestaurantDAO {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "kuidaore?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public boolean findByCheck(Restaurant registerRes) {
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT RES_NAME,RES_TEL,RES_ADDRESS,RES_BUSINESSTIME,"
					+ "RES_HOLIDAY FROM RESTAURANT WHERE RES_NAME = ?";
			;/* SQL文は小文字で入力してもOK */
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, registerRes.getResName());

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したレストランが存在した場合（登録済みのID）、trueを返す
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		// ユーザーが見つからなかったら（未登録のID）、falseを返す
		return false;

	}

	public boolean create(Restaurant registerRes) {

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// INSERT文の準備
			String sql = "INSERT INTO RESTAURANT (RES_NAME,RES_TEL,RES_ADDRESS,RES_BUSINESSTIME,"
					+ "RES_HOLIDAY) VALUES(?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// INSERT文中の「?」に使用する値を設定しSQLを完成

			pStmt.setString(1, registerRes.getResName());
			pStmt.setString(2, registerRes.getResTel());
			pStmt.setString(3, registerRes.getResAddress());
			pStmt.setString(4, registerRes.getResBusinessTime());
			pStmt.setString(5, registerRes.getResHoliday());

			// INSERT文を実行（resultには正常終了した場合は「1」、正常終了しなかった場合は「0」が代入される）
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

	//レストラン情報の取得用メソッド
	public boolean findByRestaurant(Restaurant registerRes) {
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT RES_ID,RES_NAME,RES_TEL,RES_ADDRESS,RES_BUSINESSTIME,"
					+ "RES_HOLIDAY FROM RESTAURANT WHERE RES_NAME = ?";
			;/* SQL文は小文字で入力してもOK */
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, registerRes.getResId());

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したレストランが存在した場合（登録済みのID）、trueを返す
			if (rs.next()) {
				int resId = rs.getInt("RES_ID");
				String resName = rs.getString("RES_NAME");
				String resTel = rs.getString("RES_TEL");
				String resAddress = rs.getString("RES_ADDRESS");
				String resBussinessTime = rs.getString("RES_BUSINESSTIME");
				String resHoliday = rs.getString("RES_HOLIDAY");
				registerRes = new Restaurant(resId, resName, resAddress, resTel, resBussinessTime, resHoliday);

				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		// ユーザーが見つからなかったら（未登録のID）、falseを返す
		return false;

	}

	public List<Restaurant> findByAll() {
		List<Restaurant> resList = new ArrayList<Restaurant>();
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT * from restaurant";
			;/* SQL文は小文字で入力してもOK */
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したレストランが存在した場合（登録済みのID）、trueを返す
			while (rs.next()) {
				int resId = rs.getInt("RES_ID");
				String resName = rs.getString("RES_NAME");
				String resTel = rs.getString("RES_TEL");
				String resAddress = rs.getString("RES_ADDRESS");
				String resBussinessTime = rs.getString("RES_BUSINESSTIME");
				String resHoliday = rs.getString("RES_HOLIDAY");
				Restaurant res = new Restaurant(resId, resName, resAddress, resTel, resBussinessTime, resHoliday);
				resList.add(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		// ユーザーが見つからなかったら（未登録のID）、falseを返す
		return resList;

	}

	public Restaurant findBySelect(String resId) {
		Restaurant res = null;
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT RES_ID, RES_NAME,RES_TEL,RES_ADDRESS,RES_BUSINESSTIME,"
					+ "RES_HOLIDAY FROM RESTAURANT WHERE RES_ID = ?";
			;/* SQL文は小文字で入力してもOK */
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, resId);

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したレストランが存在した場合（登録済みのID）、trueを返す
			if (rs.next()) {
				int resId1 = rs.getInt("RES_ID");
				String resName = rs.getString("RES_NAME");
				String resTel = rs.getString("RES_TEL");
				String resAddress = rs.getString("RES_ADDRESS");
				String resBussinessTime = rs.getString("RES_BUSINESSTIME");
				String resHoliday = rs.getString("RES_HOLIDAY");
				res = new Restaurant(resId1, resName, resAddress, resTel, resBussinessTime, resHoliday);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		// ユーザーが見つからなかったら（未登録のID）、falseを返す
		return res;
	}

}

