package service;

import dao.OrderDao;
import domain.Order;
import exception.addOrderException;

import java.sql.SQLException;

public class OrderService {
    public int addOrder(Order order) throws addOrderException {
        OrderDao dao=new OrderDao();
        int i = 0;

        try {
            i = dao.addOrder(order);
        } catch (SQLException e) {
            throw new addOrderException("订单提交失败" + e.getMessage());
        }
        return i;
    }


}
