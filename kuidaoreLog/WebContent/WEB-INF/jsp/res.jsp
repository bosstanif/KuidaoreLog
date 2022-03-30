<!-- 最終更新日時0301 -->
<!-- 井川-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--各種modelの読み込み欄 複数指定時,カンマ忘れないように。-->
<%@ page import="model.Restaurant"%>

<%
Restaurant res = (Restaurant) session.getAttribute("res");
%>


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

	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">
	<!-- <link rel="icon" type="image/png" href="/kuidaoreLog/WebContent/images/favicon_package_v0.16/favicon-16x16.png"> -->


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

	<!-- フォーム全体の画面の固定 -->
	<div class="contact_check">

	<h1 class="h1-u_reg_check text_center"><%=res.getResName()%>のページ</h1>

	<br>

	<form action="/kuidaoreLog/ReviewAllServlet" method="post">

		<table class="contact-table">


    	<tr class="text_left">
		<th class="contact-item">
		<label>店名</label>
        </th>
        <td class="contact-body">
		<b><%=res.getResName()%><br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


    	<tr class="text_left">
		<th class="contact-item">
		<label>電話番号</label>
        </th>
        <td class="contact-body">
		<b><%=res.getResTel()%><br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>

    	<tr class="text_left">
		<th class="contact-item">
	<label>住所</label>
    </th>
    <td class="contact-body">
	<b><%=res.getResAddress()%><br></b>
<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
    </td>
    </tr>


    	<tr class="text_left">
		<th class="contact-item">
		<label>営業時間</label>
        </th>
        <td class="contact-body">
		<b><%=res.getResBusinessTime()%><br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


    	<tr class="text_left">
		<th class="contact-item">
		<label>定休日</label>
        </th>
        <td class="contact-body">
		<b><%=res.getResHoliday()%><br></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>

        </table>

        <div class="text_center">
        <br>

		<input type="hidden" name="resId" value=<%= res.getResId() %>>
		<a><input class=" register_button" type="submit" value="お店の口コミ画面へ" title="お店の口コミ画面へ"></a>
			<br>
		</div>

	</form>
				<!-- フッター -->



	</div>
	</div>
	  	<jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>