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
<!-- 出勤、退勤追加 -->
<label for = "attendance_time">出勤時間</label><br />
<!--<input type = "text" name = "attendance_time_hour" value = "${report.attendance_time_hour}"/>-->
<select name = "attendance_time_hour">
    <option value = "00">00</option>
    <option value = "01">01</option>
    <option value = "02">02</option>
    <option value = "03">03</option>
    <option value = "04">04</option>
    <option value = "05">05</option>
    <option value = "06">06</option>
    <option value = "07">07</option>
    <option value = "08">08</option>
    <option value = "09" selected>09</option>
    <option value = "10">10</option>
    <option value = "11">11</option>
    <option value = "12">12</option>
    <option value = "13">13</option>
    <option value = "14">14</option>
    <option value = "15">15</option>
    <option value = "16">16</option>
    <option value = "17">17</option>
    <option value = "18">18</option>
    <option value = "19">19</option>
    <option value = "20">20</option>
    <option value = "21">21</option>
    <option value = "22">22</option>
    <option value = "23">23</option>
</select>時
<!--<input type = "text" name = "attendance_time_minute" value = "${report.attendance_time_minute}"/>-->
<select name = "attendance_time_minute">
    <option value = "00" selected>00</option>
    <!-- <option value = "05">05</option> -->
    <option value = "10">10</option>
    <!-- <option value = "15">15</option> -->
    <option value = "20">20</option>
    <!-- <option value = "25">25</option> -->
    <option value = "30">30</option>
    <!-- <option value = "35">35</option> -->
    <option value = "40">40</option>
    <!-- <option value = "45">45</option> -->
    <option value = "50">50</option>
    <!-- <option value = "55">55</option> -->
</select>分
<br /><br  />

<label for = "clocking_out_time">退勤時間</label><br />
<!-- <input type = "text" name = "clocking_out_time_hour" value = "${report.clocking_out_time_hour}" /> -->
<select name = "clocking_out_time_hour">
    <option value = "00">00</option>
    <option value = "01">01</option>
    <option value = "02">02</option>
    <option value = "03">03</option>
    <option value = "04">04</option>
    <option value = "05">05</option>
    <option value = "06">06</option>
    <option value = "07">07</option>
    <option value = "08">08</option>
    <option value = "09">09</option>
    <option value = "10">10</option>
    <option value = "11">11</option>
    <option value = "12">12</option>
    <option value = "13">13</option>
    <option value = "14">14</option>
    <option value = "15">15</option>
    <option value = "16">16</option>
    <option value = "17" selected>17</option>
    <option value = "18">18</option>
    <option value = "19">19</option>
    <option value = "20">20</option>
    <option value = "21">21</option>
    <option value = "22">22</option>
    <option value = "23">23</option>
</select>時
<!-- <input type = "text" name = "clocking_out_time_minute" value = "${report.clocking_out_time_minute}" />分 -->
<select name = "clocking_out_time_minute">
    <option value = "00" selected>00</option>
    <!-- <option value = "05">05</option> -->
    <option value = "10">10</option>
    <!-- <option value = "15">15</option> -->
    <option value = "20">20</option>
    <!-- <option value = "25">25</option> -->
    <option value = "30">30</option>
    <!-- <option value = "35">35</option> -->
    <option value = "40">40</option>
    <!-- <option value = "45">45</option> -->
    <option value = "50">50</option>
    <!-- <option value = "55">55</option> -->
</select>分
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