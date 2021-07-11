/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package dao;

import domain.OrderDetail;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class OrderDetailDAO {
    public List<OrderDetail> findAll() throws SQLException {
        /*
        String sql = "select i.id, p.id, p.name, i.buynum, p.price, o.receiverinfo, o.paystate, u.id, u.username, o.ordertime\n" +
                "from orders as o inner join orderItem  as i on o.id = i.order_id \n" +
                "inner join products as p on p.id = i.product_id  \n" +
                "inner join users as u on o.user_id = u.id;";

         */

        String sql = "select i.id as itemId, p.id as productId, p.name as productName, i.buynum as num, p.price as payment,\n" +
                "o.receiverinfo as address, o.paystate as payState, u.id as userId, u.username as userName, o.ordertime as orderTime\n" +
                "from orders as o inner join orderItem  as i on o.id = i.order_id \n" +
                "inner join products as p on p.id = i.product_id  \n" +
                "inner join users as u on o.user_id = u.id;";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<OrderDetail>(OrderDetail.class));
    }
}
