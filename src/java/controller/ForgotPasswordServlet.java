package controller;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDB = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean emailExists = userDB.checkEmailExists(email);

        if (emailExists) {
            // Code to send reset password link to the email
            request.setAttribute("message", "A reset password link has been sent to your email.");
        } else {
            request.setAttribute("errorMessage", "Email address not found.");
        }
        
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }
}
