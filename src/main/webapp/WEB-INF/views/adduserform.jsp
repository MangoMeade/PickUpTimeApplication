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
    <%--<script>--%>
    <%--function checkInput() {--%>
    <%--var email = document.getElementById('email').value;--%>
    <%--var phoneNumber = document.getElementById('phonenum').value;--%>
    <%--var userName = document.getElementById('username').value;--%>
    <%--var password = document.getElementById('password').value;--%>
    <%--var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;--%>
    <%--var phoneno = /^\d{10}$/;--%>

    <%--if(password.length<5){--%>
    <%--alert("Password must contain more than 5 characters");--%>
    <%--return false;--%>
    <%--}--%>
    <%--if(userName.length<5){--%>
    <%--alert("Username must contain 5 or more characters");--%>
    <%--return false;--%>
    <%--}--%>
    <%--else {--%>
    <%--return true;--%>
    <%--}--%>
    <%--if(!password.contains("1234567890")){--%>
    <%--alert("Password must have at least 1 integer");--%>
    <%--return false;--%>
    <%--}--%>
    <%--else {--%>
    <%--return true;--%>
    <%--}--%>
    <%--if (email.value.match(mailformat)) {--%>
    <%--return true;--%>
    <%--}--%>
    <%--else {--%>
    <%--alert("You have entered an invalid email address!");--%>
    <%--email.focus();--%>
    <%--return false;--%>
    <%--}--%>
    <%--if((phoneNumber.value.match(phoneno))) {--%>
    <%--return true;--%>
    <%--}--%>
    <%--else--%>
    <%--{--%>
    <%--alert("Invalid phone number");--%>
    <%--return false;--%>
    <%--}--%>
    <%--}--%>
    <%--</script>--%>
</head>
<body>
<form method="post" action="/addusersuccess"
<%--onsubmit="return checkInput()--%>">

First Name: <input type="text" name="firstName" id="firstname" required>
Last Name: <input type="text" name="lastName" id="lastname" required>
Email: <input type="email" name="email" id="email" required>
Phone Number: <input type="tel" name="phoneNumber" id="phonenum" minlength="10" maxlength="11" required>
Gender: <input type="text" name="gender" id="gender">
Age: <input type="">
Username:<input type="text" name="userName" id="username" minlength="5" required>
<br>
Password: <input type="password" name="password" id="password" minlength="5" required>

First Name: <input type="text" name="firstName" id="firstname" required><br>
Last Name: <input type="text" name="lastName" id="lastname" required><br>
Email: <input type="email" name="email" id="email" required><br>
Phone Number: <input type="tel" name="phoneNumber" id="phonenum" minlength="10" maxlength="11" required><br>
Gender: <input type="text" name="gender" id="gender"><br>
Age: <input type="int" name="age" id="age" minlength="1"><br>
Username: <input type="text" name="userName" id="username" minlength="5" required><br>

Password: <input type="password" name="password" id="password" minlength="5" required><br>

<br>
<input type="submit" value="Register">
</form>
</body>
</html>
