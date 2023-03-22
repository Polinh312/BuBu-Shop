/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Country;

/**
 *
 * @author Phuong-Linh
 */
public class CountryDAO extends DBContext {

    public ArrayList<Country> getAllCountry() {
        String sql = "select * from Country";
        ArrayList<Country> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Country c = new Country(rs.getString("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Country getCountryById(String id) {
        String sql = "select * from Country where id =?";

        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Country(rs.getString("id"), rs.getString("name"));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertCountry(Country c) {
        String sql = "INSERT INTO [dbo].[Country]\n"
                + "           ([id]\n"
                + "           ,[name])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getName());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCountry(String id) {
        String sql = "delete from Country where id = ?";
        ProductDAO d = new ProductDAO();
        d.deleteProductByCountry(id);
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCountry(Country c) {
        String sql = "UPDATE [dbo].[Country]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
