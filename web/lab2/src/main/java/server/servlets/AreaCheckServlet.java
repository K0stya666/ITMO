package server.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import server.Point;

import javax.xml.transform.Result;
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
        HttpSession session = req.getSession();
        ServletContext context = getServletContext();
        LocalDate date = LocalDate.now();

        double x = (double) context.getAttribute("x");
        double y = (double) context.getAttribute("y");
        double r = (double) context.getAttribute("r");

        boolean isHit = isHit(x, y, r);

        logger.info("Полученные параметры: x = " + x + ", y = " + y + ", r = " + r);

//        session.setAttribute("x", x);
//        session.setAttribute("y", y);
//        session.setAttribute("r", r);
//        session.setAttribute("isHit", isHit);
//        session.setAttribute("date", date);

        Point point = new Point(x, y, r, isHit, date);
        List<Point> points = (List<Point>) session.getAttribute("points");
        if (points == null) points = new ArrayList<>();
        points.add(point);

        session.setAttribute("points", points);

        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }

    private static boolean isHit(double x, double y, double r) {
        if (x <= 0 && y <= 0 && (x * x + y * y <= (r / 2) * (r / 2))) return true;  // Четверть круга
        if (x >= 0 && y >= 0 && x <= r && y <= r / 2) return true;                  // Прямоугольник
        return x >= 0 && y <= 0 && x <= r && y >= (x - r);                          // Треугольник
    }
}
