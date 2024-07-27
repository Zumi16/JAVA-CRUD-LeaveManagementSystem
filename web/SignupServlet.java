package net.midterm.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.midterm.dao.SignupDAO;
import net.midterm.model.User;

@WebServlet("/login")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SignupDAO userDAO;

    public void init() {
        userDAO = new SignupDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("register".equals(action)) {
            registerUser(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.findUser(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("list"); // Redirect to /list upon successful login
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User newUser = new User(username, password);
        boolean success = userDAO.addUser(newUser);

        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("user", newUser);
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Failed to register user");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
