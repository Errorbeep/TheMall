package service;

import dao.OrderItemDao;
import domain.OrderItem;
import exception.addOrderException;

import java.sql.SQLException;
import java.util.List;

public class OrderItemService {
    public int addOrderItem(List<OrderItem> list) throws Exception {
        OrderItemDao dao=new OrderItemDao();
        int i = 0;

        try {
            i = dao.addOrderItem(list);
        } catch (SQLException e) {
            throw new addOrderException("订单详情提交失败" + e.getMessage());
        }
        return i;
    }
}
