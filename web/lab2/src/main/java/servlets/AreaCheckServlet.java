package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int x = Integer.parseInt(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));

        if (validate(x, y, r) && isHit(x, y, r)) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/result.jsp");
            rd.forward(req, resp);
        }
    }

    private static boolean validate(int x, double y, double r) {
        if (x >= -3 && x <= 5) return true;
        if (y >= -5 && y <= 5) return true;
        return r >= 1 && r <= 3;
    }

    private static boolean isHit(int x, double y, double r) {
        return true;
    }
}
