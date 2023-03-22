/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author Phuong-Linh
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getProductByCid(int cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products where cid =?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getString("discount"));
                p.setStock(rs.getInt("stock"));
                Category c = d.getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                p.setImage(rs.getString("image"));
                p.setWeight(rs.getString("weight"));
                p.setCountry(rs.getString("country"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getProductByCidPriceASC(int cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products where cid =? order by price asc";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getString("discount"));
                p.setStock(rs.getInt("stock"));
                Category c = d.getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                p.setImage(rs.getString("image"));
                p.setWeight(rs.getString("weight"));
                p.setCountry(rs.getString("country"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getProductByCidPriceDESC(int cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products where cid =? order by price desc";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getString("discount"));
                p.setStock(rs.getInt("stock"));
                Category c = d.getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                p.setImage(rs.getString("image"));
                p.setWeight(rs.getString("weight"));
                p.setCountry(rs.getString("country"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> get8ProductByCid(int cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 8 * from Products where cid =?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getString("discount"));
                p.setStock(rs.getInt("stock"));
                Category c = d.getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                p.setImage(rs.getString("image"));
                p.setWeight(rs.getString("weight"));
                p.setCountry(rs.getString("country"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getAllProducts() {
        String sql = "select * from Products";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return list;
    }

    public ArrayList<Product> get4ProductsByIdDESC() {
        String sql = "select top 4 * from Products order by id desc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return list;
    }

    public ArrayList<Product> get4ProductsByUIS() {
        String sql = "select top 4 * from Products order by stock asc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "select * from Products where id = ?";
        CategoryDAO d = new CategoryDAO();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                return new Product(id, rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Product> get4ProductsByCidAndUIS(int cid) {
        String sql = "select top 4 * from Products where cid = ? order by stock asc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return list;
    }
    
    public ArrayList<Product> get4ProductsByCidAndIDDESC(int cid) {
        String sql = "select top 4 * from Products where cid = ? order by id desc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Category c = d.getCategoryByID(rs.getInt("cid"));
                Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        return list;
    }

    public ArrayList<Product> search(String search) {
        String sql = "select * from Products where name like ?";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            CategoryDAO d = new CategoryDAO();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setDiscount(rs.getString("discount"));
                p.setStock(rs.getInt("stock"));
                Category c = d.getCategoryByID(rs.getInt("cid"));
                p.setCategory(c);
                p.setImage(rs.getString("image"));
                p.setWeight(rs.getString("weight"));
                p.setCountry(rs.getString("country"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET "
                + "       [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[stock] = ?\n"
                + "      ,[cid] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[weight] = ?\n"
                + "      ,[country] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setDouble(2, p.getPrice());
            st.setString(3, p.getDescription());
            st.setString(4, p.getDiscount());
            st.setInt(5, p.getStock());
            st.setInt(6, p.getCategory().getId());
            st.setString(7, p.getImage());
            st.setString(8, p.getWeight());
            st.setString(9, p.getCountry());
            st.setInt(10, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[discount]\n"
                + "           ,[stock]\n"
                + "           ,[cid]\n"
                + "           ,[image]\n"
                + "           ,[weight]\n"
                + "           ,[country])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, p.getId());
            st.setString(2, p.getName());
            st.setDouble(3, p.getPrice());
            st.setString(4, p.getDescription());
            st.setString(5, p.getDiscount());
            st.setInt(6, p.getStock());
            st.setInt(7, p.getCategory().getId());
            st.setString(8, p.getImage());
            st.setString(9, p.getWeight());
            st.setString(10, p.getCountry());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();

    }
}
