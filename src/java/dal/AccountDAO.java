/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author Phuong-Linh
 */
public class AccountDAO extends DBContext {

    public Account check(String username, String password) {
        String sql = "Select * from Accounts where loginName = ? and password = ?";
        Account a = null;
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Account(rs.getString("loginName"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("gender"), rs.getString("dob"), rs.getString("address"), rs.getString("phone"), rs.getString("role"));
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
          return a;
    }

    public Account getAccountByLoginName(String name) {
        String sql = "Select * from Accounts where loginName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account c = new Account(name, rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("gender"), rs.getString("dob"), rs.getString("address"), rs.getString("phone"), rs.getString("role"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean isValid(String dateStr) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        f.setLenient(false);
        try {
            f.parse(dateStr);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public void insertAccount(Account c) {
        String sql = "INSERT INTO [dbo].[Accounts]\n"
                + "           ([loginName]\n"
                + "           ,[password]\n"
                + "           ,[fullname]\n"
                + "           ,[email]\n"
                + "           ,[gender]\n"
                + "           ,[dob]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getLoginName());
            st.setString(2, c.getPass());
            st.setString(3, c.getFullname());
            st.setString(4, c.getEmail());
            st.setString(5, c.getGender());
            st.setString(6, c.getDob());
            st.setString(7, c.getAddress());
            st.setString(8, c.getPhone());
            st.setString(9, c.getRole());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void update(Account c) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET "
                + "       [fullname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role] = ?\n"
                + " WHERE loginName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getFullname());
            st.setString(2, c.getEmail());
            st.setString(3, c.getGender());
            st.setString(4, c.getDob());
            st.setString(5, c.getAddress());
            st.setString(6, c.getPhone());
            st.setString(7, c.getRole());
            st.setString(8, c.getLoginName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updatePass(Account c) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET "
                + "      [password] = ?\n"
                + " WHERE loginName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getPass());
            st.setString(2, c.getLoginName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Account> getAccountByRole(String role) {
        String sql = "select * from Accounts where role = ?";
        ArrayList<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, role);
            ResultSet rs = st.executeQuery();
            String gender;
            while (rs.next()) {
                if (rs.getString("gender").equals("1")) {
                    gender = "Nam";
                } else {
                    gender = "Nữ";
                }
                Account a = new Account(rs.getString("loginName"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), gender, rs.getString("dob"), rs.getString("address"), rs.getString("phone"), rs.getString("role"));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteAccount(String loginName) {
        String sql = "DELETE FROM [dbo].[Accounts]\n"
                + "      WHERE loginName = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, loginName);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Account> searchByLoginName(String name) {
        String sql = "Select * from Accounts where loginName like ?";
        ArrayList<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString("loginName"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"), rs.getString("gender"), rs.getString("dob"), rs.getString("address"), rs.getString("phone"), rs.getString("role"));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        AccountDAO d = new AccountDAO();
        Account a = new Account("a", "123", "fn", "em", "0", "ccc", "ccc", "ccx", "dss");
        d.insertAccount(a);
    }
}
