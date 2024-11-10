package server.beans;

import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import lombok.Getter;
import lombok.Setter;
import org.slf4j.LoggerFactory;
import server.DatabaseManager;
import server.models.Point;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;

@Getter
@Setter
@SessionScoped
@Named("areaCheck")
public class AreaCheckBean implements Serializable {
    private static final Logger logger = LoggerFactory.getLogger(AreaCheckBean.class);

    private static final long serialVersionUID = 1L;
    private DatabaseManager db = new DatabaseManager();

    private double x;
    private double y;
    private double r;
    private boolean hit;

    private List<Integer> XValues = Arrays.asList(-3, -2, -1, 0, 1, 2, 3, 4, 5);
    private List<Point> points;

    @PostConstruct
    public void init() {
        x = 0;
        y = 0;
        r = 5;

        if (points == null) { points = new ArrayList<>(); }

        points = db.getPoints();
    }

    public String submit() {
        logger.info("PIDORS LOOK!! POINT SUBMITTED!!!");

        hit = checkHit(x, y, r);
        Point point = new Point(x, y, r, hit);

        points.add(point);
        db.addPoints(points);

        return null;
    }

    private boolean checkHit(double x, double y, double r) {
        return true;
    }
}
