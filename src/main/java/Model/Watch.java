package Model;

public class Watch
{
    private String ID;
    private String Name;
    private int TypeOfWatch_ID;
    private String MachineType;
    private String WireType;
    private int Price;
    private int QuantityInStock;
    private String Image;
    private String TypeOfWatch_Name;
    public Watch() {}

    public Watch(String ID, String Name, int TypeOfWatch_ID,String MachineType,String WireType, int Price, int QuantityInStock)
    {
        this.ID = ID;
        this.Name = Name;
        this.TypeOfWatch_ID = TypeOfWatch_ID;
        this.MachineType=MachineType;
        this.WireType=WireType;
        this.Price = Price;
        this.QuantityInStock = QuantityInStock;
    }
    public Watch(String ID, String Name, int TypeOfWatch_ID,String MachineType,String WireType, int Price, int QuantityInStock,String Image)
    {
        this.ID = ID;
        this.Name = Name;
        this.TypeOfWatch_ID = TypeOfWatch_ID;
        this.MachineType=MachineType;
        this.WireType=WireType;
        this.Price = Price;
        this.QuantityInStock = QuantityInStock;
        this.Image=Image;
    }
    public Watch(String ID, String Name, String TypeOfWatch_Name,String MachineType,String WireType, int Price, int QuantityInStock,String Image)
    {
        this.ID = ID;
        this.Name = Name;
        this.TypeOfWatch_Name = TypeOfWatch_Name;
        this.MachineType=MachineType;
        this.WireType=WireType;
        this.Price = Price;
        this.QuantityInStock = QuantityInStock;
        this.Image=Image;
    }
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getTypeOfWatch_ID() {
        return TypeOfWatch_ID;
    }

    public void setTypeOfWatch_ID(int TypeOfWatch_ID) {
        this.TypeOfWatch_ID = TypeOfWatch_ID;
    }

    public String getTypeOfWatch_Name() {
        return TypeOfWatch_Name;
    }

    public void setTypeOfWatch_Name(String TypeOfWatch_Name) {
        this.TypeOfWatch_Name = TypeOfWatch_Name;
    }

    public String getMachineType() {
        return MachineType;
    }

    public void setMachineType(String MachineType) {
        this.MachineType = MachineType;
    }

    public String getWireType() {
        return WireType;
    }

    public void setWireType(String WireType) {
        this.WireType = WireType;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantityInStock() {
        return QuantityInStock;
    }

    public void setQuantityInStock(int QuantityInStock) {
        this.QuantityInStock = QuantityInStock;
    }
}
