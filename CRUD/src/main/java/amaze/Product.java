package amaze;
import java.io.Serializable;
public class Product implements Serializable{
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String section;
    private float price;
    private String company;
    public Product(int id, String name, String section, float price, String company) {
        super();
        this.id = id;
        this.name = name;
        this.section = section;
        this.price = price;
        this.company = company;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getSection() {
        return section;
    }
    public void setSection(String section) {
        this.section = section;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
}