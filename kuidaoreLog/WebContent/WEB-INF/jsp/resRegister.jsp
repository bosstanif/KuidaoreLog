<!-- 最終更新日時0227 -->
<!-- 0227版 井川改変-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<!-- ここには不要なのでナシ -->
<!-- このページだけJSの都合でヘッダーのインクルード読み込みはなし -->

<!DOCTYPE html>
<html lang="ja">

<head>
<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">

<title>新規レストラン登録</title>
	<!-- CSS読み込み-->
<!--  	<link rel="stylesheet" href="css/ress.css"> -->
	<!--このページではtimeピッカーの不具合につながるのでリセットcssの読み込みはしない -->

 	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!-- google fontsの指定 -->
	 <link rel="stylesheet" href="css/form.css">

	<!--登録フォームの読み込み -->
   	<link rel="stylesheet" href="css/Form.css">
	<!-- 登録フォームの読み込み。名前変更できなかったのでとりあえず頭文字大文字の方 -->

  	<link rel="stylesheet" href="css/style.css">

	<!--ファビコンの読み込み。-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">

	<link rel="stylesheet" href="https://cdn.rawgit.com/jonthornton/jquery-timepicker/3e0b283a/jquery.timepicker.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.rawgit.com/jonthornton/jquery-timepicker/3e0b283a/jquery.timepicker.min.js"></script>

	<link rel="stylesheet" href="css/header.css">

<!-- ブラウザの戻るボタンを禁止する-->

 <script>
$(function(){
    history.pushState(null, null, null);
    $(window).on("popstate", function(){
        history.pushState(null, null, null);
    });
});
</script>

</head>

<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body>

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->

<!-- 最終更新日時0227 -->

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>
<!-- footerと同様、元sjp側でsetしてるしここなくても機能することは確認した-->


<!-- 変数の機能定義などに必要なモデルの読み込み。ここ抜けてると変数関連エラーになる-->
<%@ page import="model.Account,model.Restaurant,java.util.List"%>


<!-- セッションスコープからユーザー情報を取得 -->
<%
Account loginAccount = (Account) session.getAttribute("loginAccount");
%>



<header class="page_header_flex header_wrapper header_border_underline header_bg_color" ><!--ラッパークラスを追加-->
	<% if(loginAccount == null){%>
	<a href="/kuidaoreLog/Logout">
	<!-- アンカータグ。ログイン前なので飛ばす先はindex.jsp。「/index.jsp」でも動く -->
	<!--左上部画像の読み込み。ヘッダ上部くいだおれログのロゴ -->
	<img class=header_img_logo src="images/headlogo.png" alt="くいだおれログ ログイン画面へ" >
	</a>

	<% }else{%><!-- ログイン後なら -->
	<!-- アンカータグ。ログイン後なので飛ばす先はindex.jsp。
	「/index.jsp」でも動く -->
	<a href="/kuidaoreLog/Logout">
	<!--画像の読み込み-->
	<img class="header_img_logo" src="images/headlogo.png" alt="くいだおれログ メイン画面へ" >
	</a>
	<%} %><!-- if文終わり -->

	<nav>
	<!-- ヘッダー右上部のメインナビゲーションバーだよ -->
	<ul class="header_main_nav">
	<!-- アンカータグで飛ぶ先を指定するよ -->
	<!-- その前に、スクリプト式でログイン済みかどうかを判定する -->
	<!-- ログイン前なら -->
	<!-- keyとなる"loginAccount"は持っていないので -->
	<% if(loginAccount == null){%>
	<!-- 本来Stringで受け取っているなら下の式(ｺﾒ内の赤下線は無視)だが、@pageで指定していて、 -->
	<!-- スクリプトレット内なので変数直接読み込めるから↑の書き方で正解。 -->
	<%--<% if(loginAccount.equals("")){%> --%>
	<!-- ここから下がtrue時のhtml側の実行メソッド -->
	<li><a href="/kuidaoreLog/Login">
	<span class="header_span_item1">ユーザーログイン</span></a></li>

	<% }else{%>

	<!-- ここから下がfalse時（ログインされてると判定)のhtml側の実行メソッド -->
	<li><a href="/kuidaoreLog/MainServlet">レストラン一覧へ　</a></li>
	<li><a href="/kuidaoreLog/MyPageServlet"><%=loginAccount.getUserNickname()%>さんのマイページへ　</a></li>
	<li><a href="/kuidaoreLog/Logout">ログアウト　</a></li>
	<%} %><!-- if文終わり -->
	</ul>
	</nav>
</header>


	<!-- ここまでが上部ヘッダー -->
	<div id="footer_wrapper">

	<h1></h1>
 	 <div class="contact">

	<h2 class="contact-ttl">新規レストラン登録</h2>
	<form action="/kuidaoreLog/ResRegister?action=done" method="post">

	<table class="contact-table">

    	<tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>店名</label>
        </th>
        <td class="contact-body">
		<input type="text" size="60"
  		 name="resName" placeholder="店名 大阪名物くいだおれ" required>
        </td>
        </tr>


    	<tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>電話番号</label>
        </th>
        <td class="contact-body">
		<input type="tel" name="resTel" autofocus="autofocus"  size="60"
		 pattern="\d{2,4}\d{3,4}\d{3,4}" placeholder="060001111(ハイフンなしで入力)" required>
        </td>
        </tr>

        <tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>住所</label>
        </th>
        <td class="contact-body">
		<input type="text" name="resAddress" size="60"
				 placeholder="大阪府大阪市中央区道頓堀1丁目8-25" required>
        </td>
        </tr>


        <tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>営業時間</label>
        </th>
        <td class="contact-body">
		<input class="res_timepicker" size="22" type="text" name="resBussinessTimeStart" required/>　～　
		<input class="res_timepicker" size="22" type="text"   name="resBussinessTimeEnd" required/>
        </td>
        </tr>


        <tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>定休日</label>
        </th>
        <td class="contact-body text_left">
				<label>
				　　　<input type="checkbox" name="resHoliday" value="月">月</label>
				<label>
				<input type="checkbox" name="resHoliday" value="火">火</label>
				<label>
				<input type="checkbox" name="resHoliday" value="水">水</label>
				<label>
				<input type="checkbox" name="resHoliday" value="木">木</label>
				<label>
				<input type="checkbox" name="resHoliday" value="金">金</label>
				<label>
				<input type="checkbox" name="resHoliday" value="土">土</label>
				<label>
				<input type="checkbox" name="resHoliday" value="日">日</label>
				<label>
				<input type="checkbox" name="resHoliday" value="祝">祝</label>
				<br>※チェックを入れなければ、「年中無休」になります。
        </td>
        </tr>

    </table>
				<input class="contact-submit register_button" type="submit" value="確認" title="レストラン情報確認画面へ">
	</form>
	</div>
	</div>
				<!-- フッター -->

  	<jsp:include page="/WEB-INF/jsp/footer.jsp" />

		<input class="res_timepicker form-text" type="text" name="resBussinessTimeStart" required/>

		<input class="res_timepicker form-text"  type="text"   name="resBussinessTimeEnd" required/>


<!-- 営業時間選択 下1行追加 -->
    <script src="js/res_timepicker.js"></script>

</body>
</html>