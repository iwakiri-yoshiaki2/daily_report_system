<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:import url = "/WEB-INF/views/layout/app.jsp">
    <c:param name = "content">
        <c:choose>
            <c:when test = "${report != null}">
            <h2>日報 詳細ページ</h2>

            <table>
                <tbody>
                    <tr>
                        <th>氏名</th>
                        <td><c:out value = "${report.employee.name}" /></td>
                    </tr>
                    <tr>
                        <th>日付</th>
                        <td><fmt:formatDate value = "${report.report_date}" /></td>
                    </tr>
                    <!-- 新規修正箇所 -->
                    <tr>
                        <th>出勤時間</th>
                        <td>${report.attendance_time_hour}時${report.attendance_time_minute}分</td>
                    </tr>
                    <tr>
                        <th>退勤時間</th>
                        <td>${report.clocking_out_time_hour}時${report.clocking_out_time_minute}分</td>
                    </tr>
                    <!-- 新規修正箇所 -->
                    <tr>
                        <th>内容</th>
                        <td>
                            <pre><c:out value = "${report.content}" /></pre>
                        </td>
                    </tr>
                    <tr>
                        <th>登録日時</th>
                        <td><fmt:formatDate value = "${report.created_at}" /></td>
                    </tr>
                    <tr>
                        <th>更新日時</th>
                        <td><fmt:formatDate value = "${report.updated_at}" /></td>
                    </tr>
                </tbody>
            </table>

            <c:if test = "${sessionScope.login_employee.id == report.employee.id}">
                <p><a href = "<c:url value = '/reports/edit?id=${report.id}' />">この日報を編集する</a></p>
            </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href = "<c:url value = '/reports/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>