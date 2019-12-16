<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test = "${errors != null}">
    <div id = "flush_error">
        入力内容にエラーがあります<br />
        <c:forEach var = "error" items = "${errors}">
            ・<c:out value = "${error}" /><br />
        </c:forEach>
    </div>
</c:if>

<label for = "report_date">日付</label><br />
<input type = "date" name = "report_date" value = "<fmt:formatDate value = '${report.report_date}' pattern = 'yyyy-MM-dd' />" />
<br /><br  />
<!-- 出勤、退勤追加 まずtextから 登録した入力値を保持したままセット 初期値の設定（１８時３０分等）-->
<label for = "attendance_time">出勤時間</label><br />
<input type = "text" name = "attendance_time_hour" value = "${report.attendance_time_hour}"/>時
<input type = "text" name = "attendance_time_minute" value = "${report.attendance_time_minute}"/>分
<br /><br  />

<label for = "clocking_out_time">退勤時間</label><br />
<input type = "text" name = "clocking_out_time_hour" value = "${report.clocking_out_time_hour}" />時
<input type = "text" name = "clocking_out_time_minute" value = "${report.clocking_out_time_minute}" />分
<br /><br  />

<label for = "name">氏名</label><br />
<c:out value = "${sessionScope.login_employee.name}" />
<br /><br  />

<label for = "title">タイトル</label><br />
<input type = "text" name = "title" value = "${report.title}" />
<br /><br  />

<label for = "content">内容</label><br />
<textarea name = "content" rows = "10" cols = "50">${report.content}</textarea>
<br /><br  />

<input type = "hidden" name = "_token" value = "${_token}" />
<button type = "submit">投稿</button>