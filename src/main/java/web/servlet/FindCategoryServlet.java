package web.servlet;

import domain.NodeDate;
import service.NodeDateService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * Servlet implementation class FindCategoryServlet
 */
@WebServlet("/FindCategoryServlet")
public class FindCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.getSession().removeAttribute("c1name");

            NodeDateService service = new NodeDateService();
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;utf-8");
            String c1name = request.getParameter("name");
            c1name = URLDecoder.decode(c1name, "utf-8");
            System.out.println("c1name ---> " + c1name);


            request.getSession().setAttribute("c1name", c1name);
            NodeDate node = service.getNodeDate(c1name);

            //String code = node.getCode();
            String code="51";
            if(c1name.equals("智能设备")){
                code="52";
            }else if(c1name.equals("电脑")){
                code="53";
            }else if(c1name.equals("娱乐影音")){
                code="54";
            }

            List<HashMap<String, Object>> c2name = service.getNextName(code);

            request.getSession().setAttribute("c2name", c2name);
            response.sendRedirect("ProductFindByPageCodeServlet?code="+code);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
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
