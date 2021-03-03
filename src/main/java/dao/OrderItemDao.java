package dao;

import domain.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class OrderItemDao {
    public int addOrderItem(List<OrderItem> list) throws SQLException {
        int i = 0;
        String sql="insert into orderItem(order_id, buynum, product_id) values(?, ?, ?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        for(OrderItem orderItem : list) {
            System.out.println("orderItem --> " + orderItem.toString());
            i += runner.update(sql,orderItem.getOrder_id(),orderItem.getBuynum(), orderItem.getProduct_id());
        }
        return i;
    }
}
