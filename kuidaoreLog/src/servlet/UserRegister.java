//p228 コード8-5参照
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
import model.RegisterAccountLogic;

@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//フォワード初期化
		String forwardPath = null;

		// サーブレットクラスの動作を決定する「action」の値を
		// リクエストパラメータから取得
		String action = request.getParameter("action");
		if (action == null) {
			forwardPath = "/WEB-INF/jsp/userRegister.jsp";
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response);
		} else if (action.equals("done")) { // 登録確認画面から「登録実行」をリクエストされたときの処理
			// セッションスコープに保存された登録アカウントを取得
			HttpSession session = request.getSession();
			Account registerAccount = (Account) session.getAttribute("registerAccount");

			// 登録処理の呼び出し
			RegisterAccountLogic logic = new RegisterAccountLogic();
			boolean registration = logic.execute(registerAccount);

//			session.removeAttribute("registerAccont");

			// 新規登録できた場合（IDが登録済みではなかった）
			if (registration) {
				// 登録後のフォワード先を設定
				forwardPath = "/WEB-INF/jsp/userRegisterResult.jsp";
			} else {// 登録済みだった場合
				// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMsg", "登録済みのメールアドレスです");
				// フォワード
				forwardPath = "/WEB-INF/jsp/userRegisterCheck.jsp";
			}
		}

		// 設定されたフォワード先にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { /*⑪*/
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


		String errorMsg = "";
		if (userNickname == null || pass == null || userAddress == null || userMail == null || birthday == null
				|| userTel == null) {
			errorMsg = "入力項目にエラーがあります";
		}
		// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMsg", errorMsg);

		// 登録するユーザーの情報を設定
		Account registerAccount = new Account(userNickname, pass, userName, userAddress, userMail, birthday, userTel);/*⑬*/

		// セッションスコープに登録ユーザーを保存
		HttpSession session = request.getSession();
		session.setAttribute("registerAccount", registerAccount);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegisterCheck.jsp");
		dispatcher.forward(request, response);

	}

}
