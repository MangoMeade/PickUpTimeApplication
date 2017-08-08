<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 7/21/2017
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Demo</title>
    <meta charset="utf-8"/>
    <script type="text/javascript">
    </script>
</head>
<body>

<h1>Welcome</h1>
<form action="/listevents">
    <input type="submit" value="See Events"/>
</form>
<form method="post" action="/loggedin">
    Username: <input type="text" name="username" id="username" required>
    <br>
    Password: <input type="password" name="password" id="password" required>
    <br>
    <input type="submit" value="Login">
</form>
<form action="/getNewUser">
    <input type="submit" value="Sign Up">
</form>
</body>

</html>
