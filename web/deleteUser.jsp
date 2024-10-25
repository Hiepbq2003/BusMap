<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <main class="main-content">
            <h1>Delete User</h1>
            <%
                String id = request.getParameter("id");
            %>
            <form action="deleteUserAction.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <p>Are you sure you want to delete this user?</p>
                <input type="submit" value="Yes">
                <a href="manageUsers.jsp">No</a>
            </form>
        </main>
    </div>
</body>
</html>
