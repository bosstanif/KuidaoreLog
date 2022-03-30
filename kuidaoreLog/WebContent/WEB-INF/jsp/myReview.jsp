<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="jquery.rateyo.min.css" rel="stylesheet" type="text/css">
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=1.7.1'></script>
<script src="jquery.rateyo.min.js"></script>
<title>口コミ投稿</title>
</head>
<body>
	<h1>口コミ投稿</h1>

	<form action="/kuidaoreLog/Review" method="post"></form>
	<ul>
		<li>タイトル：<input type="text" name="title"></li>
		<li>入力内容 ：
			<textarea name="comment" placeholder="口コミを入力して下さい。" cos="200" rows="5"></textarea></li>
		<li>★評価 　<section><style>
			  /* 動作の基本となるcss */

			  .rating {
				display: inline-flex;
				flex-direction: row-reverse;
			  }

			  .hidden--visually {
				  border: 0;
				  clip: rect(1px 1px 1px 1px);
				  clip: rect(1px, 1px, 1px, 1px);
				  height: 1px;
				  margin: -1px;
				  overflow: hidden;
				  padding: 0;
				  position: absolute;
				  width: 1px;
			  }

			  /* ここでデザインの変更 */

			  .rating__label {
				cursor: pointer;
				color: gray;
				padding-left: 0.25rem;
				padding-right: 0.25rem;
			  }

			  .rating__icon::before {
				content: "★";
				font-size: 2rem;
				padding: 0.5rem;
			  }

			  .rating__input:hover ~ .rating__label {
				color: lightgray;
			  }

			  .rating__input:checked ~ .rating__label {
				color: #ffbb00;
			  }
			</style>
		  <form action="/kuidaoreLog/Mypage" method="post">
			<div class="rating">
			  <input class="rating__input hidden--visually" type="radio" id="5-star" name="rating" value="5" required />
			  <label class="rating__label" for="5-star" title="星5つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星5つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="4-star" name="rating" value="4" />
			  <label class="rating__label" for="4-star" title="星4つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星4つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="3-star" name="rating" value="3" />
			  <label class="rating__label" for="3-star" title="星3つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星3つ/span></label>
			  <input class="rating__input hidden--visually" type="radio" id="2-star" name="rating" value="2" />
			  <label class="rating__label" for="2-star" title="星2つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星2つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="1-star" name="rating" value="1" />
			  <label class="rating__label" for="1-star" title="星1つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星1つ</span></label>
			</div></li>
		<li>投稿時間：<自動入力される></li>
	</ul>
		<input type="submit" value="確認"><br><br>

		<a href="/kuidaoreLog/ReviewServlet">[登録情報の編集]</a><br>
		<a href="/kuidaoreLog/ReviewServlet"><u>口コミ閲覧ページへ戻る</u></a>
</body>
</html>