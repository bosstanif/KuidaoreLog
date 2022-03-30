<!-- 最終更新日時0227 -->
<!-- 0227版 井川改変-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<!-- userRegisterには不要なのでナシ -->

<%
String errorMsg = (String) request.getAttribute("errorMsg");
%><!-- String型のエラーメッセージ変数があったらエラーメッセージを表示する -->

<!-- ⑧ -->
<!DOCTYPE html>
<html lang="ja">

<head>
<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">

<title>新規登録</title>

	<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->
 	<link rel="stylesheet" href="css/form.css">
	<!--登録フォームの読み込み -->
<!--   	<link rel="stylesheet" href="css/Form.css"> -->
	<!-- 登録フォームの読み込み。名前変更できなかったのでとりあえず頭文字大文字の方 -->
 	<link rel="stylesheet" href="css/style.css">

	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">

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

	<h1></h1>
 	 <div class="contact">

	<h2 class="contact-ttl">新規ユーザー登録</h2>

	<form action="/kuidaoreLog/UserRegister?action=done" method="post">
		<!-- ⑨ -->



	<table class="contact-table">
    	<tr>
		<th class="contact-item">
	    <span class="Form-Item-Label-Required text_right">*必須</span>
		<label>ニックネーム</label>
        </th>
        <td class="contact-body">
		<input type="text"
  		class="form-text" name="userNickname" placeholder="大阪名物" required>
        </td>
        </tr>

        <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>パスワード</label></th>
         <td class="contact-body">
		 <input class="form-text" type="password" name="pass"
		pattern="^[0-9a-zA-Z]{6,16}$" placeholder="半角英数6～16文字で入力" required>
        </td>
        </tr>


       <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>名前</label></th>
        <td class="contact-body">
		<input class="form-text" type="text"
		name="userName" placeholder="くいだおれ　太郎" required>
		</td>
        </tr>

        <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>メールアドレス</label></th>
         <td class="contact-body">
		 <input class="form-text" type="text" name="userMail" list="emaillist"
		pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="100" placeholder="example@kuidaore.com(半角英数@ドメイン)" required>
				<datalist id="emaillist">
					<option value="@gmail.com"></option>
					<option value="@yahoo.co.jp"></option>
					<option value="@docomo.ne.jp"></option>
					<option value="@i.softbank.jp"></option>
					<option value="@ezweb.ne.jp"></option>
				</datalist>
        </td>
        </tr>


        <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>住所</label></th>
         <td class="contact-body">
		<input class="form-text" type="text" name="userAddress"
				placeholder="大阪府大阪市浪速区恵美須東１丁目１８-６" required>
        </td>
        </tr>


       <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>生年月日</label></th>
         <td class="contact-body">
		<input class="form-text" id="until-today" type="date" name="birthday"
				placeholder="1949年6月8日" required>
        </td>
        </tr>


       <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>電話番号</label></th>
         <td class="contact-body">
		<input class="form-text" type="tel" name="userTel" autofocus="autofocus"
		pattern="\d{2,4}\d{3,4}\d{3,4}" placeholder="08011112222(ハイフンなしで入力)" required>
        </td>
        </tr>

<!-- 現状必須ブロックになっているし、プロフィール画像をアップロードする形だと、
別でform作るほうが適切なので一旦コメントアウト -->
<!--         <tr>
        <th class="contact-item">
        <span class="Form-Item-Label-Required">*必須</span>
          <label>プロフィール画像</label></th>
         <td class="contact-body">
		<input class="form-text" type="url" name="avatarPath">
        </td>
        </tr> -->
                </table>

                <input class="contact-submit register_button"  type="submit" value="確認" />
            </form>
        </div>

	</div>
			<!-- フッター -->

  	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
  		<!-- 未来の日付を選べないようにするスクリプトタグ -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/until-today.js"></script>
</body>
</html>