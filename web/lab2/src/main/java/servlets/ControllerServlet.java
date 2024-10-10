package servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Logger;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    Logger logger = Logger.getLogger("controller");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();

        try {
            double x = Double.parseDouble(req.getParameter("x"));
            double y = Double.parseDouble(req.getParameter("y"));
            double r = Double.parseDouble(req.getParameter("r"));

            logger.info("Полученные параметры: x = " + x + ", y = " + y + ", r = " + r);
            logger.info("Контекст: " + req.getContextPath());

            if (validate(x, y, r)) {
                context.setAttribute("x", x);
                context.setAttribute("y", y);
                context.setAttribute("r", r);

                req.getRequestDispatcher("/areaCheck").forward(req, resp);
//                resp.sendRedirect("./checkArea?" + req.getQueryString());
            } else {
                req.setAttribute("error", "Переданные значения не валидны");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("error", "Среди переданных параметров присутствует некорректное значение:\n" +
                    "x = " + req.getParameter("x") +
                    "y = " + req.getParameter("y") +
                    "r = " + req.getParameter("r"));

            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    private static boolean validate(double x, double y, double r) {
        int[] valuesX = {-3, -2, -1, 0, 1, 2, 3, 4, 5};
        double[] valuesR = {1, 1.5, 2, 2.5, 3};

        if (Arrays.stream(valuesX).noneMatch(value -> value == x)) return false;
        if (y < -5 || y > 5) return false;
        return Arrays.stream(valuesR).anyMatch(value -> value == r);
    }
}