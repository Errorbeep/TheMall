/*
OrderDao.java
 */
package dao;

import domain.Order;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;

public class OrderDao {

    //添加订单操作
    public int addOrder(Order order) throws SQLException {
        String sql="insert into orders(id, money, receiverinfo, paystate, user_id) values(null,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql,order.getMoney(),order.getReceiverinfo(),order.getPaystate(), order.getUser_id());
        Object obj = null;
        obj = runner.query("select max(id) from orders", new ScalarHandler<Object>());
        return Integer.parseInt(obj.toString());
    }


}
