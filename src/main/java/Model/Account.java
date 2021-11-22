package Model;

public class Account
{
    private String UserID;
    private String UserName;
    private String Password;
    private String Role;

    public Account() {}

    public Account(String UserID, String UserName, String Password, String Role)
    {
        this.UserID = UserID;
        this.UserName = UserName;
        this.Password = Password;
        this.Role = Role;
    }

    public String getUserID()
    {
        return UserID;
    }

    public void setUserID(String UserID)
    {
        this.UserID = UserID;
    }

    public String getUserName()
    {
        return UserName;
    }

    public void setUserName(String UserName)
    {
        this.UserName = UserName;
    }

    public String getPassword()
    {
        return Password;
    }

    public void setPassword(String Password)
    {
        this.Password = Password;
    }

    public String getRole()
    {
        return Role;
    }

    public void setRole(String Role)
    {
        this.Role = Role;
    }
}
