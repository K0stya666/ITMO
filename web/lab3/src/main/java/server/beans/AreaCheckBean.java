package server.beans;

import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import lombok.Getter;
import lombok.Setter;
import server.models.Point;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

@Getter
@Setter
@SessionScoped
@Named("areaCheck")
public class AreaCheckBean implements Serializable {
    private static final Logger logger = Logger.getLogger(AreaCheckBean.class.getName());

    private static final long serialVersionUID = 1L;

    private double x;
    private double y;
    private double r;

    private List<Integer> XValues = Arrays.asList(-3, -2, -1, 0, 1, 2, 3, 4, 5);
    private List<Point> points;

    @PostConstruct
    public void init() {
        x = 0;
        y = 0;
        r = 5;

        //

        if (points == null) {
            points = new ArrayList<>();
        }
    }

    public String submit() {
        logger.info("PIDORS LOOK!! POINT SUBMITTED!!!");
        Point point = new Point(x, y, r);
        points.add(point);
        logger.info("ZOEBIS'!! POINT added");
        return null;
    }

}