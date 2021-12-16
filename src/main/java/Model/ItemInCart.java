package Model;

import javax.naming.Name;

public class ItemInCart {
    private String ID;
    private String Name;
    private int Price;
    private int Quantity;
    private int QuantityInStock;
    private String Photo;
    private int Sale;
    public ItemInCart(){}
    public ItemInCart(String ID,String Name,int Price,int Quantity,int QuantityInStock,int Sale)
    {
        this.ID=ID;
        this.Name=Name;
        this.Price=Price;
        this.Quantity=Quantity;
        this.QuantityInStock=QuantityInStock;
        this.Photo=ID+"(1).jpg";
        this.Sale=Sale;
    }
    public String getID()
    {
        return ID;
    }

    public void setID(String ID)
    {
        this.ID = ID;
    }

    public String getName()
    {
        return Name;
    }

    public void setName(String Name)
    {
        this.Name = Name;
    }

    public String getPhoto()
    {
        return Photo;
    }

    public void setPhoto(String Photo)
    {
        this.Photo = Photo;
    }

    public int getQuantity()
    {
        return Quantity;
    }

    public void setQuantity(int Quantity)
    {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getSale() {
        return Sale;
    }

    public void setSale(int Sale) {
        this.Sale = Sale;
    }

    public int getQuantityInStock() {
        return QuantityInStock;
    }

    public void setQuantityInStock(int QuantityInStock) {
        this.QuantityInStock = QuantityInStock;
    }
}

