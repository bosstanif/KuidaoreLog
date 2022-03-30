<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Account"%>
<%
Account registerAccount = (Account) session.getAttribute("registerAccount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
</head>
<body>
	<p>下記のユーザーを登録します</p>

	<ul>
		<li>ニックネーム：<%=registerAccount.getUserNickname()%></li>
		<li>パスワード：<%=registerAccount.getPass()%></li>
		<li>名前：<%=registerAccount.getUserName()%></li>
		<li>住所：<%=registerAccount.getUserAddress()%></li>
		<li>メールアドレス：<%=registerAccount.getUserMail()%></li>
		<li>生年月日：<%=registerAccount.getBirthday()%></li>
		<li>電話番号：<%=registerAccount.getUserTel()%></li>
		<li>プロフィール画像</li>

	</ul>
	<P>この情報で登録しますか？</P>
	<a href="/kuidaoreLog/MyProfileEdit?action=done">はい</a>
	<a href="/kuidaoreLog/MyProfileEdit">いいえ</a>

</body>
</html>