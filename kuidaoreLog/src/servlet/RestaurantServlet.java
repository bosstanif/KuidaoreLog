package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GetRestaurantLogic;
import model.Restaurant;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strResNum = request.getParameter("resNum");
		String action = request.getParameter("action");
		if (action.equals("done")) { // 登録確認画面から「登録実行」をリクエストされたときの処理
			// セッションスコープに保存された登録アカウントを取得
			HttpSession session = request.getSession();
			String resId = (String) session.getAttribute("resId");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/res.jsp");
		dispatcher.forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String resId = request.getParameter("resId");
		GetRestaurantLogic getRestaurantLogic = new GetRestaurantLogic();/*③*/
		Restaurant res = getRestaurantLogic.findBySelect(resId);

		List<Restaurant> resList = getRestaurantLogic.findByAll();

		HttpSession session = request.getSession();
		session.setAttribute("res", res);

		String action = request.getParameter("action");
		if (action == null) {
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/resRegisterResult.jsp");
			dispatcher.forward(request, response); /* ④ */
		} else if (action.equals("done")) {

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/res.jsp");
			dispatcher.forward(request, response);
		}

	}

}
