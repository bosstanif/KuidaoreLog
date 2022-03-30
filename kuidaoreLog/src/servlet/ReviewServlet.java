//13章p404参考
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

import model.Account;
import model.Cross;
import model.GetRestaurantLogic;
import model.GetReviewListLogic;
import model.PostCrossLogic;
import model.PostReviewListLogic;
import model.Restaurant;
import model.Review;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet { /*①*/
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {/*②*/

		String forwardPath = null;
		// サーブレットクラスの動作を決定する「action」の値を
		// リクエストパラメータから取得
		String action = request.getParameter("action");

		if (action == null) {
			forwardPath = "/WEB-INF/jsp/reviewTweet.jsp";
			// フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response);

			// 投稿確認画面から「投稿実行」をリクエストされたときの処理
		} else if (action.equals("done")) { //⑱
			HttpSession session = request.getSession();
			Review postReview = (Review) session.getAttribute("postReview");


			System.out.println("postReview.getRevId()=" + postReview.getRevId());


			// 投稿処理の呼び出し
			PostReviewListLogic postReviewListLogic = new PostReviewListLogic();
			//			List<Review> reviewList = postReviewListLogic.execute(postReview);
			boolean result = postReviewListLogic.execute(postReview);

			if (result) {//投稿できた場合
				String resId = (String) session.getAttribute("resId");

				Account loginAccount = (Account) session.getAttribute("loginAccount");
				session.setAttribute("postReview", postReview);

				//レビューリストを取得してリクエストスコープに保存
				GetReviewListLogic getReviewListLogic = new GetReviewListLogic();/*③*/
				List<Review> reviewList = getReviewListLogic.findAll(postReview);/*⑤右辺実行　⑪左辺の代入*/
				session.setAttribute("reviewList", reviewList);

				Review rev = getReviewListLogic.find();

				GetRestaurantLogic getRestaurantLogic = new GetRestaurantLogic();/*③*/
				List<Restaurant> resList = getRestaurantLogic.findByAll();
				session.setAttribute("resList", resList);

				Integer userId = (Integer) loginAccount.getUserId();
				Integer restaurantId = Integer.parseInt(resId);
				Integer reviewId = rev.getRevId();

				Cross cross = new Cross(userId, restaurantId, reviewId);
				PostCrossLogic postCrossLogic = new PostCrossLogic();
				boolean check = postCrossLogic.execute(cross);
				if (check) {
					System.out.println("クロステーブルに登録完了");
				} else {
					System.out.println("クロステーブルに登録失敗");
				}

				System.out.println(loginAccount.getUserId());

				System.out.println(resId);

				System.out.println(rev.getRevId());

				// 投稿のフォワード先を設定
				forwardPath = "/WEB-INF/jsp/reviewOK.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
				dispatcher.forward(request, response);

			} else {// 投稿済みだった場合 //?'
				//				String errorMsg = "投稿済みです";
				// エラーメッセージをリクエストスコープに保存
				request.setAttribute("errorMsg", "登録済みです");
				// フォワード
				forwardPath = "/WEB-INF/jsp/reviewCheck.jsp";
			}
		}
		// 設定されたフォワード先にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	//		request.setCharacterEncoding("UTF-8");
	//			HttpSession session = request.getSession();
	//				Review postReview = (Review) session.getAttribute("postReview");
	//				Account loginAccount = (Account) session.getAttribute("loginAccount");
	//
	//
	//
	//		//ログインしているか確認
	//		//セッションスコープからユーザー情報を取得
	//		HttpSession session = request.getSession();
	//		Account loginAccount = (Account) session.getAttribute("loginAccount");
	//
	//		if (loginAccount == null) {//ログインしていない
	//			//リダイレクト
	//			response.sendRedirect("/kuidaoreLog/");
	//		} else {//ログイン済み
	//				//フォワード
	//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewTweet.jsp");
	//			dispatcher.forward(request, response);
	//		}
	//	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String revTitle = request.getParameter("revTitle");
		String revText = request.getParameter("revText");
		double strStar = Double.parseDouble(request.getParameter("star"));
		HttpSession session = request.getSession();

		String errorMsg = "";
		if (revText == null || revText.length() == 0) {
			errorMsg = "";
		}

		// エラーメッセージをリクエストスコープに保存
				session.setAttribute("errorMsg", errorMsg);

				//レビューをレビューリストに追加
				Review postReview = new Review(revTitle, revText, strStar);

//				// 保存
//				PostReviewListLogic postReviewListLogic = new PostReviewListLogic();
//				boolean ret = postReviewListLogic.execute(postReview);
		//
//				String resId = (String) session.getAttribute("resId");
		//
//				Account loginAccount = (Account) session.getAttribute("loginAccount");
				session.setAttribute("postReview", postReview);

//				//レビューリストを取得してリクエストスコープに保存
//				GetReviewListLogic getReviewListLogic = new GetReviewListLogic();/*③*/
//				List<Review> reviewList = getReviewListLogic.findAll(postReview);/*⑤右辺実行　⑪左辺の代入*/
//				session.setAttribute("reviewList", reviewList);
		//
//				Review rev = getReviewListLogic.find();
		//
//				GetRestaurantLogic getRestaurantLogic = new GetRestaurantLogic();/*③*/
//				List<Restaurant> resList = getRestaurantLogic.findByAll();
//				session.setAttribute("resList", resList);
		//
//				Integer userId = (Integer) loginAccount.getUserId();
//				Integer restaurantId = Integer.parseInt(resId);
//				Integer reviewId = rev.getRevId();
		//
//				Cross cross = new Cross(userId, restaurantId, reviewId);
//				PostCrossLogic postCrossLogic = new PostCrossLogic();
//				boolean check = postCrossLogic.execute(cross);
//				if (check) {
//					System.out.println("クロステーブルに登録完了");
//				} else {
//					System.out.println("クロステーブルに登録失敗");
//				}
		//
//				System.out.println(loginAccount.getUserId());
		//
//				System.out.println(resId);
		//
//				System.out.println(rev.getRevId());

				// 設定されたフォワード先にフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewCheck.jsp");
				dispatcher.forward(request, response);

			}
		}