<%-- 
    Document   : headerUser
    Created on : 4 Jul 2024, 15:37:16
    Author     : olymp
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <img src="images/logo.png" class="logo" alt="Logo"> 
            <ul>
                <li><a href="index.html">Trang chủ</a></li>
                    <c:if test="${sessionScope['LOGIN_USER']!=null}">
                    <li><a href="#">Xin chào, ${sessionScope['LOGIN_USER'].username}</a></li>
                    <li><a href="logout">Đăng xuất</a></li>
                    </c:if>
                    <c:if test="${sessionScope['LOGIN_USER']==null}">
                    <li><a href="login">Đăng nhập</a></li>
                    </c:if>
            </ul>
        </header>
    </body>
</html>
