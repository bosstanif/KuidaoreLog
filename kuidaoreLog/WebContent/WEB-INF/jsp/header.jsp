<!-- 最終更新日時0227 -->

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%> --%>
<!-- footerと同様、元sjp側でsetしてるしここなくても機能することは確認した-->

<%@ page language="java" pageEncoding="UTF-8"%>

<!-- 変数の機能定義などに必要なモデルの読み込み。ここ抜けてると変数関連エラーになる-->
<%@ page import="model.Account,model.Restaurant,java.util.List"%>


<!-- セッションスコープからユーザー情報を取得 -->
<%
Account loginAccount = (Account) session.getAttribute("loginAccount");
%>
 <link rel="stylesheet" href="css/header.css">

<!-- ブラウザの戻るボタンを禁止する-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
    history.pushState(null, null, null);
    $(window).on("popstate", function(){
        history.pushState(null, null, null);
    });
});
</script>

<header class="page_header_flex header_wrapper header_border_underline header_bg_color" ><!--ラッパークラスを追加-->
 <% if(loginAccount == null){%>
 <a href="/kuidaoreLog/Logout">
 <!-- アンカータグ。ログイン前なので飛ばす先はindex.jsp。「/index.jsp」でも動く -->
 <!--左上部画像の読み込み。ヘッダ上部くいだおれログのロゴ -->
 <img class=header_img_logo src="images/headlogo.png" alt="くいだおれログ ログイン画面へ" >
 </a>

 <% }else{%><!-- ログイン後なら -->
 <!-- アンカータグ。ログイン後なので飛ばす先はindex.jsp。
 「/index.jsp」でも動く -->
 <a href="/kuidaoreLog/Logout">
 <!--画像の読み込み-->
 <img class="header_img_logo" src="images/headlogo.png" alt="くいだおれログ メイン画面へ" >
 </a>
 <%} %><!-- if文終わり -->

 <nav>
 <!-- ヘッダー右上部のメインナビゲーションバーだよ -->
 <ul class="header_main_nav">
 <!-- アンカータグで飛ぶ先を指定するよ -->
 <!-- その前に、スクリプト式でログイン済みかどうかを判定する -->
 <!-- ログイン前なら -->
 <!-- keyとなる"loginAccount"は持っていないので -->
 <% if(loginAccount == null){%>
 <!-- 本来Stringで受け取っているなら下の式(ｺﾒ内の赤下線は無視)だが、@pageで指定していて、 -->
 <!-- スクリプトレット内なので変数直接読み込めるから↑の書き方で正解。 -->
 <%--<% if(loginAccount.equals("")){%> --%>
 <!-- ここから下がtrue時のhtml側の実行メソッド -->
 <li><a href="/kuidaoreLog/Login">
 <span class="header_span_item1">ユーザーログイン</span></a></li>

 <% }else{%>

 <!-- ここから下がfalse時（ログインされてると判定)のhtml側の実行メソッド -->
 <li><a href="/kuidaoreLog/MainServlet">レストラン一覧　</a></li>
 <li><a href="/kuidaoreLog/MyPageServlet"><%=loginAccount.getUserNickname()%>さんのマイページ　</a></li>
 <li><a href="/kuidaoreLog/Logout">ログアウト　</a></li>
 <%} %><!-- if文終わり -->
 </ul>
 </nav>
</header>
