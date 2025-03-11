package amaze;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class DBCode implements Serializable{
    private static final long serialVersionUID = 1L;

    private String url="jdbc:mysql://localhost:3306/amazon";
    private String user="root";
    private String pass="gtsurya";
   
   
    private Connection con;
   
    public DBCode() throws SQLException,ClassNotFoundException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection(url,user,pass);
    }
   
    public int insert(String name,String section,float price) throws SQLException{
        String q="insert into product(name,section,price) values(?,?,?)";
        PreparedStatement pst=con.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2,section);
        pst.setFloat(3, price);
        int r=pst.executeUpdate();
        return r;
    }
    public int update(int id,float price) throws SQLException{
        String q="update product set price=? where id=?";
        PreparedStatement pst=con.prepareStatement(q);
        pst.setFloat(1, price);
        pst.setInt(2, id);
        int r=pst.executeUpdate();
        return r;
    }
    public int delete(int id) throws SQLException{
        String q="delete from product where id=?";
        PreparedStatement pst=con.prepareStatement(q);
        pst.setInt(1, id);
        int r=pst.executeUpdate();
        return r;
    }
    public int count() throws SQLException{
        String q="select count(*) from product";
        PreparedStatement pst=con.prepareStatement(q);
        ResultSet rs=pst.executeQuery();    
        int r=0;
        while(rs.next()) {
            r=rs.getInt(1);
        }    
        return r;
    }
   
    public Vector<Product> view() throws SQLException{
        String q="select *from product";
        PreparedStatement pst=con.prepareStatement(q);
        ResultSet rs=pst.executeQuery();    
        Vector<Product> p=new Vector<Product>();
        while(rs.next()) {
             int id=rs.getInt(1);
             String name=rs.getString(2);
             String section=rs.getString(3);
             float price=rs.getFloat(4);
             String company=rs.getString(5);
             
             Product i=new Product(id, name, section, price, company);
             p.add(i);
        }    
        return p;
    }
   
    public Vector<Product> view(int id) throws SQLException{
        String q="select name,section,price,company from product where id=?";
        PreparedStatement pst=con.prepareStatement(q);
        pst.setInt(1, id);
        ResultSet rs=pst.executeQuery();    
        Vector<Product> p=new Vector<Product>();
        while(rs.next()) {
             String name=rs.getString(1);
             String section=rs.getString(2);
             float price=rs.getFloat(3);
             String company=rs.getString(4);
             
             Product i=new Product(id, name, section, price, company);
             p.add(i);
        }    
        return p;
    }
}
