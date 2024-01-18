<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.study.dao.BoardDAO" %>
<%@ page import="com.study.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<BoardDTO> list = BoardDAO.getDao().list();
%>

<html>

<head>
    <title>게시판 목록</title>
</head>

<body>

<h3>자유 게시판 - 목록</h3>
<table border="1">
    <tr>
        <th>카테고리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록 일시</th>
        <th>수정 일시</th>
    </tr>

    <%
        for (BoardDTO e : list) {
    %>
    <tr>
        <td><%=e.getCategory()%>
        </td>
        <td><%=e.getTitle()%>
        </td>
        <td><%=e.getRegName()%>
        </td>
        <td><%=e.getViews()%>
        </td>
        <td><%=e.getRegDt()%>
        </td>
        <td><%=e.getModDt()%>
        </td>
    </tr>
    <%
        } %>

    <tr>
        <th colspan="6">
        <input type="button" value="등록" onclick="">
        </th>
    </tr>

</table>
</body>
</html>