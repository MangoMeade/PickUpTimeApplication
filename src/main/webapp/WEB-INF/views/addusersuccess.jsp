<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 8/7/2017
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success</title>
</head>
<body>

<h1>
    Welcome ${firstname}
</h1>
<form action="/listofsports">
    <input type="submit" value="Sports">
</form>
<form action="/listevents">
    <input type="submit" value="See Events">
</form>
</body>
</html>
