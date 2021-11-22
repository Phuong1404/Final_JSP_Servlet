package Model;

public class Chart
{
    private int Day;
    private int Total;
    public Chart() {}

    public Chart(int Day,int Total)
    {
        this.Day = Day;
        this.Total = Total;
    }
    public int getDay()
    {
        return Day;
    }

    public void setDay(int Day)
    {
        this.Day = Day;
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

