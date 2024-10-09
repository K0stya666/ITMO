package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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