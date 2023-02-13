<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.ZoneId"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="ja_JP" />
<%!private static Map<String, String> eventMap = new HashMap<>();
	static {
		eventMap.put("20230101", "お正月");
		eventMap.put("20221225", "クリスマス");
		eventMap.put("20221231", "大晦日");
		eventMap.put("20230121", "母の誕生日");
		eventMap.put("20230123", "特に何もない");
		eventMap.put("20230209", "デフォ値のテスト");
		eventMap.put("20230307", "自分の誕生日");
		eventMap.put("20230321", "春分の日");
		eventMap.put("20230811", "山の日");
		eventMap.put("20230817", "父の誕生日");
	}%>
<%
//リクエストのパラメーターから日付を取り出す処理
String year = (String) request.getParameter("year");
String month = (String) request.getParameter("month");
String day = (String) request.getParameter("day");
LocalDate localDate = null;
if (year == null || month == null || day == null) {
	// 日付が送信されていないので、現在時刻を元に日付の設定を行う
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	localDate = LocalDate.now(); //今日の日付を表示
	//DateTimeFormatter localeDate_s = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	localDate.format(dtf);
	year = String.valueOf(localDate.getYear());
	month = String.valueOf(localDate.getMonthValue());
	day = String.valueOf(localDate.getDayOfMonth());
} else {
	// 送信された日付を元に、LocalDateのインスタンスを生成する
	int s_year = Integer.parseInt(year);
	int s_month = Integer.parseInt(month);
	int s_day = Integer.parseInt(day);
	localDate = LocalDate.of(s_year, s_month, s_day);
}

String[] dates = { year, month, day };
//画面で利用するための日付、イベント情報を保存
request.setAttribute("dates", dates);
request.setAttribute("date", Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
String event = eventMap.get(year + month + day);
request.setAttribute("event", event);
%>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style>
ul {
	list-style: none;
}
</style>
</head>
<body>
	<form method="POST" action="/task12/calender.jsp">
		<ul>
			<%-- ここに「日付送信用のinputタグ」を追加 --%>
			<li><input type="text" name="year" value="<%=year%>" /><label
				for="year">年</label></li>
			<li><input type="text" name="month" value="<%=month%>" /><label
				for="month">月</label></li>
			<li><input type="text" name="day" value="<%=day%>" /><label
				for="day">日</label></li>
			<li><input type="submit" value="送信" /> <%-- ここに「日付と曜日、イベント名」を追加 --%>
			<li><c:out value="${fn:join(dates, '/')}" /> (<fmt:formatDate
					value="${date}" pattern="E" />)</li>
			<li><c:out value="${event}" /></li>
		</ul>
	</form>
</body>
</html>
