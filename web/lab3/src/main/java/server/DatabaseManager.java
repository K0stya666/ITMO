package server;

import jakarta.annotation.PreDestroy;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import server.models.Point;
import java.util.List;
import java.util.stream.Stream;

public class DatabaseManager {
    Logger logger = LoggerFactory.getLogger(DatabaseManager.class);

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PointCheckerPU");
    EntityManager em = emf.createEntityManager();

    public DatabaseManager() {
        logger.info("DatabaseManager created");
    }

    public void addPoints(List<Point> points) {
        if (!em.getTransaction().isActive()) em.getTransaction().begin();
        try {
            Stream.of(points).forEach(point -> em.persist(point));
            em.getTransaction().commit();
            logger.info("ZOEBIS'!! POINT added");
        } catch (Exception e) {
            logger.error("PIZDEC'!! POINT not added");
            e.printStackTrace();
        }
    }

    public List<Point> getPoints() {
        if (!em.getTransaction().isActive()) em.getTransaction().begin();
        try {
            TypedQuery<Point> query = em.createQuery("select p from Point p", Point.class);
            return query.getResultList();
        } catch (Exception e) { em.getTransaction().rollback(); throw e; }
    }

    @PreDestroy
    public void clean() {
        if (em.isOpen() && em != null) em.close();
        if (emf.isOpen() && emf != null) emf.close();
    }
}
