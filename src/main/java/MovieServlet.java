import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/login";
        String user = "root";
        String password = "root";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String sql = "SELECT * FROM addedmovies";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<title>Deals !</title>");
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap\" rel=\"stylesheet\">");
            out.println("<style>");
            // Include your CSS styles here
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"container\">");
            out.println("<h1>Deals !</h1>");
            out.println("<div class=\"movie-list\">");

            while (resultSet.next()) {
                String movies = resultSet.getString("movies");
                double initialPrice = resultSet.getDouble("initialprice");
                double finalPrice = resultSet.getDouble("finalprice");
                double discount = resultSet.getDouble("discount");

                out.println("<div class=\"movie\">");
                out.println("<div class=\"info\">");
                out.println("<h3>" + movies + "</h3>");
                out.println("<p><span class=\"highlight\">Discount (in%): " + discount + "</span></p>");
                out.println("<p>Initial Price (rs.): " + initialPrice + "</p>");
                out.println("<p>Final Price (rs.): " + finalPrice + "</p>");
                out.println("<button class=\"more-info\"><a href=\"ticket.html\">Book Now</a></button>");
                out.println("</div>");
                out.println("</div>");
            }

            out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
