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
import model.MyProfileLogic;


@WebServlet("/MyProfileEdit")
public class MyProfileEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String forwardPath = null;/* ③ */

		String action = request.getParameter("action");
		if (action == null) {
			forwardPath = "/WEB-INF/jsp/userRegisterEdit.jsp";
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response); /* ④ */

		} else if (action.equals("done")) { // 登録確認画面から「登録実行」をリクエストされたときの処理
			// セッションスコープに保存された登録アカウントを取得
			HttpSession session = request.getSession();
			Account registerAccount = (Account) session.getAttribute("registerAccount");

			// 登録処理の呼び出し
			MyProfileLogic logic = new MyProfileLogic();/*⑲*/
			boolean registration = logic.execute(registerAccount);/*㉑(右辺の実行) ㉘(左辺の代入)*/

//			session.removeAttribute("registerAccont");

			// 新規登録できた場合（IDが登録済みではなかった）
			if (registration) { //㉚
				// 登録後のフォワード先を設定
				forwardPath = "/WEB-INF/jsp/userRegisterEditOK.jsp";
			} else {// 登録済みだった場合 //㉚'
//				String errorMsg = "登録済みのメールアドレスです";/**/
				// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMsg", "登録済みのメールアドレスです");
				// フォワード
				forwardPath = "/WEB-INF/jsp/userRegisterEditCheck.jsp";
			}
		}
		// 設定されたフォワード先にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
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

