package Model;

public class Invoice
{
    private String ID;
    private String UserID;
    private java.sql.Date TimeOrder;
    private int TotalMoney;

    public Invoice() {}

    public Invoice( String ID, String UserID, java.sql.Date TimeOrder, int TotalMoney)
    {
        this.ID = ID;
        this.UserID = UserID;
        this.TimeOrder = TimeOrder;
        this.TotalMoney = TotalMoney;
    }
    public Invoice( String UserID)
    {
        this.UserID = UserID;
    }

    public String getID()
    {
        return ID;
    }

    public void setID(String ID)
    {
        this.ID = ID;
    }

    public String getUserID()
    {
        return UserID;
    }

    public void setUserID(String UserID)
    {
        this.UserID = UserID;
    }

    public java.sql.Date getTimeOrder()
    {
        return TimeOrder;
    }

    public void setTimeOrder(java.sql.Date TimeOrder)
    {
        this.TimeOrder = TimeOrder;
    }

    public int getTotalMoney()
    {
        return TotalMoney;
    }

    public void setTotalMoney(int TotalMoney)
    {
        this.TotalMoney = TotalMoney;
    }
}
