package server.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import server.Point;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    Logger logger = Logger.getLogger("AreaCheckServlet");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();
        LocalDate date = LocalDate.now();

        double x = (double) context.getAttribute("x");
        double y = (double) context.getAttribute("y");
        double r = (double) context.getAttribute("r");

        boolean isHit = isHit(x, y, r);

        logger.info("Полученные параметры: x = " + x + ", y = " + y + ", r = " + r);

        Point point = new Point(x, y, r, isHit, date);
        context.setAttribute("point", point);

        List<Point> points = (List<Point>) context.getAttribute("points");
        if (points == null) points = new ArrayList<>();
        points.add(point);
        context.setAttribute("points", points);

        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }

    private static boolean isHit(double x, double y, double r) {
        if (x <= 0 && y <= 0 && (x * x + y * y <= r * r)) return true;              // Четверть круга
        if (x >= 0 && y >= 0 && x <= (r-1) && y <= (r-1)) return true;                      // Прямоугольник
        return y >= ((double) 1 /2 * x) - (r/2);                                    // Треугольник
    }
}