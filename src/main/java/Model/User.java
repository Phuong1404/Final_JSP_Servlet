package Model;

public class User
{
    private String ID;
    private String Name;
    private java.sql.Date DateOfBirth;
    private String Address;
    private String Email;
    private String PhoneNumber;

    public User() {}

    public User(String User_ID,String Name,java.sql.Date DateOfBirth,String Address,String Email,String PhoneNumber)
    {
        this.ID=User_ID;
        this.Name=Name;
        this.DateOfBirth=DateOfBirth;
        this.Address=Address;
        this.Email=Email;
        this.PhoneNumber=PhoneNumber;
    }

    public String getID()
    {
        return ID;
    }

    public void setID(String User_ID)
    {
        this.ID = User_ID;
    }

    public String getName()
    {
        return Name;
    }

    public void setName(String Name)
    {
        this.Name = Name;
    }

    public java.sql.Date getDateOfBirth()
    {
        return DateOfBirth;
    }

    public void setDateOfBirth(java.sql.Date DateOfBirth)
    {
        this.DateOfBirth = DateOfBirth;
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

    public String getPhoneNumber()
    {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber)
    {
        this.PhoneNumber = PhoneNumber;
    }
}
