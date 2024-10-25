package server.beans;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;

@RequestScoped
@Named("controllerBean")
public class ControllerBean {
    private double x;
    private double y;
    private double r;
    private boolean isSubmit;

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

    public void submit() {
        isSubmit = true;
    }
}
