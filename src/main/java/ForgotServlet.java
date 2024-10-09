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

/**
 * Servlet implementation class ForgotServlet
 */
@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
            String name = request.getParameter("txtName");
            String petName = request.getParameter("txtPetName");
            String newPwd = request.getParameter("txtNewPwd");

            if (authenticateUser(name, petName, con)) {
                if (updatePassword(name, newPwd, con)) {
                    out.println("<html><body><b>Password updated successfully!</b></body></html>");
                } else {
                    out.println("<html><body><b>Error updating password. Please try again later.</b></body></html>");
                }
            } else {
                out.println("<html><body><b>Incorrect Credentials (PetName Or Name)!!<br>");
                out.println("<a href=forgotpassword.jsp>Click Here !!</a></b></body></html>");
            }

            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean authenticateUser(String name, String petName, Connection con) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM ids WHERE Name=? AND `Pet Name`=?");
        ps.setString(1, name);
        ps.setString(2, petName);
        ResultSet rs = ps.executeQuery();
        boolean authenticated = rs.next();
        rs.close();
        ps.close();
        return authenticated;
    }

    private boolean updatePassword(String name, String newPwd, Connection con) throws SQLException {
        PreparedStatement ps = con.prepareStatement("UPDATE ids SET Password=? WHERE Name=?");
        ps.setString(1, newPwd);
        ps.setString(2, name);
        int rowsAffected = ps.executeUpdate();
        ps.close();
        return rowsAffected > 0;
    }
}
