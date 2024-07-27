package net.midterm.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.midterm.dao.LeaveDAO;
import net.midterm.model.LeaveUser;

/**
 * LeaveServlet.java
 * This servlet acts as a page controller for the leave management application, handling all
 * requests related to leave users.
 * @author Ramesh Fadatare
 */

@WebServlet("/")
public class LeaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LeaveDAO leaveDAO;

    public void init() {
        leaveDAO = new LeaveDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertLeaveUser(request, response);
                    break;
                case "/delete":
                    deleteLeaveUser(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateLeaveUser(request, response);
                    break;
                default:
                    listLeaveUsers(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listLeaveUsers(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List<LeaveUser> listLeaveUsers = leaveDAO.selectAllUsers();
        request.setAttribute("listLeaveUsers", listLeaveUsers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("leave-user-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("leave-user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LeaveUser existingLeaveUser = leaveDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("leave-user-form.jsp");
        request.setAttribute("leaveUser", existingLeaveUser);
        dispatcher.forward(request, response);
    }

    private void insertLeaveUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String name = request.getParameter("name");
        String reasonfl = request.getParameter("reasonfl");
        String status = request.getParameter("status");
        LeaveUser newLeaveUser = new LeaveUser(name, reasonfl, status);
        leaveDAO.insertUser(newLeaveUser);
        response.sendRedirect("list");
    }

    private void updateLeaveUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String reasonfl = request.getParameter("reasonfl");
        String status = request.getParameter("status");

        LeaveUser updatedLeaveUser = new LeaveUser(id, name, reasonfl, status);
        leaveDAO.updateUser(updatedLeaveUser);
        response.sendRedirect("list");
    }

    private void deleteLeaveUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        leaveDAO.deleteUser(id);
        response.sendRedirect("list");
    }
}
