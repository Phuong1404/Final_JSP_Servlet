package Model;

public class TopWatch
{
    private String ID;
    private String Name;
    private int Quantity;
    private int Total;

    public TopWatch(){}

    public TopWatch(String ID,String Name,int Quantity,int Total)
    {
        this.ID=ID;
        this.Name=Name;
        this.Total=Total;
        this.Quantity=Quantity;
    }
    public int getTotal()
    {
        return Total;
    }

    public void setTotal(int Total)
    {
        this.Total = Total;
    }

    public int getQuantity()
    {
        return Quantity;
    }

    public void setQuantity(int Quantity)
    {
        this.Quantity = Quantity;
    }

    public String getID(){return ID;}

    public void setID(String ID){this.ID=ID;}

    public String getName(){return Name;}

    public void  setName(){this.Name=Name;}
}