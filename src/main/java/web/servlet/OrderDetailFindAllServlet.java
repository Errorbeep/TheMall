/*
 * Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package web.servlet;

import domain.OrderDetail;
import service.OrderDetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("OrderDetailFindAllServlet")
public class OrderDetailFindAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDetailService orderDetailService = new OrderDetailService();
        List<OrderDetail> list = null;
        try {
             list = orderDetailService.findAll();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("detail", list);
        req.getRequestDispatcher("/admin_orderDetail.jsp").forward(req, resp);
    }
}
