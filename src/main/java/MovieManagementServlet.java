import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MovieManagementServlet")
public class MovieManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movie = request.getParameter("addmovie");
        double initialPrice = Double.parseDouble(request.getParameter("addinitialprice"));
        double finalPrice = Double.parseDouble(request.getParameter("addfinalprice"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String url = request.getParameter("addurl");
        String rating = request.getParameter("addrating");
        String year = request.getParameter("addyear");
        String genre = request.getParameter("addgenre");
        String plot = request.getParameter("addplot");
        String srno = request.getParameter("addsrno");
        String director = request.getParameter("adddirector");


        String jdbcUrl = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "INSERT INTO addedmovies (movies, initialprice, finalprice, discount, url , rating, year, genre, plot, srno, director ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, movie);
            statement.setDouble(2, initialPrice);
            statement.setDouble(3, finalPrice);
            statement.setDouble(4, discount);
            statement.setString(5, url);
            statement.setString(6, rating);
            statement.setString(7, year);
            statement.setString(8, genre);
            statement.setString(9, plot);
            statement.setString(10, srno);
            statement.setString(11, director);
           


            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new movie was added successfully!");
                response.sendRedirect("adminindex.jsp"); // Redirect to the admin index page
            }
            

            statement.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions (e.g., display an error message)
        }
    }
    
}
