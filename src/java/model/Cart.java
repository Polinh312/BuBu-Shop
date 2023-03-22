/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Phuong-Linh
 */
public class Cart {

    private List<Item> items; //  ds sản phẩm đưa vào giỏ

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }
    // số lượng 1 sản phẩm trong giỏ - khách sẽ mua

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }
// add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getId()) != null) {
            Item m = getItemById(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
//loại sản phẩm khỏi giỏ

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
//tổng tiền của cả giỏ hàng – sẽ add vào bảng Order

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

    public Item updateItem(Item i, int quantity) {
        return new Item(i.getProduct(), quantity, i.getPrice());
    }

}
