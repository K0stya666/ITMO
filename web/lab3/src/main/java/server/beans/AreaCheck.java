package server.beans;

import jakarta.ejb.Stateless;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import lombok.Getter;
import lombok.Setter;
import server.models.Point;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

@Getter
@Setter
@Stateless
@Named("controllerBean")
public class AreaCheck implements Serializable {
    private static final Logger logger = Logger.getLogger(AreaCheck.class.getName());

//    @Inject
    @PersistenceContext(unitName = "PointCheckerPU")
    private EntityManager em;

    @Getter
    @Setter
    private double x;
    @Getter
    @Setter
    private double y;
    @Getter
    @Setter
    private double r;
    private List<Integer> xValues = Arrays.asList(-3, -2, -1, 0, 1, 2, 3, 4, 5);

    public boolean checkHit(double x, double y, double r) {
        return true;
    }


//    public void setX(double x) {
//        this.x = x;
//    }
//    public double getX() {
//        return x;
//    }

    public List<Integer> getxValues() {
        return xValues;
    }



    @Transactional
    public String saveToDB() {
        try {
            var isHit = checkHit(x, y, r);
            Point point = new Point(x, y, r, isHit);
//            em.getTransaction().begin();
            logger.info("x=" + x + ", y=" + y + ", r=" + r + ", isHit=" + isHit);
            em.persist(point);
//            em.merge(point);
            em.flush();


            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Успех", "Данные сохранены."));
            logContextInfo();
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка", "Не удалось сохранить данные."));
            e.printStackTrace();
        }
        return null;
    }

    public void logContextInfo() {
        FacesContext context = FacesContext.getCurrentInstance();
        testConnection();
        if (context != null) {
            // Логируем параметры запроса
            context.getExternalContext().getRequestParameterMap()
                    .forEach((key, value) -> logger.info("Request Parameter - " + key + ": " + value));

            // Логируем атрибуты сессии
            context.getExternalContext().getSessionMap()
                    .forEach((key, value) -> logger.info("Session Attribute - " + key + ": " + value));

            // Добавление тестового сообщения
            context.addMessage(null, new FacesMessage("Тестовое сообщение для отладки"));
        }
    }

    public void testConnection() {
        try {
            this.em.createNativeQuery("SELECT 1").getSingleResult();
//            System.out.println("Connection to database successful!");
            logger.info("Connection to database successful!");
        } catch (Exception e) {
            System.err.println("Failed to connect to the database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
