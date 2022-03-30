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

<title>ログイン画面</title>

	<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->

	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/login.css"> <!-- ログインcss読み込む -->
	<link rel="stylesheet" href="css/form.css"> <!--css読み込む -->
	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">


</head>
<body>

<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body>

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
<%-- 	<jsp:include page="/WEB-INF/jsp/header.jsp" /> --%>

	 	<%@ include file="/WEB-INF/jsp/header.jsp" %>

	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なんかも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->

	<div id="footer_wrapper">

	<!-- フォーム全体の画面の固定 -->
	<div class="contact">

		<!-- <h1 class=" h1_login">ログイン</h1> -->

		<form action="/kuidaoreLog/Login" method="post">

		<table class="contact-table">
			<tbody>
			<tr>
			<th class="contact-item">
			<label>メールアドレス</label>
			</th>
			<td class="contact-body">
			<input class="form-text" type="email" name="userMail" list="data"
			maxlength="100" placeholder="example@kuidaore.com" required>
			</td>
			</tr>


		<tr>
        <th class="contact-item">
          <label>パスワード</label></th>
         <td class="contact-body">
		 <input class="form-text" type="password" name="pass"
		pattern="^[0-9a-zA-Z]{6,16}$" placeholder="半角英数6～16文字で入力" required>
        </td>
        </tr>

			</tbody>
			</table>

                <input class="contact-submit"  type="submit" value="ログイン" />
		</form>

	</div>
		</div>

			<!-- フッター -->

			<jsp:include page="/WEB-INF/jsp/footer.jsp" />
			<!-- ↑の書き方だと一工夫しないと読み込まないっぽいので以下のように変更。。と思ったら動くわ、なんでやろ。やっぱset文かな。まぁどっちの書き方でも動くってことでメモ -->
			<%--  	<%@ include file="/WEB-INF/jsp/footer.jsp" %> --%>
</body>
</html>

