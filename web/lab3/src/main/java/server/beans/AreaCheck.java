package server.beans;

import jakarta.ejb.Stateless;
import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import server.models.Point;

import java.io.Serializable;
import java.util.logging.Logger;

//@Stateless
@Named("controllerBean")
@RequestScoped
public class AreaCheck implements Serializable {
    private static final Logger logger = Logger.getLogger(AreaCheck.class.getName());

    @PersistenceContext(unitName = "PointCheckerPU")
    private EntityManager em;

    private double x;
    private double y;
    private double r;

//    private boolean isHit = true;



    public void setX(double x) {
        this.x = x;
    }
    public double getX() {
        return x;
    }

    public void setY(double y) {
        this.y = y;
    }
    public double getY() {
        return y;
    }

    public void setR(double r) {
        this.r = r;
    }
    public double getR() {
        return r;
    }

    public boolean checkHit(double x, double y, double r) {
        return true;
    }

    @Transactional
    public String saveToDB() {
        try {
            var isHit = checkHit(x, y, r);
            Point point = new Point(x, y, r, isHit);
            logger.info("x=" + x + ", y=" + y + ", r=" + r + ", isHit=" + isHit);
            em.persist(point);
//            em.merge(point);
            em.flush();


            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Успех", "Данные сохранены."));
            logContextInfo();
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Ошибка", "Не удалось сохранить данные."));
//            e.printStackTrace();
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
