<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorMsg = (String) request.getAttribute("errorMsg");
%>
<!-- ⑧ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
</head>
<body>
	<p>新規ユーザー登録</p>
	<form action="/kuidaoreLog/MyProfileEdit?action=done" method="post">
		<!-- ⑨ -->
		<ul>
			<li>ニックネーム ：<input type="text" name="userNickname" placeholder="大阪名物"
				required></li>
			<li>パスワード ：<input type="password" name="pass"
				pattern="^[0-9a-zA-Z]{6,16}$" placeholder="半角英数6～16文字で入力" required></li>
			<li>名前 ：<input type="text" name="userName" placeholder="くいだおれ　太郎"
				required></li>
			<li>住所 ：<input type="text" name="userAddress"
				placeholder="大阪府大阪市浪速区恵美須東１丁目１８-６" required></li>
			<li>メールアドレス ：<input type="text" name="userMail" list="emaillist"
				maxlength="100" placeholder="example@kuidaore.com" required>
				<datalist id="emaillist">
					<option value="info@gmail.com"></option>
					<option value="info@yahoo.co.jp"></option>
					<option value="info@docomo.ne.jp"></option>
					<option value="info@i.softbank.jp"></option>
					<option value="info@ezweb.ne.jp"></option>
				</datalist></li>
			<li>生年月日 ：<input type="date" name="birthday"
				placeholder="1949年6月8日" required></li>
			<li>電話番号 ：<input type="tel" name="userTel" autofocus="autofocus"
				placeholder="08011112222" required></li>
			<li>プロフィール画像：<input type="相談して入れる" name="avatarPath"></li>
		</ul>
		<input type="submit" value="確認">
	</form>
	<p>
		<a href="/kuidaoreLog/index.jsp">ホーム画面へ</a>
	</p>
</body>
</html>

