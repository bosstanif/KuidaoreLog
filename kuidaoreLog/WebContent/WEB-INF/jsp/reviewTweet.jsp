<!--確認画面  -->
<!-- 最終更新日時0301 -->
<!-- 0227版 井川改変-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<%@ page import="model.Restaurant"%>
<%@ page import="model.Account"%>

<%
String errorMsg = (String) request.getAttribute("errorMsg");

%>
<%
Account loginAccount = (Account) session.getAttribute("loginAccount");
Restaurant res = (Restaurant) session.getAttribute("res");
%>

<!DOCTYPE html>
<html lang="ja">

<head>
<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">


	<title>口コミ投稿</title>

	<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->

	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/table.css"> <!--css読み込む -->
	<link rel="stylesheet" href="css/u_reg_check.css"> <!-- css読み込む -->

	<link href="jquery.rateyo.min.css" rel="stylesheet" type="text/css">

	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=1.7.1'></script>
	<script src="jquery.rateyo.min.js"></script>

	<!-- この星のcssに関してはここに直接貼らないと読み込めない時がある -->
 <style type="text/css">
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
      font-size: 4rem;
      padding: 1rem;
    }

    .rating__input:hover ~ .rating__label {
      color: lightgray;
    }

    .rating__input:checked ~ .rating__label {
      color: #ffbb00;
    }
  </style>

	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">
	<!-- <link rel="icon" type="image/png" href="/kuidaoreLog/WebContent/images/favicon_package_v0.16/favicon-16x16.png"> -->

</head>

<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body>

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
<%-- <%@ include file="/WEB-INF/jsp/header.jsp" %>--%>


	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なん5かも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->

	<div id="footer_wrapper">


	<!-- フォーム全体の画面の固定 -->
	<div class="contact">

	<h1 class="h1-u_reg_check text_center"><%=loginAccount.getUserNickname()%> さんの口コミ投稿</h1>

	<br>

	<form action="/kuidaoreLog/ReviewServlet" method="post">

		<table class="contact-table">

    	<tr class="text_left">
		<th class="contact-item">
		<div class="text_center">
	    <span class="Form-Item-Label-Required text_min50">*必須</span>
	    </div>
		　　<label class="text_center">タイトル</label>
        </th>
        <td class="contact-body">
		<b><input class="form-text" type="text" name="revTitle" title="題名を入力" required><br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


    	<tr class="text_left">
		<th class="contact-item">
		<div class="text_center">
	    <span class="Form-Item-Label-Required text_min50">*必須</span>
	    </div>
		　　<label class="text_center">入力内容</label>
        </th>
        <td class="contact-body">
		<b>
		<textarea class="form-text" name="revText" placeholder="口コミを入力して下さい。(200文字まで)" cols="200" rows="7" title="お店の口コミを入力" required></textarea>
<br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


    	<tr class="text_left">
		<th class="contact-item">
		<div class="text_center">
	    <span class="Form-Item-Label-Required text_min50">*必須</span>
	    </div>
		　　<label class="text_center" title="お店の評価を★1～５で選択">★評価</label>

        </th>
        <td class="contact-body">
		<b>
		<span class="rating">
			  <input class="rating__input hidden--visually" type="radio" id="5-star" name="star" value="5" required />
			  <label class="rating__label" for="5-star" title="星5つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星5つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="4-star" name="star" value="4" />
			  <label class="rating__label" for="4-star" title="星4つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星4つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="3-star" name="star" value="3" />
			  <label class="rating__label" for="3-star" title="星3つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星3つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="2-star" name="star" value="2" />
			  <label class="rating__label" for="2-star" title="星2つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星2つ</span></label>
			  <input class="rating__input hidden--visually" type="radio" id="1-star" name="star" value="1" />
			  <label class="rating__label" for="1-star" title="星1つ"><span class="rating__icon" aria-hidden="true"></span><span class="hidden--visually">星1つ</span></label>
		</span>
		<br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


		</table>
		<div class="text_center">
		<input class="register_button " type="submit" value="確認"><br><br>
			</div>

	</form>

	<div class="text_center">
	<a class="register_button" href="/kuidaoreLog/ReviewAllServlet" title="お店の口コミ閲覧ページに戻る">口コミ閲覧ページへ戻る</a>
	</div>

	</div>
	</div>
<!-- フッター -->


  	<jsp:include page="/WEB-INF/jsp/footer.jsp" />

</body>
</html>