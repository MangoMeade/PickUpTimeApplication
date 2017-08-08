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
<form method="post" action="/addusersuccess"<%--onsubmit="return checkInput()--%>">

    First Name: <input type = "text" name = "firstName" id="firstname" required><br>
    Last Name: <input type = "text" name = "lastName" id="lastname" required><br>
    Email: <input type = "email" name = "email" id="email" required><br>
    Phone Number: <input type="tel" name="phoneNumber" id="phonenum" min="10" max="11" required><br>
    Gender: <input type = "text" name = "gender" id="gender"><br>
    Age: <input type="int" name="age" id="age" min="1"><br>
    Username: <input type = "text" name = "userName" id="username" min="5"  required><br>

    Password: <input type = "password" name = "password" id="password" min="5" required><br>
    <br>
    <input type="submit" value = "Register">
</form>
</body>
</html>
