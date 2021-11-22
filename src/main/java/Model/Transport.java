package Model;

public class Transport
{
    private String ID;
    private String Invoice_ID;
    private String Name;
    private String Email;
    private String Phone;
    private String Address;
    private String Status;
    private boolean CheckS;
    private int Total;
    private String MethodShip;
    public Transport(){}
    public Transport(String ID,String Invoice_ID,String Name,String Email,String Phone,String Address,String Status,boolean CheckS,int Total,String MethodShip)
    {
        this.ID=ID;
        this.Invoice_ID=Invoice_ID;
        this.Name=Name;
        this.Email=Email;
        this.Phone=Phone;
        this.Address=Address;
        this.Status=Status;
        this.CheckS=CheckS;
        this.Total=Total;
        this.MethodShip=MethodShip;
    }
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getInvoice_ID()
    {
        return Invoice_ID;
    }

    public void setInvoice_ID(String Invoice_ID)
    {
        this.Invoice_ID = Invoice_ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress()
    {
        return Address;
    }

    public void setAddress(String Address)
    {
        this.Address = Address;
    }

    public String getEmail()
    {
        return Email;
    }

    public void setEmail(String Email)
    {
        this.Email = Email;
    }

    public String getPhone()
    {
        return Phone;
    }

    public void setPhone(String Phone)
    {
        this.Phone = Phone;
    }

    public String getStatus()
    {
        return Status;
    }

    public void setStatus(String Status)
    {
        this.Status = Status;
    }

    public String getMethodShip()
    {
        return MethodShip;
    }

    public void setMethodShip(String MethodShip)
    {
        this.MethodShip = MethodShip;
    }

    public int getTotal()
    {
        return Total;
    }

    public void setTotal(int TotalMoney)
    {
        this.Total = Total;
    }

    public boolean getCheckS(){return CheckS;}

    public void setCheckS(boolean CheckS){ this.CheckS=CheckS; }
}

