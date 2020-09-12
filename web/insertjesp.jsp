<%-- 
    Document   : insertjesp
    Created on : Sep 10, 2020, 7:43:26 PM
    Author     : Jetani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<HTML>
    <head>
        <title>This is a jsp page</title>
    </head>
    <body>
        <FORM action="" method="post">
            <TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
                <TR>
                    <TH width="50%">Name</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="name"></TD>
                </tr>
                <TR>
                    <TH width="50%">Email</TH>
                    <TD width="50%"><INPUT TYPE="email" NAME="email"></TD>
                </tr>

                <TR>
                    <TH width="50%">City</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="city"></TD>
                </tr>
                <TR>
                    <TH width="50%">Phone</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="phone"></TD>
                </tr>
                <TR>
                    <TH width="50%">Department</TH>

                    <TD width="50%"><select name="department"> 
                            <OPTION value="MCA">MCA</OPTION>
                            <OPTION value="BBA">BBA</OPTION>
                            <OPTION value="B.com">B.com</OPTION>    
                        </select></TD>
                </tr>

                <TR>
                    <TH></TH>
                    <TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
                </tr>
            </TABLE>
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String city = request.getParameter("city");
                String phone = request.getParameter("phone");
                String department = request.getParameter("department");

            //("jdbc:mysql://localhost:3306/car","root","");
                String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                Connection connection = null;
                PreparedStatement pstatement = null;
                int updateQuery = 0;
                if (name != null && city != null && phone != null && email != null) {
                    if (name != "" && city != "" && phone != "" && email != "") {
                        try {
                            Class.forName("com.mysql.jdbc.Driver");

                            out.print("this is in side try ");
                            connection = DriverManager.getConnection(connectionURL, "root","");
                            out.print(connection);
                            //INSERT INTO `studenttable` (`id`, `name`, `email`, `city`, `phone`, `department`) VALUES ('1', 'kai', 'mai@sad', 'as', '1213', 'MCA');
                            String queryString = "insert into studenttable values(0,?,?,?,?,?)";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, name);
                            pstatement.setString(2, email);
                            pstatement.setString(3, city);
                            pstatement.setString(4, phone);
                            pstatement.setString(5, department);
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {%>
            <br>
            <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
                <tr><th>Data is inserted successfully in database.</th></tr>
            </table>

            <%
                            }
                        } catch (Exception ex) {
                            out.println("Unable to connect to batabase." + ex);
                        } finally {
            // close all the connections.
                            pstatement.close();
                            connection.close();
                        }
                    }
                }
            %>
        </FORM>
    </body> 
</html>