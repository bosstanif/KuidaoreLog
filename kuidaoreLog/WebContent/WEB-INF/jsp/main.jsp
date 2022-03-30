<!-- 最終更新日時0228 -->
<!-- 0227版 井川改変-->
<!--ここはjspテンプレ。インクルードでひとまとめにすることもできるが、チーム全員の構造理解が煩雑になりすぎるので今回は見送り-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Account,model.Restaurant,java.util.List"%>
<%
//セッションスコープからユーザー情報を取得
Account loginAccount = (Account) session.getAttribute("loginAccount");
List<Restaurant> resList = (List<Restaurant>) session.getAttribute("resList");
String errorMsg = (String) session.getAttribute("errorMsg");

%>
<!DOCTYPE html>
<html lang="ja">
<!-- ここから下はヘッダ。表示されない情報の部分のみ書く -->
<meta charset="UTF-8">

<title>くいだおれログ</title>
<!-- CSS読み込み-->
	<link rel="stylesheet" href="css/ress.css"><!--リセットcssの読み込み。！必須！ -->
	<link href="https:fonts.googleapis.com/css?family=Philosopher" rel="stylesheet"><!--google fontsの指定-->

	<link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="css/form.css">
	<link rel="stylesheet" href="css/table.css">


	<!--ファビコンの読み込み。include先のheader.jsp内でやろうとするとパスのせいか上手く読み込めないので、
	とりあえずこれをjsp毎のtitleタグの下に置く。
	なんか動かなくなったかも・・・なぜ-->
	<link rel="icon" type="image/png" href="images/favicon_package_v0.16/favicon-16x16.png">
	<!-- <link rel="icon" type="image/png" href="/kuidaoreLog/WebContent/images/favicon_package_v0.16/favicon-16x16.png"> -->

</head>
<!-- ここから下はボディ。そのページ独自の内容のみ書く。 -->
<body class="text_center" >

	<!-- 上部ヘッダー部分。ヘッダとは違うので注意 -->
<!-- 	複数同じモデル読み込んでるせいで重複エラー出てるので動的インクル読み込む -->
 	<jsp:include page="/WEB-INF/jsp/header.jsp" />

<%-- <%@ include file="/WEB-INF/jsp/header.jsp" %> --%>
	<!-- ↑この書き方は静的インクルード。効果は事前に読み込む。
	変数なんかも事前に読み込めるのでその辺で動的インクルードと使い分け。
	対象はjspのみでサーブレットクラスには使えない -->
		<div id="footer_wrapper">


<!-- もしログインされていたら。。 -->
	<%
	if (loginAccount != null) {
	%>
	<h1>くいだおれログ</h1>
	<br>

	<a class="index_button" href="/kuidaoreLog/ResRegister" title="レストラン登録する">新規レストラン登録</a>
	<br>
	<br>

	<!-- 	<div class="contact"></div> -->
	<!-- form実装処理 -->
	<div class="contact_check">

<!-- 	<form>ここの処理が未実装なのでコメントしていいか聞く。定休日calendarと表示される件も
	<table class="contact-table">
	<tr>
	<th class="contact-item">
		<label>search(検索)</label>
		</th>
        <td class="contact-body">
    		<input class="form-text" type="search" placeholder="検索語句を入力してください" required>
		</td>
	</table>
	</form> -->


<%-- 	<%
//	} else if (errorMsg == null || errorMsg.length() == 0 || reviewList!=null) {
//}else if(errorMsg == null || errorMsg.length() == 0 || resList!=null) {
	%> --%>

		<h2 class="h1-u_reg_check text_center">レストラン一覧表示</h2>
	<br>

	<%
		for (int i = 0; i < resList.size(); i++) {
		%>

		<form>
	<table class="contact-table">



    	<tr class="text_left">
		<th class="contact-item">
		<label>店名</label>
        </th>
        <td class="contact-body">
    	 <b><%=resList.get(i).getResName()%></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>

    	<tr class="text_left">
		<th class="contact-item">
		<label>住所</label>
        </th>
        <td class="contact-body">
    	 <b><%=resList.get(i).getResAddress()%></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>

      	<tr class="text_left">
		<th class="contact-item">
		<label>電話番号</label>
        </th>
        <td class="contact-body">
    	 <b><%=resList.get(i).getResTel()%></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


      	<tr class="text_left">
		<th class="contact-item">
		<label>営業時間</label>
        </th>
        <td class="contact-body">
    	 <b><%=resList.get(i).getResBusinessTime()%></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>


      	<tr class="text_left">
		<th class="contact-item">
		<label>定休日</label>
        </th>
        <td class="contact-body">
    	 <b><%=resList.get(i).getResHoliday()%></b>
		<!-- このgetでは持ってくるフィールド変数の頭文字を大文字にする必要あり -->
        </td>
        </tr>

	</table>


		<input class="register_button" type="hidden"
		name="resId" value=<%= resList.get(i).getResId() %>>

				 <input class="register_button" type="submit" value="お店表示"
		formaction="/kuidaoreLog/RestaurantServlet?action=done"
		formmethod="post"><br>
		</form>

		<br>
		<br>




<%
		}
		%>
		</div>
		</div>

	<%
	} else {
	%>
	<p>
		ログイン情報が正しくありません。<br> エラーに従って、再度入力して下さい。
	</p>
	<a href="/kuidaoreLog/Login">ログイン画面へ戻る</a>
	<%
	}
	%>

					<!-- フッター -->
  	<jsp:include page="/WEB-INF/jsp/footer.jsp" />

</body>
</html>