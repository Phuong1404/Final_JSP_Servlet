package Model;

public class TypeOfWatch
{
    private int ID;
    private String Name;

    public TypeOfWatch() {}

    public TypeOfWatch(int ID, String Name)
    {
        this.ID = ID;
        this.Name = Name;
    }

    public int getID()
    {
        return ID;
    }

    public void setID(int ID)
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

}
