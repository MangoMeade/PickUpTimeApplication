<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/7/2017
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<form method ="post" action="/addusersuccess">
    First Name: <input type = "text" name = "firstName" id="firstname" required>
    Last Name: <input type = "text" name = "lastName" id="lastname" required>
    Email: <input type = "text" name = "email" id="email" required>
    Phone Number: <input type = "text" name = "phoneNumber" id="phonenum" required>
    Gender: <input type = "text" name = "gender" id="gender">
    Username: <input type = "text" name = "userName" id="username" required>
    <br>
    Password: <input type = "password" name = "password" id="password" required>
    <br>
    <input type="submit" value = "Register">
</form>
</body>
</html>
