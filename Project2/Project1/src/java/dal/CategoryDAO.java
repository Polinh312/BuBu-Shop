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
}
