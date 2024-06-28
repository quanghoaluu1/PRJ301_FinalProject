<%-- 
    Document   : userManager
    Created on : Jun 28, 2024, 1:20:43 PM
    Author     : quang
--%>

<%@page import="java.util.List"%>
<%@page import="model.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manager</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
        <link rel="stylesheet" type="text/css" href="css/staff-css.css">
    </head>
    <body>
        <%
            UserDTO login_user = (UserDTO) session.getAttribute("login_user");
            String search = request.getParameter("search-name");
            if (search == null) {
                search = "";
            }
        %>
        <div class="bot-search-form">
            <form action="SearchUserController" method="GET">
                    <input class="input" type="text" name ="search-name" value="<%= search%>" placeholder="Search user"/>
                    <input class="btn-search-all" type="submit" name="action" value="search"/>
                </form>
            </div>
            <div class="user-form">
                <%
                    List<UserDTO> listUser = (List) request.getAttribute("user_list");
                    if (listUser != null) {
                        if (listUser.size() > 0) {
                %>

                <table border="1" class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full Name</th>
                            <th>Role ID</th>
                            <th>Password</th>

                        </tr>
                    </thead>
                    
                    <tbody>
                        <%            
                            int count = 0;
                           
                            for(UserDTO user : listUser ){
                                %>
                                <tr>
                    <form action="MainController" method="POST">
                            <td><%= count++%></td>
                            <td>
                                <input type="text" name="user-id" value="<%= user.getUser_id()%>" readonly=""/>                      
                            </td>
                            <td>
                                <input type="text" name="user-name" value="<%= user.getUser_name()%>" required=""/>
                            </td>
                            <td>

                                <select id="role" name="role">
                                    <option value="user" <%= user.getRole().equals("user") ? "selected" : ""%>>0-User</option>
                                    <option value="manager" <%= user.getRole().equals("manager") ? "selected" : ""%>>1-Manager</option>
                                    <option value="staff" <%= user.getRole().equals("staff") ? "selected" : ""%>>2-Staff</option>
                                </select>
                            </td>
                            <td>***</td>
                            <%
                                if(login_user.getRole().equals("manager")){
                            %>
                            <td>
                                <input class="btn-update" type="submit" name ="action" value="edit user"/>
                                <input class="btn-delete" type="submit" name ="action" value="delete user"/>
                            </td>
                    </form>
                            <%   
}
                            %>
                                </tr>
                   

                    <%
                        }
                    %>
                    </tbody>
                    <% }
                    }%>

                </table>
                    <a href="staff.jsp">Back to staff page</a>
            </div>
    </body>
</html>
