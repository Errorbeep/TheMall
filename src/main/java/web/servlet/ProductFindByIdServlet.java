package web.servlet;

import domain.Product;
import domain.User;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class ProductFindByIdServlet
 */
@WebServlet("/ProductFindByIdServlet")
public class ProductFindByIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取输入信息
        String id = request.getParameter("id");

        //调用service中查询所有方法
        ProductService service = new ProductService();

        try {
            Product pro = service.findById(Integer.parseInt(id));

            request.getSession().setAttribute("pro", pro);

            User user = (User) request.getSession().getAttribute("user");

            if (user == null || user.getRole().equals("user")) {
                request.getRequestDispatcher("/productInfo_user.jsp").forward(request, response);
                return;
            }
            request.getRequestDispatcher("admin_productInfo.jsp").forward(request, response);
            // request.getRequestDispatcher("/productInfo_admin.jsp").forward(request, response);
            return;

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
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
