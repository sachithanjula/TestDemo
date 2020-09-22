<%@ page import="com.mobios.models.UserLoginModel" %>
<%@ page import="com.mobios.controllers.TableController" %><%
    String actionLogin = "" + request.getParameter("action");

    if (actionLogin.equals("login"))
    {

        System.out.println("logicon");

        String userName = request.getParameter("username");
        String userPassword = request.getParameter("password");

        UserLoginModel userLoginModel = new UserLoginModel(userName, userPassword);

        int result = TableController.userLogin(userLoginModel);

        if (result > 0)
        {
            session.setAttribute("user", userName);
            response.sendRedirect("composeMessage.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp?status=failed");
        }

    }
%>