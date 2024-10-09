import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve the session object
        HttpSession session = request.getSession(false);

        // Check if session exists and if the user is logged in
        if (session != null && session.getAttribute("username") != null) {
            String username = (String) session.getAttribute("username");

            // Display profile information with styled HTML
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<title>Account " + username + "</title>");
            out.println("<style>");
            out.println("body {");
            out.println("    font-family: Arial, sans-serif;");
            // Uncomment for a lighter background color
            out.println("    background-color: #f8f9fa; /* Light gray background */");
            // Uncomment for a background image
            out.println("    background-image: url('background.jpg');");
            out.println("    background-size: cover;");
            out.println("    background-repeat: no-repeat;");
            //
            out.println("    color: #333;");
            out.println("    margin: 0;");
            out.println("    padding: 0;");
            out.println("}");
            out.println(".container {");
            out.println("    max-width: 800px;");
            out.println("    margin: 20px auto;");
            out.println("    padding: 20px;");
            out.println("    background-color: #fff;");
            out.println("    border-radius: 10px;");
            out.println("    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);");
            out.println("}");
            out.println("h1 {");
            out.println("    text-align: center;");
            out.println("}");
            out.println("p {");
            out.println("    text-align: center;");
            out.println("}");
            out.println(".btn {");
            out.println("    display: block;");
            out.println("    width: 100%;");
            out.println("    padding: 10px;");
            out.println("    margin: 10px 0;");
            out.println("    text-align: center;");
            out.println("    background-color: #007bff;");
            out.println("    color: #fff;");
            out.println("    border: none;");
            out.println("    border-radius: 5px;");
            out.println("    text-decoration: none;");
            out.println("}");
            out.println(".btn:hover {");
            out.println("    background-color: #0056b3;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"container\">");
            out.println("<h1>Welcome, " + username + "!</h1>");
            out.println("<p>Currently Logged In As: " + username + "</p>");
            out.println("<a class=\"btn\" href=\"LogoutServlet\">Logout</a>");
            out.println("<a class=\"btn\" href=\"resetpassword.jsp\">Reset Password</a>");
            out.println("<a class=\"btn\" href=\"forgotpassword.jsp\">Forgot Password</a>");
            out.println("<a class=\"btn\" href=\"index.jsp\">Go To Home</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        } else {
            // If the session does not exist or the user is not logged in, redirect to the login page
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
