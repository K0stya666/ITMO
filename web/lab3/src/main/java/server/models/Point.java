package server.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

@Entity
@Table(name = "points")
public class Point {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @NotNull
    @Column(name = "X", nullable = false)
    private double x;

    @NotNull
    @Column(name = "Y", nullable = false)
    private double y;

    @NotNull
    @Column(name = "R", nullable = false)
    private double r;

    @NotNull
    @Column(name = "Hit", nullable = false)
    private boolean isHit;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Date", nullable = false)
    private LocalDate date;

    public Point(double x, double y, double r, boolean isHit, LocalDate date) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isHit = isHit;
        this.date = LocalDate.now();
    }

    public double getX() { return x; }
    public double getY() { return y; }
    public double getR() { return r; }
    public boolean isHit() { return isHit; }
    public LocalDate getDate() { return date; }

    public void setX(double x) { this.x = x; }
    public void setY(double y) { this.y = y; }
    public void setR(double r) { this.r = r; }
    public void setHit(boolean hit) { this.isHit = hit; }
    public void setDate(LocalDate date) { this.date = date; }
}
