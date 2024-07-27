package net.midterm.model;

/**
 * LeaveUser.java
 * This is a model class represents a LeaveUser entity
 * @author Ramesh Fadatare
 *
 */
public class LeaveUser {
    protected int id;
    protected String name;
    protected String reasonfl;
    protected String status;

    public LeaveUser() {}

    public LeaveUser(String name, String reasonfl, String status) {
        super();
        this.name = name;
        this.reasonfl = reasonfl;
        this.status = status;
    }

    public LeaveUser(int id, String name, String reasonfl, String status) {
        super();
        this.id = id;
        this.name = name;
        this.reasonfl = reasonfl;
        this.status = status;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getReasonfl() {
        return reasonfl;
    }
    public void setReasonfl(String reasonfl) {
        this.reasonfl = reasonfl;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
