/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package domain;

import java.sql.Timestamp;

public class OrderDetail {
    private int itemId;
    private int productId;
    private String productName;
    private int num;
    private double payment;
    private String address;
    private int payState;
    private int userId;
    private String userName;
    private Timestamp orderTime;

    public OrderDetail(int itemId, int productId, String productName, int num, double payment, String address,
                       int payState, int userId, String userName, Timestamp orderTime) {
        this.itemId = itemId;
        this.productId = productId;
        this.productName = productName;
        this.num = num;
        this.payment = payment;
        this.address = address;
        this.payState = payState;
        this.userId = userId;
        this.userName = userName;
        this.orderTime = orderTime;
    }

    public OrderDetail() {
    }

    public int getItemId() {
        return itemId;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public int getNum() {
        return num;
    }

    public double getPayment() {
        return payment;
    }

    public String getAddress() {
        return address;
    }

    public int getPayState() {
        return payState;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setPayment(double payment) {
        this.payment = payment;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPayState(int payState) {
        this.payState = payState;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "itemId=" + itemId +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", num=" + num +
                ", payment=" + payment +
                ", address='" + address + '\'' +
                ", payState=" + payState +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", orderTime=" + orderTime +
                '}';
    }
}
