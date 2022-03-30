package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;


@WebServlet("/MyProfile")
public class MyProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//
//		// セッションスコープに保存された登録アカウントを取得
//					HttpSession session = request.getSession();
//					Account registerAccount = (Account) session.getAttribute("registerAccount");
//
//					// 登録処理の呼び出し
//					MyProfileLogic myProfilelogic = new MyProfileLogic();/*⑲*/
//					MyProfileLogic bo = new MyProfileLogic();
//					request.setAttribute("registerAccount", registerAccount);




		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/myProfile.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// リクエストパラメータの取得
				request.setCharacterEncoding("UTF-8");
				//    	String id = request.getParameter("userId");
				String userNickname = request.getParameter("userNickname");
				String pass = request.getParameter("pass");
				String userName = request.getParameter("userName");
				String userAddress = request.getParameter("userAddress");
				String userMail = request.getParameter("userMail");
				String birthday = request.getParameter("birthday");
				String userTel = request.getParameter("userTel");
				//		int userId = Integer.parseInt(id);

				String errorMsg = "";
				if (userNickname == null || pass == null || userAddress == null || userMail == null || birthday == null
						|| userTel == null) {
					errorMsg = "リクエストパラメーターエラー";
				}
				// エラーメッセージをリクエストスコープに保存
						request.setAttribute("errorMsg", errorMsg);

				// 登録するユーザーの情報を設定 /*⑫*/
				Account registerAccount = new Account(userNickname, pass, userName, userAddress, userMail, birthday, userTel);/*⑬*/

				// セッションスコープに登録ユーザーを保存 /*⑭*/
				HttpSession session = request.getSession();
				session.setAttribute("registerAccount", registerAccount);

				// フォワード /*⑮*/
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegisterEditCheck.jsp");
				dispatcher.forward(request, response);

	}

}
