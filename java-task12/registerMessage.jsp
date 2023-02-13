<%@ page contentType="text/html; charset=UTF-8"
	import="java.net.URLEncoder"%>
<%
session.setMaxInactiveInterval(300);
String logout = (String)request.getParameter("logout");
String message = null;

if (logout != null && logout.equals("true")) {
    // セッションの破棄
    session.invalidate();
  } else {
    // GETパラメータから「メッセージ」を取り出す
    message = (String)request.getParameter("message");
    if (message != null) {
        // 「メッセージ」が送信されていたので、セッションに保存
        session.setAttribute("message", message);
      } else {
        // 「メッセージ」が送信されていなかったので、セッションからメッセージを取得
        message = (String)session.getAttribute("message");
      }
  }
	if (message == null) {
	message = "";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMessage</title>
</head>
<body>
	<form method="GET" action="/task12/registerMessage.jsp">
<%--
<df>
		<dt>メッセージ</dt>
		<dd>
			<input type="text" name="message" size="40" value="<%=message%>" />
		</dd>
		</df>
		<input type="submit" value="登録"> <a
			href="/task12/registerMessage.jsp?logout">ログアウト</a>
 --%>		
 	<ul>
      <li><label for="message">メッセージ</label><input type="text" name="message" value="<%= message %>"/></li>
      <li>
        <input type="submit" value="登録" />
        <a href="/task12/registerMessage.jsp?logout=true">ログアウト</a>
      </li>
    </ul>
	</form>
</body>
</html>