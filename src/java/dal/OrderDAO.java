/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Account;
import model.Cart;
import model.Count;
import model.Item;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Phuong-Linh
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //add vào bảng Order
            String sql = "insert into [order] values(?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, u.getLoginName());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();

            //lấy ra id của Order vừa add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = con.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            //add vào bảng OrderLine
            if (rs.next()) {
                int oid = rs.getInt(1);

                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement st2 = con.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            //update so luong trong bang Product sau khi ban
            String sql3 = "update Products set stock = stock - ? "
                    + "where id = ?";
            PreparedStatement st3 = con.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Order> getOrderByAccount(Account a) {
        String sql = "select * from [Order] where loginName = ?";
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getLoginName());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("id"), rs.getString("date"), a.getLoginName(), rs.getDouble("totalmoney"));
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public OrderDetail getOrderDetailByOid(int oid) {
        String sql = "select * from [OrderDetail] where oid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderDetail o = new OrderDetail(oid, rs.getInt("pid"), rs.getInt("quantity"), rs.getDouble("price"));
                return o;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Order> getAllOrder() {
        String sql = "select * from [Order]";
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(rs.getInt("id"), rs.getString("date"), rs.getString("loginName"), rs.getDouble("totalmoney"));
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Count> getNumOfOrderDESC() {
        String sql = "select  loginName, count (loginName) as 'count' from [Order]\n"
                + "group by loginName order by count desc";
        ArrayList<Count> list = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Count c = new Count(rs.getString("loginName"), rs.getInt("count"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
