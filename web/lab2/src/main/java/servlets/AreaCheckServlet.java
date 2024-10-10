package servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    Logger logger = Logger.getLogger("AreaCheckServlet");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();

        double x = (double) context.getAttribute("x");
        double y = (double) context.getAttribute("y");
        double r = (double) context.getAttribute("r");

        logger.info("Полученные параметры: x = " + x + ", y = " + y + ", r = " + r);

        if (isHit(x, y, r)) {
            req.getRequestDispatcher("./result.jsp").forward(req, resp);
        }
    }

    private static boolean isHit(double x, double y, double r) {
        if (x <= 0 && y <= 0 && (x * x + y * y <= (r / 2) * (r / 2))) return true;  // Четверть круга
        if (x >= 0 && y >= 0 && x <= r && y <= r / 2) return true;                  // Прямоугольник
        return x >= 0 && y <= 0 && x <= r && y >= (x - r);                          // Треугольник
    }
}
