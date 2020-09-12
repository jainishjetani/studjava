<%-- 
    Document   : Index
    Created on : Sep 10, 2020, 7:54:09 PM
    Author     : Jetani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Jsp Sample</title>
    <%@page import="java.sql.*;"%>
</head>
<body>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://database-student.c6jevgf51ssc.us-east-1.rds.amazonaws.com:1521/database-student","root","root");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from student;");
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>ID</th>
             <th>NAME</th>
             <th>Email</th>
             <th>city</th>
             <th>phone</th>
             <th>department</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("city") %></td>
                <td><%=rs.getString("phone") %></td>
                <td><%=rs.getString("department") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    finally{
       // st.close();
       // con.close();
    }
    %>
</body>
</html>
