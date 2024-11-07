package server.beans;

import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import lombok.Getter;
import lombok.Setter;
import server.models.Point;

import java.io.Serial;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@Getter
@Setter
@SessionScoped
@Named("areaCheck")
public class AreaCheckBean implements Serializable {
    private static final Logger logger = Logger.getLogger(AreaCheckBean.class.getName());

    @Serial
    private static final long serialVersionUID = 1L;

    private double x;
    private double y;
    private double r;
    private boolean isHit;

    private List<Integer> XValues = Arrays.asList(-3, -2, -1, 0, 1, 2, 3, 4, 5);
    private List<Point> points;

    @PersistenceContext(unitName = "PointCheckerPU")
    private EntityManager em;

    @PostConstruct
    public void init() {
        loadPoints();
    }

    private void loadPoints() {
        points = em.createQuery("select p from Point p order by p.date", Point.class).getResultList();
    }

    @Transactional
    private void addPoint(Point point) {
        try {
            em.persist(point);
            loadPoints();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    public boolean checkHit() {
        Point point = new Point(x, y, r, isHit);
        addPoint(point);
        return true;
    }
}
