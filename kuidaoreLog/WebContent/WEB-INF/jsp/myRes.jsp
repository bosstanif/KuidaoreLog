<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Restaurant"%>
//リクエストスコープに保存されたレストラン情報
<%
**** **** = (****) session.getAttribute("****");入力お願いします
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>レストラン登録情報</title>
</head>
<body>
	<h1>レストラン登録情報</h1>
	<p>
	<ul>
		<li>店名 ：<%店名入れる()%></li>
		<li>フリガナ ：<%フリガナ入れる()%></li>
		<li>電話番号 ：<%電話番号入れる%></li>
		<li>郵便番号 ：<%郵便番号入れる%></li>
		<li>住所 ：<%住所入れる%></li>
		<li>地図 URL ：<%地図URL入れる%></li>
		<li>営業時間 ：<%営業時間入れる%></li>
		<li>定休日 ：<%定休日入れる%></li>
		<li>写真 ：写真入れる</li>
		<li>メニュー ：メニュー入れる</li>
		<li>コースメニュー ：コースメニュー入れる</li>
		<li>コース価格 ：コース価格入れる</li>
		<li>座席 ：<%座席数入れる%></li>

	</ul>
	</p>
		<a href="/kuidaoreLog/ResRegister">[登録情報の編集]</a><br>
	<a href="/kuidaoreLog/MyPage"><u>マイページへ戻る</u></a>
</body>
</html>