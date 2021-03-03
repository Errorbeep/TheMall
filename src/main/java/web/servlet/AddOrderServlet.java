package web.servlet;

import domain.Order;
import domain.OrderItem;
import domain.Product;
import exception.addOrderException;
import org.apache.commons.beanutils.BeanUtils;
import service.OrderItemService;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.得到实体类对象，将数据封装至实体类中
        Order order=new Order();
        OrderItem orderItem = null;
        List<OrderItem> orderItemList = new ArrayList<>();

        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        if(cart == null) {
            cart = new HashMap<Product, Integer>();
        }
        System.out.println("cart ---> "  + cart);

        try {
            Map<String, String[]> tmp = request.getParameterMap();
            System.out.println("tmp---> "  + tmp);

            BeanUtils.populate(order, request.getParameterMap());

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        OrderService orderService=new OrderService();
        OrderItemService orderItemService = new OrderItemService();
        try {
            int order_id = orderService.addOrder(order);
            for (Map.Entry<Product, Integer> entry : cart.entrySet())  {
                orderItem = new OrderItem(String.valueOf(order_id), String.valueOf(entry.getKey().getId()), entry.getValue());
                orderItemList.add(orderItem);
            }
            orderItemService.addOrderItem(orderItemList);
            response.sendRedirect(request.getContextPath()
                    + "/index.jsp");
            return;
        } catch (addOrderException e) {
            request.setAttribute("addOrder.message", e.getMessage());
            System.out.println(e.getMessage());
            request.getRequestDispatcher("/error/addOrder_error.jsp").forward(request,
                    response);
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
