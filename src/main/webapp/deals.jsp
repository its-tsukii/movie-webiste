<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exclusive Movie Deals !</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .movie-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: black;
        }
        .movie-image {
            float: right;
            margin-right: 20px;
        }
        .movie-details {
            float: left;
            width: 70%;
        }
        .movie-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .movie-info {
            margin-bottom: 10px;
        }
        .movie-description {
            clear: both;
        }
        .movie-poster {
            width: 250px;
            height: auto;
        }
        
        
   		.highlight {
    color: red;
    font-weight: bold;
    /* Add any other styling you want */
}
	.highlight2 {
    color: blue;
    font-weight: bold;
    /* Add any other styling you want */
}
   		
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #111;
            color: #19c324;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            color: #d115b8;
            margin-bottom: 30px;
        }
        .movie-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-gap: 20px;
        }
        .movie {
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6);
            transition: transform 0.3s ease;
        }
        .movie:hover {
            transform: translateY(-5px);
        }
        .movie img {
            width: 100%;
            height: auto;
            display: block;
        }
        .movie .info {
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.8);
        }
        .movie h3 {
            margin: 0;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 5px;
            color: #fff;
        }
        .movie p {
            margin: 0;
            font-size: 14px;
            font-weight: 400;
            color: #aaa;
        }
        .more-info {
            background-color: rgb(207, 200, 103);
            color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: 700;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .more-info:hover {
            background-color: #ff0000;
        }
        
    </style>
</head>
<body>
    <h1>Exclusive Movie Deals !</h1>
    <% 
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a connection to the database
            String url = "jdbc:mysql://localhost:3306/login?useSSL=false";
            String username = "root";
            String password = "root";
            connection = DriverManager.getConnection(url, username, password);
            
            // Create and execute SQL query
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM addedmovies");

            // Iterate through the result set and display movies
            while (resultSet.next()) {
                String name = resultSet.getString("movies");
                double price = resultSet.getDouble("initialprice");
                double discount = resultSet.getDouble("discount");
                String finalprice = resultSet.getString("finalprice");
                String plot = resultSet.getString("plot");
                String genre = resultSet.getString("genre");
                String year = resultSet.getString("year");
                String rating = resultSet.getString("rating");
                String director = resultSet.getString("director");
                String posterUrl = resultSet.getString("url");
                
    %>
    <div class="movie-container">
        <div class="movie-image">
            <img class="movie-poster" src="<%= posterUrl %>" alt="<%= name %> Poster">
        </div>
        <div class="movie-details">
            <div class="movie-title"><span class="highlight2"><h3><%= name %></h3></span></div>
            <div class="movie-info">InitialPrice: ₹<%= price %></div>
            <div class="movie-info"><span class="highlight">Discount: <%= discount %>%</span></div>
            <div class="movie-info">FinalPrice: ₹<%= finalprice %></div>
            <div class="movie-info">Rating : <%= rating %></div>
            <div class="movie-info">Year : <%= year %></div>
            <div class="movie-info">Genre : <%= genre %></div>
            <div class="movie-info">Plot : <%= plot %></div>
            <div class="movie-info">Directed By : <%= director %></div>
           
            <!-- Add other movie details as needed -->
            <button class="more-info"><a href="tickets.jsp">Book Now</a></button>
        </div>
        <div class="movie-description">
            <!-- Add movie description here if available -->
        </div>
    </div>
    
    <% 
            }
            // Close resources
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close the connection in the finally block
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                out.println("An error occurred while closing the connection: " + e.getMessage());
            }
        }
    %>
        <button align="center"><a href='index.jsp' align='center' ><font size='30'><p><b><u><i> Go To Home </i></u></b></p></font></a></button>
    
</body>
</html>
