<!-- 最終更新日時0227 -->
<!-- 0227版 井川改変-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<!-- indexには不要なのでナシ -->

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
<!-- 	<link rel="stylesheet" href="css/button.css"> -->
<!-- 機能してないっぽいのでオミット -->

	<!-- <link rel="stylesheet" href="css/footer.css">
	cssはここで読まなくてもfooter側で読み込んでくれることを確認-->

	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">
	<!-- <link rel="icon" type="image/png" href="/kuidaoreLog/WebContent/images/favicon_package_v0.16/favicon-16x16.png"> -->

</head>

<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body class="text_center" >

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
<%-- 	<jsp:include page="/WEB-INF/jsp/header.jsp" /> --%>

	 	<%@ include file="/WEB-INF/jsp/header.jsp" %>

	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なんかも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->

<!-- 	<span class="bg_fullimg"></span> -->
	<div id="footer_wrapper">
		<!-- 画像 皿とナイフとフォーク -->
		<br>
		<p>
			<img class="logo_size" src="images/10.jpg" >
		</p>

		<h1 class="h1_sitetitle1">くいだおれログ</h1>

		<nav>
			<ul>
		<li><a class="index_button"  href="/kuidaoreLog/UserRegister" title="くいだおれログ 新規ユーザー登録へ">新規ユーザー登録</a></li><!--  ⑥  -->
			</ul>
			<br>
		</nav>

		<!-- メイン画像（新世界のふぐ提灯） -->

		<p>
			<img class="mainImage_size" src="images/newWorld.jpg" >
		</p>
	</div>


		<!-- フッター -->

   	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
<!-- ↑の書き方だと一工夫しないと読み込まないっぽいので以下のように変更。。と思ったら動くわ、なんでやろ。やっぱset文かな。まぁどっちの書き方でも動くってことでメモ -->
<%--  	<%@ include file="/WEB-INF/jsp/footer.jsp" %> --%>


</body>


</html>
