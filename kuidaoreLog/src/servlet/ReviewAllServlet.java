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

import model.GetReviewListLogic;
import model.Review;

@WebServlet("/ReviewAllServlet")
public class ReviewAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String resId = (String) session.getAttribute("resId");
		int resID = Integer.parseInt(resId);
		GetReviewListLogic getReviewListLogic = new GetReviewListLogic();
		List<Review> reviewList = getReviewListLogic.findReview(resID);
		session.setAttribute("reviewList", reviewList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewAll.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String resId = request.getParameter("resId");
		int resID = Integer.parseInt(resId);
		HttpSession session = request.getSession();
		session.setAttribute("resId", resId);

		request.setCharacterEncoding("UTF-8");
		String revText = request.getParameter("revText");

		String errorMsg = "";
		if (revText == null || revText.length() == 0  ) {
			errorMsg = "";
		}

		// エラーメッセージをリクエストスコープに保存
		session.setAttribute("errorMsg", errorMsg);

		GetReviewListLogic getReviewListLogic = new GetReviewListLogic();
		List<Review> reviewList = getReviewListLogic.findReview(resID);
		session.setAttribute("reviewList", reviewList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewAll.jsp");
		dispatcher.forward(request, response);
	}

}
