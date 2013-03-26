<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Share Picture By Location - Power By Google Engine -
	Group4</title>
</head>

<body>
	<h1>Welcome to share you Photos!</h1>
	<table>
		<tr>
			<td colspan="2" style="font-weight: bold;">
				<%
					UserService userService = UserServiceFactory.getUserService();
					User user = userService.getCurrentUser();
					if (user != null) {
						pageContext.setAttribute("user", user);
				%>
				<p>
					${fn:escapeXml(user.nickname)}! (You can <a
						href="<%=userService.createLogoutURL(request.getRequestURI())%>">Logout</a>.)
				</p> <%
 	} else {
 %>
				<p>
					<a href="<%=userService.createLoginURL(request.getRequestURI())%>">Login
						with google account</a>
				</p> <%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight: bold;"><a
				href="/User/Login.action">Login with Manager Account</a></td>
		</tr>
	</table>


</body>
</html>