<!-- 最終更新日時0301 -->
<!-- 井川-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<%@ page import="model.Account,model.Review,java.util.List"%>
<%@ page import="model.Restaurant"%>

<%
Restaurant res = (Restaurant) session.getAttribute("res");
%>

<%
Account registerAccount = (Account) session.getAttribute("registerAccount");
List<Review> reviewList = (List<Review>) session.getAttribute("reviewList");
Review postReview = (Review) session.getAttribute("postReview");
String errorMsg = (String) session.getAttribute("errorMsg");
%>

<!DOCTYPE html>
<html lang="ja">


<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">

	<title>口コミ投稿確認</title>
	<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->
	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/table.css"> <!--css読み込む -->
	<link rel="stylesheet" href="css/u_reg_result.css"> <!-- ユーザー登録完了css読み込む -->
		<!--ファビコンの読み込み。-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">


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
      color: #ffbb00;
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


    .rating__5 {
      content: "★★★★★";
      color: #ffbb00;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
      font-size: 4rem;
      padding: 1rem;
    }

    .rating__4 {
      content: "★★★★";
      color: #ffbb00;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
      font-size: 4rem;
      padding: 1rem;
    }

    .rating__3 {
      content: "★★★";
      color: #ffbb00;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
      font-size: 4rem;
      padding: 1rem;
    }


    .rating__2 {
      content: "★★";
      color: #ffbb00;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
      font-size: 4rem;
      padding: 1rem;
    }


    .rating__1 {
      content: "★";
      color: #ffbb00;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
      font-size: 4rem;
      padding: 1rem;
    }

    .rating__nolabel {/*これが何も選択されていない時の星の色*/
      cursor: pointer;
      color: gray;
      padding-left: 0.25rem;
      padding-right: 0.25rem;
    }


  </style>


	</head>

<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body>

<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
	<jsp:include page="/WEB-INF/jsp/header.jsp" />

<%-- <%@ include file="/WEB-INF/jsp/header.jsp" %>--%>

	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なんかも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->

	<div id="footer_wrapper">

	<% %>


	<%
	if (errorMsg == null || errorMsg.length() == 0 || reviewList!=null) {
	%>

	<!-- フォーム全体の画面の固定 -->
	<div class="contact_check2">

	<h1 class="h1-u_reg_check text_center"><%=res.getResName()%><br>口コミ閲覧ページ</h1>

	<br>
		<div class="text_center">
		<br><br>
	<a class="register_button margin_20px_right" href="/kuidaoreLog/ReviewServlet" title="口コミ投稿へ">口コミ投稿</a>
	<br>
	<br>
	</div>

	<%
	for (int i = 0; i < reviewList.size(); i++) {
	%>

<form>
	<table class="contact-table">

	<tr class="text_left">
	<th class="contact-item">
	<label>タイトル</label>
    </th>
    <td class="contact-body">
	<b><%=reviewList.get(i).getRevTitle()%><br></b>
	<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
    </td>
    </tr>

	<tr class="text_left">
	<th class="contact-item">
	<label>口コミ内容</label>
    </th>
    <td class="contact-body">
	<b><%=reviewList.get(i).getRevText()%><br></b>
	<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
    </td>
    </tr>

	<tr class="text_left">
	<th class="contact-item">
	<label>評価</label>
    </th>
    <td class="contact-body">

<span class="rating">
		<%if( postReview.getStar() == 5.0){
		%>
  <label class="rating__5" title="星5つ">★★★★★</label>
		<% }else if(postReview.getStar() == 4.0){
		%><!-- 4.0なら -->
 <label class="rating__4" title="星4つ">★★★★<span class="rating__nolabel">★</span></label>
	<% }else if(postReview.getStar() == 3.0){%><!-- 3.0なら -->
 <label class="rating__3" title="星3つ">★★★<span class="rating__nolabel">★★</span></label>
	<% }else if(postReview.getStar() == 2.0){%><!-- 2.0なら -->
 <label class="rating__2" title="星2つ">★★<span class="rating__nolabel">★★★</span></label>
	<% }else if(postReview.getStar() == 1.0){%><!-- 1.0なら -->
 <label class="rating__1" title="星1つ">★<span class="rating__nolabel">★★★★</span></label>
	<%} %><!-- if文終わり -->
</span>

	<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
    </td>
    </tr>

</table>

	<input type="hidden"
	name="resId" value=<%=reviewList.get(i).getRevId()%>>

</form>


	<%
	}
	%>

	</div>
	<%
	}
	%>
	</div>
<!-- フッター -->
<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>