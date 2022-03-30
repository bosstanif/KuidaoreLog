package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;

public class MyProfileDAO {/*㉔*/
	// データベース接続に使用する情報
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "kuidaore?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	/* ユーザー登録 */
	public boolean findByCheck(Account account) {/*㉖*/
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// SELECT文を準備
			String sql = "SELECT U_ID,U_NICKNAME,U_PASS,U_NAME,U_ADDRESS,U_MAIL,U_BIRTHDAY,U_TEL,"
					+ "U_AVATAR_PATH FROM USER_ACCOUNT where u_mail=?";/* SQL文は小文字で入力してもOK */
			PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setString(1, account.getUserMail());

			// SELECTを実行し、結果表を取得
			ResultSet rs = pStmt.executeQuery();

			// 一致したユーザーが存在した場合（登録済みのID）、trueを返す
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

	public boolean create(Account account) {
		// データベースへ接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			// INSERT文の準備
			String sql = "INSERT INTO USER_ACCOUNT(U_NICKNAME,U_PASS,U_NAME,U_ADDRESS,U_MAIL,U_BIRTHDAY,U_TEL,U_AVATAR_PATH) VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// INSERT文中の「?」に使用する値を設定しSQLを完成
//			pStmt.setInt(1, account.getUserId()); //1つ目の「?」
			pStmt.setString(1, account.getUserNickname());
			pStmt.setString(2, account.getPass());//2つ目の「?」
			pStmt.setString(3, account.getUserName());//3つ目の「?」
			pStmt.setString(4, account.getUserAddress());
			pStmt.setString(5, account.getUserMail());
			pStmt.setString(6, account.getBirthday());
			pStmt.setString(7, account.getUserTel());
			pStmt.setString(8, account.getAvatarPath());

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



}