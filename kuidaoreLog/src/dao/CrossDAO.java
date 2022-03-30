package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Cross;

public class CrossDAO {
	private final String JDBC_URL ="jdbc:mysql://localhost:3306"
			+ "/kuidaore?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public boolean create(Cross postCross) {
		// データベースに接続
		try (Connection conn = DriverManager.getConnection(JDBC_URL,
				DB_USER, DB_PASS)) {
			String sql = "INSERT INTO X_TABLE(U_ID,RES_ID,REV_ID) VALUES(?,?,?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// INSERT文中の「?」に使用する値を設定しSQLを完成
			pStmt.setInt(1, postCross.getUserId());
			pStmt.setInt(2, postCross.getResId());
			pStmt.setInt(3, postCross.getRevId());

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


}
