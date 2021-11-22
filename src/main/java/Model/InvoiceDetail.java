package Model;

public class InvoiceDetail
{
    private String Invoice_ID;
    private String Watch_ID;
    private int Quantity;

    public InvoiceDetail() {}

    public InvoiceDetail( String Invoice_ID, String Watch_ID, int Quantity)
    {
        this.Invoice_ID = Invoice_ID;
        this.Watch_ID = Watch_ID;
        this.Quantity = Quantity;
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
}
