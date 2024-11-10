import jakarta.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import server.models.Point;

import java.util.List;

public class HibernateExampleTest {
    private SessionFactory sessionFactory;

    @BeforeEach
    protected void setUp() {
        // A SessionFactory is set up once for an application!
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        try {
            sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
        }
        catch (Exception e) {
            // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
            // so destroy it manually.
            StandardServiceRegistryBuilder.destroy( registry );
            e.printStackTrace();
            throw e;
        }
    }

    @AfterEach
    protected void tearDown() throws Exception {
        if ( sessionFactory != null ) {
            sessionFactory.close();
        }
    }


    @Test
    public void addPoint(){
        Point point = new Point(1, 1, 1, true);
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(point);
            session.getTransaction().commit();
        }
    }

    @Test
    public void clearTable(){
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.createQuery("delete from Point").executeUpdate();
            session.getTransaction().commit();
        }
    }

    @Test
    public void getPoints() {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            TypedQuery<Point> query = session.createQuery("from Point", Point.class);
            for (Point point : query.getResultList()) {
                System.out.println(point);
            }
        }
    }
}