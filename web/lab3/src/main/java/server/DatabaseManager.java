package server;

import jakarta.annotation.PreDestroy;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.SessionFactoryBuilder;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import server.models.Point;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Stream;

@Stateless
public class DatabaseManager implements Serializable {
    private static final long serialVersionUID = 1L;
    private SessionFactory sessionFactory;

    Logger logger = LoggerFactory.getLogger(DatabaseManager.class);

//    @PersistenceContext(unitName = "puris")
//    EntityManager em;

    public DatabaseManager() {
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

        try {
            sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        } catch (Exception e) {
            StandardServiceRegistryBuilder.destroy(registry);
            e.printStackTrace();
            throw e;
        }
    }

    public void addPoint(Point point){
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(point);
            session.getTransaction().commit();
        }
    }

    public List<Point> getPoints() {
//        try {
//            TypedQuery<Point> query = em.createQuery("select p from Point p", Point.class);
//            return query.getResultList();
//        } catch (Exception e) {
//            throw e; }

        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            TypedQuery<Point> query = session.createQuery("from Point", Point.class);
            return query.getResultList();
        }
    }

    @PreDestroy
    public void clean() {
        sessionFactory.close();
    }
}
