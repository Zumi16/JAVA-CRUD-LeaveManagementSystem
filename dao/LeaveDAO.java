package net.midterm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import net.midterm.model.LeaveUser;

/**
 * LeaveDAO.java
 * This DAO class provides CRUD database operations for the
 * table users in the database.
 */
public class LeaveDAO {
    private DataSource dataSource;

    public LeaveDAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            this.dataSource = (DataSource) envContext.lookup("jdbc/DerbyDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    protected Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, reasonfl, status) VALUES (?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT id, name, reasonfl, status FROM users WHERE id =?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, reasonfl= ?, status =? WHERE id = ?";

    public void insertUser(LeaveUser leaveUser) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, leaveUser.getName());
            preparedStatement.setString(2, leaveUser.getReasonfl());
            preparedStatement.setString(3, leaveUser.getStatus());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public LeaveUser selectUser(int id) {
        LeaveUser leaveUser = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String reasonfl = rs.getString("reasonfl");
                String status = rs.getString("status");
                leaveUser = new LeaveUser(id, name, reasonfl, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return leaveUser;
    }

    public List<LeaveUser> selectAllUsers() {
        List<LeaveUser> leaveUsers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String reasonfl = rs.getString("reasonfl");
                String status = rs.getString("status");
                leaveUsers.add(new LeaveUser(id, name, reasonfl, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return leaveUsers;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(LeaveUser leaveUser) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, leaveUser.getName());
            statement.setString(2, leaveUser.getReasonfl());
            statement.setString(3, leaveUser.getStatus());
            statement.setInt(4, leaveUser.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
