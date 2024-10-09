package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String x =  req.getParameter("x");
        String y =  req.getParameter("y");
        String r =  req.getParameter("r");

        if (x != null && y != null && r != null) {
            RequestDispatcher rd = req.getRequestDispatcher("/areaCheck");
            rd.forward(req, resp);
        }
    }
}
