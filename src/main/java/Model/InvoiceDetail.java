package Model;

public class InvoiceDetail
{
    private String Invoice_ID;
    private String Watch_ID;
    private int Quantity;
    private String Name;
    private String Photo;
    private int Total;

    public InvoiceDetail() {}

    public InvoiceDetail( String Invoice_ID, String Watch_ID, int Quantity)
    {
        this.Invoice_ID = Invoice_ID;
        this.Watch_ID = Watch_ID;
        this.Quantity = Quantity;
    }
    public InvoiceDetail( String Invoice_ID, String Watch_ID, int Quantity,String Name,String Photo,int Total)
    {
        this.Invoice_ID = Invoice_ID;
        this.Watch_ID = Watch_ID;
        this.Quantity = Quantity;
        this.Name=Name;
        this.Photo=Photo;
        this.Total=Total;
    }

    public String getInvoice_ID()
    {
        return Invoice_ID;
    }

    public void setInvoice_ID(String Invoice_ID)
    {
        this.Invoice_ID = Invoice_ID;
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

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhoto() {
        return Photo;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }

    public int getTotal()
    {
        return Total;
    }

    public void setTotal(int Total)
    {
        this.Total = Total;
    }
}
