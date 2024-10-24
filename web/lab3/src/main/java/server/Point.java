package server;

import java.time.LocalDate;

public class Point {
    private final double x;
    private final double y;
    private final double r;
    private final boolean isHit;
    private final LocalDate date;

    public Point(double x, double y, double r, boolean isHit, LocalDate date) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isHit = isHit;
        this.date = date;
    }

    public double getX() { return x; }
    public double getY() { return y; }
    public double getR() { return r; }
    public boolean isHit() { return isHit; }
    public LocalDate getDate() { return date; }
}
