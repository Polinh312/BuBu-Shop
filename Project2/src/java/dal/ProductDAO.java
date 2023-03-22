/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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

    public ArrayList<Product> get8ProductsByIdDESC() {
        String sql = "select top 8 * from Products order by id desc";
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

    public int compareInt(Product f1, Product f2) {
        if (f1.getPrice() < f2.getPrice()) {
            return -1;
        } else if (f1.getPrice() == f2.getPrice()) {
            return 0;
        } else {
            return 1;
        }
    }

    public void sortByPrice(ArrayList<Product> listProduct) {

        listProduct.sort((o1, o2) -> compareInt(o1, o2));

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

    public ArrayList<Product> get4BestDiscount() {
        String sql = "select top 4* from Products where discount > 19";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryDAO d = new CategoryDAO();
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

    public ArrayList<Product> getProductByCidPriceCountry(String cid, String country, String pfrom, String pto) {

        ArrayList<Product> list = new ArrayList<>();
        if (country == null && pfrom == null && pto == null) {
            String sql = "select * from Products where cid = ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, cid);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (pfrom == null && pto == null && cid == null) {
            String sql = "select * from Products where country = ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, country);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (cid == null && country == null) {
            String sql = "select * from Products where price between ? and ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, pfrom);
                st.setString(2, pto);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (cid == null) {
            String sql = "select * from Products where country = ? and price between ? and ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, country);
                st.setString(2, pfrom);
                st.setString(3, pto);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (country == null) {
            String sql = "select * from Products where cid = ? and price between ? and ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, cid);
                st.setString(2, pfrom);
                st.setString(3, pto);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (pto == null && pfrom == null) {
            String sql = "select * from Products where cid = ? and country = ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, cid);
                st.setString(2, country);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            String sql = "select * from Products where cid = ? and country = ? and price between ? and ?";
            try {
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, cid);
                st.setString(2, country);
                st.setString(3, pfrom);
                st.setString(4, pto);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    CategoryDAO d = new CategoryDAO();
                    Category c = d.getCategoryByID(rs.getInt("cid"));
                    Product p = new Product(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("description"),
                            rs.getString("discount"), rs.getInt("stock"), c, rs.getString("image"), rs.getString("weight"), rs.getString("country"));
                    list.add(p);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public int getTotalProduct() {
        String sql = "select count(*) from Products";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Product> pagging(int index) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products order by id offset ? rows fetch next 18 rows only";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, (index - 1) * 18);
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

    public ArrayList<Product> getAllProductByCountry(String country) {
        String sql = "select * from Products where country = ?";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, country);
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

    public void deleteProductByCid(int cid) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE cid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProductByCountry(String country) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE country = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, country);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();

    }
}
