package web.servlet;

import domain.User;
import exception.ActiveCodeException;
import exception.LoginException;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.得到所有请求参数，封装到User对象中.
        User user = new User();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        Map<String, String> map = user.validation();

        if (map.size() != 0) {
            request.setAttribute("map", map);
            request.getRequestDispatcher("/home.jsp").forward(request,
                    response);
            return;
        }


        // 3.调用service中登录的方法
        UserService service = new UserService();
        try {
            User user1 = service.login(username, password);

            // 登录成功

            // 判断是否勾选了记住用户名.
            String remember = request.getParameter("remember");
            if ("on".equals(remember)) {
                // 勾选了--考虑中文问题
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                // 如果用户没有勾选记住用户名，将cookie删除。删除cookie，只需要设置maxage=0或-1,注意：要与cookie的path一致.
                Cookie cookie = new Cookie("remember", URLEncoder.encode(
                        user1.getUsername(), "utf-8"));
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            // 自动登录

            String autologin=request.getParameter("autologin");
            if("on".equals(autologin)){
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8")+"::"+password);
                cookie.setMaxAge(10 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            }else{
                Cookie cookie = new Cookie("autologin", URLEncoder.encode(
                        user1.getUsername(), "utf-8")+"::"+password);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

            request.getSession().invalidate();//先销毁session。

            request.getSession().setAttribute("user", user1);// 登录成功，将user存储到session中.

            response.sendRedirect("http://localhost:8081/TheMall"); //
            return;

        } catch (ActiveCodeException e) {
            e.printStackTrace();
            request.setAttribute("login_err", e.getMessage());
            request.getRequestDispatcher("/login_err.jsp")
                    .forward(request, response);
            return;
        }
        catch (javax.security.auth.login.LoginException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            request.setAttribute("login_err", e.getMessage());
            request.getRequestDispatcher("/login_err.jsp")
                    .forward(request, response);
            return;
        }
        catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("login_err", e.getMessage());
            request.getRequestDispatcher("/login_err.jsp")
                    .forward(request, response);
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
