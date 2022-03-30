package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterRestaurantLogic;
import model.Reserve;
import model.Restaurant;

@WebServlet("/ResRegister")
public class ResRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String forwardPath = null;
		// サーブレットクラスの動作を決定する「action」の値を
		// リクエストパラメータから取得
		String action = request.getParameter("action");
		if (action == null) {
			forwardPath = "/WEB-INF/jsp/resRegister.jsp";
			// フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response);

			// 登録確認画面から「登録実行」をリクエストされたときの処理
		} else if (action.equals("done")) { //⑱

			//セッションスコープ
			HttpSession session = request.getSession();
			Restaurant registerRes = (Restaurant) session.getAttribute("registerRes");

			//登録処理の呼び出し
			RegisterRestaurantLogic logic = new RegisterRestaurantLogic(); ///⑲
			boolean registration = logic.execute(registerRes); //㉑(右辺の実行) ㉘(左辺の代入)

			//			session.removeAttribute("registerRes");

			// 新規登録できた場合（IDが登録済みではなかった）
			if (registration) { //㉚
				session.setAttribute("res", registerRes);
				// 登録後のフォワード先を設定
				forwardPath = "/WEB-INF/jsp/resRegisterResult.jsp";
			} else {// 登録済みだった場合 //㉚'
				// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMsg", "登録済みのお店です");
				// フォワード
				forwardPath = "/WEB-INF/jsp/resRegisterCheck.jsp";
			}
		}
		// 設定されたフォワード先にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String resName = request.getParameter("resName");
		String resTel = request.getParameter("resTel");
		String resAddress = request.getParameter("resAddress");
		/*date*/String resBussinessTimeStart = request.getParameter("resBussinessTimeStart");
		String resBussinessTimeEnd = request.getParameter("resBussinessTimeEnd");

		String[] resHolidayList = request.getParameterValues("resHoliday");
		String resHoliday1 ="";
		if (resHolidayList == null) {
			resHoliday1 = "年中無休";
			session.setAttribute("resHoliday1", resHoliday1);

		}else {

		String workstr = "";
		for (String hol : resHolidayList) {
			workstr += (hol + " ");
		}
		// 曜日の登録情報を設定
		Reserve reserveList = new Reserve(resHolidayList);

		// セッションスコープに曜日の登録を保存

		session.setAttribute("reserveList", reserveList);

		//		//resTELも追加する
		String errorMsg = "";
		//		if (resName == null   || resAddress == null
		//				 || resBussinessTime  == null|| resHoliday == null ) {
		//			errorMsg = "リクエストパラメーターエラー";
		//		}
		// エラーメッセージをリクエストスコープに保存
		request.setAttribute("errorMsg", errorMsg);

		// 登録するレストランの情報を設定 /*⑫
		Restaurant registerRes = new Restaurant(resName, resAddress,
				resTel, resBussinessTimeStart + "～" + resBussinessTimeEnd, workstr); //⑬

		// セッションスコープに登録ユーザーを保存 /*⑭
		//HttpSession session = request.getSession();
		session.setAttribute("registerRes", registerRes);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/resRegisterCheck.jsp");
		dispatcher.forward(request, response);

	}
	}
}
