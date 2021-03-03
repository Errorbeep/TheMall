package web.servlet;

import net.sf.json.JSONArray;
import service.NodeDateService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;

/**
 * Servlet implementation class LinkageServlet
 */
@WebServlet("/LinkageServlet")
public class LinkageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String code = request.getParameter("levelcode");
        NodeDateService service = new NodeDateService();
        if (code != null && !code.equals("")) {// 有变量就要进行空判断
            try {
                System.out.println("code == " + code);
                List<HashMap<String, Object>>  name = service.getNextName(code);
                request.getSession().removeAttribute("c3name");
                request.getSession().setAttribute("c3name", name);
                // 将集合对象转换成json格式---List---JsonArr字符串[{},{},{}]
                String aString = JSONArray.fromObject(name).toString();
                // aString = URLEncoder.encode(aString, StandardCharsets.UTF_8);
                System.out.println("aString ---> " + aString);
                out.print(aString);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            out.print("fail");
            System.out.println("failed!!!----------------code= " + code);
            // 查询失败
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
