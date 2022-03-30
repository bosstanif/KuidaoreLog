<!-- 最終更新日時0227 -->

<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<!-- contentType="charset=UTF-8" の重複セット(ヘッダや元のjsp側とバッティング)でエラーとなっていたのでこの部分を削除-->

<%@ page language="java"  pageEncoding="UTF-8"%>

<!-- 変数の機能定義などに必要なモデルの読み込み。ここ抜けてると変数関連エラーになるよ -->
<%@ page import="model.Account,model.Restaurant,java.util.List"%>

<!-- セッションスコープからユーザー情報を取得 -->
<%
Account loginAccount = (Account) session.getAttribute("loginAccount");
%>

<!--     footer.cssがなかったので追加0226
 -->
 <link rel="stylesheet" href="css/footer.css">

 <!-- <p>Copyright くいだおれログ制作委員会 All Rights Reserved.</p> -->
<footer class="footer page_footer_flex footer_wrapper footer_border_underline footer_bg_color"><!-- クラス指定がなかったので追加0226。footerタグで囲うべき箇所なのでfooterタグで記載 -->
					<% if(loginAccount == null){%>
					<!-- アンカータグ。ログイン前なので飛ばす先はindex.jsp。「/index.jsp」でも動くよ -->
					<!--左上部画像の読み込み。ヘッダ上部くいだおれログのロゴ -->
					<a href="/kuidaoreLog/Logout"><!-- パスミスでここが機能してない -->
					<!-- <img src="/images/headlogo.png" alt="くいだおれログ メイン画面へ" > -->
					<!--動作テスト。パスの指定間違い。先頭の「/」が要らないことを確認。 -->
					<img class=footer_img_logo src="images/headlogo.png" alt="くいだおれログ ログイン画面へ" >
					</a>

					<% }else{%><!-- ログイン後なら。。 -->
					<!-- アンカータグ。ログイン後なので飛ばす先はindex.jsp。
					「/index.jsp」でも動くよ -->
					<a href="/kuidaoreLog/Logout">
					<!--画像の読み込み-->
					<img class="footer_img_logo" src="images/headlogo.png" alt="くいだおれログ メイン画面へ" >
					</a>
					<%} %><!-- if文終わり -->
				<nav class="footer_main_nav">
					<small>&copy; 2022 teamくいだおれ</small><!-- ここ製作委員会じゃなくて正しくはteam くいだおれかな？ -->
				</nav>

</footer>



