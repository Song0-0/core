<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>게시판 목록</title>
</head>

<%
    try {
        String DriverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/board_24";
        String user = "song";
        String pwd = "rkd7410";
        ResultSet rs = null;

        Class.forName(DriverName);
        Connection conn = DriverManager.getConnection(url, user, pwd);
        out.println("DB 연결 성공");

        Statement stmt = conn.createStatement();
        String sql = "select * from board_24";
        rs = stmt.executeQuery(sql);
%>

<body>
<h1>자유 게시판 - 목록</h1>
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
        while (rs.next()) {
            out.println("<tr><td>" + rs.getString("category") + "</td>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getString("reg_name") + "</td>");
            out.println("<td>" + rs.getString("views") + "</td>");
            out.println("<td>" + rs.getString("reg_dt") + "</td></tr>");
            out.println("<td>" + rs.getString("mod_dt") + "</td></tr>");
    %>
</table>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println("DB 연결 실패");
    }
%>
</body>
</html>