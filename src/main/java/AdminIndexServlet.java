import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminIndexServlet")
public class AdminIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            // Step 1: Connect to the Database
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root",
                    "root");

            // Step 2: Retrieve Data
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM ids"); // Replace 'your_table' with your table name

            // Step 3: Set the ResultSet as a request attribute
            request.setAttribute("resultSet", rs);

            // Step 4: Forward the request to the JSP
            request.getRequestDispatcher("adminindex.jsp").forward(request, response);

            // Step 5: Close the Connection (not shown here)
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
