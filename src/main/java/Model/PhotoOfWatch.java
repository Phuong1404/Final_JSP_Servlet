package Model;

public class PhotoOfWatch
{
    private String Watch_ID;
    private String Photos;

    public PhotoOfWatch(){}

    public PhotoOfWatch(String Watch_ID,String Photos)
    {
        this.Watch_ID=Watch_ID;
        this.Photos=Photos;

    }

    public String getWatch_ID()
    {
        return Watch_ID;
    }

    public void setWatch_ID(String Watch_ID)
    {
        this.Watch_ID=Watch_ID;
    }

    public String getPhotos()
    {
        return Photos;
    }

    public  void setPhotos(String Photos)
    {
        this.Photos=Photos;
    }
}
