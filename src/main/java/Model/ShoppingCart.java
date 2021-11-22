package Model;

public class ShoppingCart
{
    private String UserID;
    private String Watch_ID;
    private int Quantity;

    public ShoppingCart() {}

    public ShoppingCart( String UserID, String Watch_ID, int Quantity)
    {
        this.UserID = UserID;
        this.Watch_ID = Watch_ID;
        this.Quantity = Quantity;
    }

    public String getUserID()
    {
        return UserID;
    }

    public void setUserID(String UserID)
    {
        this.UserID = UserID;
    }

    public String getWatch_ID()
    {
        return Watch_ID;
    }

    public void setWatch_ID(String Watch_ID)
    {
        this.Watch_ID = Watch_ID;
    }

    public int getQuantity()
    {
        return Quantity;
    }

    public void setQuantity(int Quantity)
    {
        this.Quantity = Quantity;
    }

}
