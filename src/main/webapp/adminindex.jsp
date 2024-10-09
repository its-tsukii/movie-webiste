<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Index Page</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }

        .loggedInUsername {
            position: fixed;
            bottom: 20px;
            right: 10px;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px 20px;
            border-radius: 200px;
        }
        #ulmovie
        {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            background-color: #f2f2f2;
        }
        #ulpricing
        {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
            background-color: #f2f2f2;
        }
        #ulurl
        {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 8px;
            background-color: #f2f2f2;
        }
        #discount
        {
            text-align: right;
        }
    </style>
</head>
<body>
<h1>ADMIN Panel !</h1>
    <h2>Customer Details :</h2>
    <table>
        <tr>
            <th>Name :</th>
            <th>Email :</th>
            <th>Password :</th>
            <th>Contact :</th>
            <th>Pet Name :</th>
        </tr>
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM ids");

            while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("Name") %></td>
                    <td><%= rs.getString("Email") %></td>
                    <td><%= rs.getString("Password") %></td>
                    <td><%= rs.getString("Contact") %></td>
                    <td><%= rs.getString("Pet Name") %></td>
                </tr>
                
        <%  }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        } %>
    </table>
    <h2>Booking Details For the Month</h2>
    <p>This Section Allows For More Precision Analysis Of The P/L Account .</p>
    <table>
        <tr>
            <th>MOVIE :</th>
            <th>AMOUNT :</th>
            <th>SLOT :</th>
        </tr>
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM tickets");

            while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("MOVIE") %></td>
                    <td><%= rs.getString("AMOUNT") %></td>
                    <td><%= rs.getString("SLOTS") %></td>
                </tr>
                
        <%  }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        } %>
    </table>
    <div class="loggedInUsername">
        <button class="btn btn-primary"><a href="login.jsp">Go To Home (User Login) !</a></button>
    </div>
    <h2>Shows The Movie Databases After Addition, Update, Or Deletion !!</h2>
    <table>
        <tr>
            <th>SrNo. :</th>
            <th>Added Movies :</th>
            <th>Price (initial Price in .rs) :</th>
            <th>Discount (in %) :</th>
            <th>Price (final Price in .rs) :</th>
            <th>Genre :</th>
            <th>year :</th>
            <th>Rating :</th>
            <th>Plot :</th>
            <th>Director :</th>
            <th>Img Url :</th>
        </tr>
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM addedmovies");

            while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("srno") %></td>
                    <td><%= rs.getString("movies") %></td>
                    <td><%= rs.getString("initialprice") %></td>
                    <td><%= rs.getString("discount") %></td>   
                    <td><%= rs.getString("finalprice") %></td>                 
                    <td><%= rs.getString("genre") %></td>
                    <td><%= rs.getString("year") %></td>
                    <td><%= rs.getString("rating") %></td>
                    <td><%= rs.getString("plot") %></td>
                    <td><%= rs.getString("director") %></td>
                    <td><%= rs.getString("url") %></td>
                </tr>     
        <%  }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        } %>
    </table>
    <form action="MovieManagementServlet" method="post">
        <table>
            <tr>
                <th>ADD Movies :</th>
                <th>ADD Pricing :</th>
                <th>ADD Url :</th>
            </tr>
            <tr>
                <td>
                    Add A Movie:<br>
                    <input name="addmovie" type="text">
                </td>
                <td>
                    Add Initial Price (in Rs):<br>
                    <input name="addinitialprice" type="text">
                </td>
                <td>
                    Add A Year:<br>
                    <input name="addyear" type="text">
                </td>
            </tr>
            <tr>
                <td>
                    Add Plot:<br>
                    <input name="addplot" type="text">
                </td>
                <td>
                    Add Final Price (in Rs):<br>
                    <input name="addfinalprice" type="text">
                </td>
                <td>
                    URL:<br>
                    <input name="addurl" type="text">
                </td>
                
            </tr>
            <tr>
                <td>
                    Add Director:<br>
                    <input name="adddirector" type="text">
                </td>
                <td>
                    Add Discount (in%):<br>
                    <input name="discount" type="text">
                </td>
                <td>
                    Add Rating:<br>
                    <input name="addrating" type="text">
                </td>
            </tr>
            <tr>
            
            <td>
                    Add Genre:<br>
                    <input name="addgenre" type="text">
                </td>
                <td>
                    Add SerialNumber :<br>
                    <input name="addsrno" type="text">
                </td>
            
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" value="Submit">
                </td>
            </tr>
            
        </table>
    </form>
    <form action="MovieManagementDeletionServlet" method="post">
        <table>
            <tr>
                <th>DELETE Movies :</th>
            </tr>
            <tr>
                <td>
                    Delete A Movie:<br>
                    <input name="deletemovie" type="text">
                </td>

            <tr>
                <td colspan="3">
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
    <h2>Customer Removal !</h2>
    <form action="CustomerManagementDeletionServlet" method="post">
        <table>
            <tr>
                <th>Delete User :</th>
            </tr>
            <tr>
                <td>
                    Delete A user:<br>
                    <input name="deleteuser" type="text">
                </td>

            <tr>
                <td colspan="3">
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
    <h2>Bookings Removal ! </h2>
    <form action="BookingsManagementDeletionServlet" method="post">
        <table>
            <tr>
                <th>Delete Tickets : </th>
            </tr>
            <tr>
                <td>
                    Delete A Booking : <br>
                    <input name="deletebooking" type="text">
                </td>

            <tr>
                <td colspan="3">
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
