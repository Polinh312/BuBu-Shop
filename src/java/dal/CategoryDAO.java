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
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("description"));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryByID(int id) {
        String sql = "Select * from Categories where id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertCategory(Category c) {
        String sql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?, ? ,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescription());
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updatecategory(Category c) throws SQLException {
        String sql = "UPDATE [dbo].[Categories]\n"
                + "      Set [name] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescription());
            st.setInt(3, c.getId());
            st.executeUpdate();
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    public void deleteCategory(int id) {
        String sql = "delete from Categories where id = ?";
        ProductDAO d = new ProductDAO();
        d.deleteProductByCid(id);
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
