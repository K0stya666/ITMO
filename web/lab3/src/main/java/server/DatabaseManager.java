package server;

import jakarta.annotation.PreDestroy;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import server.models.Point;
import java.util.List;
import java.util.stream.Stream;

public class DatabaseManager {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PointCheckerPU");
    EntityManager em = emf.createEntityManager();

    public DatabaseManager() {
        em.getTransaction().begin();
    }

    public void addPoints(List<Point> points) {
        try {
            Stream.of(points).forEach(point -> em.persist(point));
            em.getTransaction().commit();
        } catch (Exception e) { em.getTransaction().rollback(); }
    }

    public List<Point> getPoints() {
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
