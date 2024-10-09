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

@WebServlet("/MovieManagementDeletionServlet")
public class MovieManagementDeletionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String deletemovie = request.getParameter("deletemovie");
        String jdbcUrl = "jdbc:mysql://localhost:3306/login";
        String username = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "DELETE FROM addedmovies WHERE movies=?;";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, deletemovie);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A movie was deleted successfully!");
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
