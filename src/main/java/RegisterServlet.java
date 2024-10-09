
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Initialize the database
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");

            // Create a SQL query to insert data into demo table
            // demo table consists of two columns, so two '?' is used
            PreparedStatement st = con.prepareStatement("insert into ids values(?, ?, ?, ?, ?)");

            // For the first parameter,
            // get the data using request object
            // sets the data to st pointer
            st.setString(1, request.getParameter("txtName"));

            // Same for second parameter
            st.setString(2, request.getParameter("txtPass"));
            
            //st.setLong(3, Integer.valueOf(request.getParameter("txtContact")));
            st.setString(3, request.getParameter("txtContact"));
            
            st.setString(4, request.getParameter("txtPetName"));
            
            st.setString(5, request.getParameter("txtEmail"));
     

            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();

            // Close all the connections
            st.close();
            con.close();

            // Get a writer pointer
            // to display the successful result
            PrintWriter out = response.getWriter();
            out.println("<html><body><b><a href='login.jsp'>Your Account Is Created , Now Please Login From Sign In Page" + "</a></b></body></html>");
        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<html><body><b>Error occurred: Pls Try Again :" + e.getMessage() + "</b></body></html>");
        }
    }
}
