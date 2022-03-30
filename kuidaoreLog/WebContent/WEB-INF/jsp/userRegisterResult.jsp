<!-- 最終更新日時0228 -->
<!-- 0228版 須佐美-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->

<!DOCTYPE html>
<html lang="ja">
<head>
<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">

<title>くいだおれログ</title>

	<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->

	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/table.css"> <!--css読み込む -->
	<link rel="stylesheet" href="css/u_reg_result.css"> <!-- ユーザー登録完了css読み込む -->
</head>

	<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body>

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
<%-- 	<jsp:include page="/WEB-INF/jsp/header.jsp" /> --%>

	 	<%@ include file="/WEB-INF/jsp/header.jsp" %>

	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なんかも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->

	<div id="footer_wrapper">


	<h2 class="h1_u_reg_result text_center">ユーザー登録完了</h2>

<div class="div_u_reg_result text_center">
	<h4 >
		 　ユーザー登録を完了しました。
	</h4>
	<br>
	<br>
	<a class="register_button" href="/kuidaoreLog/Login" title="くいだおれログ ユーザーログインへ" >ログイン画面へ</a>
</div>
</div>

<!-- フッター -->

<jsp:include page="/WEB-INF/jsp/footer.jsp" />
<!-- ↑の書き方だと一工夫しないと読み込まないっぽいので以下のように変更。。と思ったら動くわ、なんでやろ。やっぱset文かな。まぁどっちの書き方でも動くってことでメモ -->
<%--  	<%@ include file="/WEB-INF/jsp/footer.jsp" %> --%>
</body>
</html>
