import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the session object
        HttpSession session = request.getSession();
        
        // Retrieve the username from the session
        String username = (String) session.getAttribute("name");
        
        // Set response content type
        response.setContentType("text/html");
        
        // Write the response
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Welcome, " + username + "!</h2>");
        response.getWriter().println("<p><a href='logout'>Logout</a></p>");
        response.getWriter().println("</body></html>");
    }
}
